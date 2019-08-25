package fc.model.dao;

import java.net.UnknownHostException;
import com.mongodb.client.MongoCollection;
import org.bson.Document;
import java.util.*;
import fc.model.*;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

/**
 *
 * @author Liam
 */
public class MongoDBConnector {
    
    private static final String KEY = "@ds029496.mlab.com:29496/heroku_59pxdn6j"; 
    private static final String CUSTOMERS = "ASD---Team-America-Customers";
    private static final String TICKETS = "ASD---Team-America-Tickets";
    private static final String FLIGHTS = "ASD---Team-America-Flights";
    
    private String owner;
    private String password;
    
    private List<Document> customers = new ArrayList();
    private List<Document> tickets = new ArrayList();
    private List<Document> flights = new ArrayList();
    
    public MongoDBConnector(String owner, String password) throws UnknownHostException {
        this.owner = owner;
        this.password = password;
    }
    
    private MongoClientURI generateURI() {
        return new MongoClientURI("mongodb://" + this.owner + ":" + this.password + this.KEY);
    }
    
    public MongoDatabase getMongoDB(){
       MongoClientURI uri = generateURI();
       MongoDatabase db;
       try (MongoClient client = new MongoClient(uri)) {
            db = client.getDatabase(uri.getDatabase());
       }
       return db;
    }
    
    public void add(Customer customer) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            customers.add(generateDoc(customer));
            MongoCollection<Document> customerList = db.getCollection(CUSTOMERS); //Create a collection on mLab
            customerList.insertMany(customers);
        }
    }
    
    private Document generateDoc(Customer customer) {
        return new Document("customer_id", customer.getID())
                .append("first_name", customer.getFirstName())
                .append("last_name", customer.getLastName())
                .append("email", customer.getEmail())
                .append("password", customer.getPassword())
                .append("dob", customer.getDOB());
    }
    
    public void showCustomers() {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerList = db.getCollection(CUSTOMERS);
            try (MongoCursor<Document> cursor = customerList.find().iterator()) {
                while (cursor.hasNext()) {
                    System.out.println(cursor.next().toJson());
                }
            }
        }
    }
    
    public Customers loadCustomers() {
        MongoClientURI uri = generateURI();
        Customers customers;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            customers = new Customers();
            MongoCollection<Document> customerlist = db.getCollection(CUSTOMERS);
            for (Document doc : customerlist.find()) {
                Customer customer = convertToCustomer(doc);
                customers.addCustomer(customer);
            }
        }
        return customers;
    }
    
    public Customer customer(String id) {
        MongoClientURI uri = generateURI();
        Customer customer;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightList = db.getCollection(CUSTOMERS);
            Document doc = flightList.find(and(eq("id", id))).first();
            customer = convertToCustomer(doc);
        }
        return customer;
    }
    
    public Customer customer(String email, String password) {
        MongoClientURI uri = generateURI();
        Customer customer;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerList = db.getCollection(CUSTOMERS);
            Document doc = customerList.find(and(eq("email", email), eq("password", password))).first();
            customer = convertToCustomer(doc);
        }
        return customer;
    }
    
    private Customer convertToCustomer(Document doc) {
        return new Customer((String) doc.get("id"),
                (String) doc.get("first_name"),
                (String) doc.get("last_name"),
                (String) doc.get("email"),
                (String) doc.get("password"),
                (String) doc.get("dob"));
    }
    
    public void add(Flight flight) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            customers.add(generateDoc(flight));
            MongoCollection<Document> flightList = db.getCollection(FLIGHTS); //Create a collection on mLab
            flightList.insertMany(customers);
        }
    }
    
    private Document generateDoc(Flight flight) {
        return new Document("id", flight.getID())
                .append("airline", flight.getAirline())
                .append("origin", flight.getOrigin())
                .append("destination", flight.getDestination())
                .append("departure_time", flight.getDepartureTime())
                .append("departure_date", flight.getDepartureDate())
                .append("arrival_time", flight.getArrivalTime())
                .append("arrival_date", flight.getArrivalDate())
                .append("status", flight.getStatus())
                .append("price", flight.getPrice())
                .append("available_seats", flight.getAvailableSeats());
    }
    
    public void showFlights() {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerList = db.getCollection(FLIGHTS);
            try (MongoCursor<Document> cursor = customerList.find().iterator()) {
                while (cursor.hasNext()) {
                    System.out.println(cursor.next().toJson());
                }
            }
        }
    }
    
    public Flights loadFlights() {
        MongoClientURI uri = generateURI();
        Flights flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new Flights();
            MongoCollection<Document> customerlist = db.getCollection(FLIGHTS);
            for (Document doc : customerlist.find()) {
                Flight flight = convertToFlight(doc);
                flights.addFlight(flight);
            }
        }
        return flights;
    }
    
    public Flight flight(String id) {
        MongoClientURI uri = generateURI();
        Flight flight;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightList = db.getCollection(FLIGHTS);
            Document doc = flightList.find(and(eq("id", id))).first();
            flight = convertToFlight(doc);
        }
        return flight;
    }
    
    private Flight convertToFlight(Document doc) {
        return new Flight((String) doc.get("id"),
                (String) doc.get("airline"),
                (String) doc.get("origin"),
                (String) doc.get("destination"),
                (String) doc.get("departure_time"),
                (String) doc.get("departure_date"),
                (String) doc.get("arrival_time"),
                (String) doc.get("arrival_date"),
                (String) doc.get("status"),
                (String) doc.get("price"),
                (String) doc.get("available_seats"));
    }
    
    public void add(Ticket ticket) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            customers.add(generateDoc(ticket));
            MongoCollection<Document> customerList = db.getCollection(TICKETS); //Create a collection on mLab
            customerList.insertMany(customers);
        }
    }
    
    private Document generateDoc(Ticket ticket) {
        return new Document("id", ticket.getID())
                .append("customer_id", ticket.getCustomerID())
                .append("flight_id", ticket.getFlightID())
                .append("passenger_first_name", ticket.getPassengerFirstName())
                .append("passenger_last_name", ticket.getPassengerLastName())
                .append("passenger_dob", ticket.getPassengerDOB())
                .append("passenger_seat_num", ticket.getPassengerSeatNum());
    }
    
    public void showTickets() {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerList = db.getCollection(TICKETS);
            try (MongoCursor<Document> cursor = customerList.find().iterator()) {
                while (cursor.hasNext()) {
                    System.out.println(cursor.next().toJson());
                }
            }
        }
    }
    
    public Tickets loadTickets() {
        MongoClientURI uri = generateURI();
        Tickets tickets;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            tickets = new Tickets();
            MongoCollection<Document> customerlist = db.getCollection(TICKETS);
            for (Document doc : customerlist.find()) {
                Ticket ticket = convertToTicket(doc);
                tickets.addTicket(ticket);
            }
        }
        return tickets;
    }
    
    public Ticket ticket(String id) {
        MongoClientURI uri = generateURI();
        Ticket ticket;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketList = db.getCollection(TICKETS);
            Document doc = ticketList.find(and(eq("id", id))).first();
            ticket = convertToTicket(doc);
        }
        return ticket;
    }
    
    private Ticket convertToTicket(Document doc) {
        return new Ticket((String) doc.get("id"),
                (String) doc.get("customer_id"),
                (String) doc.get("flight_id"),
                (String) doc.get("passenger_first_name"),
                (String) doc.get("passenger_last_name"),
                (String) doc.get("passenger_dob"),
                (String) doc.get("passenger_seat_num"));
    }
}
