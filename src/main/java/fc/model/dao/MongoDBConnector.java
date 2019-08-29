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
    
    private static final String OWNER = "admin";
    private static final String PASSWORD = "qwerty123";
    private static final String KEY = "@ds263927.mlab.com:63927/heroku_dlsrflnl"; 
    
    private static final String CUSTOMER_COLLECTION = "ASD.Customers(LIAM)";
    private static final String TICKET_COLLECTION   = "ASD.Tickets(LIAM)";
    private static final String FLIGHT_COLLECTION  = "ASD.Flights(LIAM)";
    
    private List<Document> customers = new ArrayList();
    private List<Document> tickets = new ArrayList();
    private List<Document> flights = new ArrayList();
    
    private MongoClientURI generateURI() {
        return new MongoClientURI("mongodb://" + this.OWNER + ":" + this.PASSWORD + this.KEY);
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
            MongoCollection<Document> customerList = db.getCollection(CUSTOMER_COLLECTION); //Create a collection on mLab
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
            MongoCollection<Document> customerList = db.getCollection(CUSTOMER_COLLECTION);
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
            MongoCollection<Document> customerlist = db.getCollection(CUSTOMER_COLLECTION);
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
            MongoCollection<Document> flightList = db.getCollection(CUSTOMER_COLLECTION);
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
            MongoCollection<Document> customerList = db.getCollection(CUSTOMER_COLLECTION);
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
            MongoCollection<Document> flightList = db.getCollection(FLIGHT_COLLECTION); //Create a collection on mLab
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
            MongoCollection<Document> customerList = db.getCollection(FLIGHT_COLLECTION);
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
            MongoCollection<Document> customerlist = db.getCollection(FLIGHT_COLLECTION);
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
            MongoCollection<Document> flightList = db.getCollection(FLIGHT_COLLECTION);
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
            MongoCollection<Document> customerList = db.getCollection(TICKET_COLLECTION); //Create a collection on mLab
            customerList.insertMany(customers);
        }
    }
    
    private Document generateDoc(Ticket ticket) {
        return new Document("id", ticket.getID())
                .append("customer_id", ticket.getCustomerID())
                .append("flight_id", ticket.getFlightID())
                .append("passenger_seat_num", ticket.getPassengerSeatNum());
    }
    
    public void showTickets() {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerList = db.getCollection(TICKET_COLLECTION);
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
            MongoCollection<Document> customerlist = db.getCollection(TICKET_COLLECTION);
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
            MongoCollection<Document> ticketList = db.getCollection(TICKET_COLLECTION);
            Document doc = ticketList.find(and(eq("id", id))).first();
            ticket = convertToTicket(doc);
        }
        return ticket;
    }
    
    private Ticket convertToTicket(Document doc) {
        return new Ticket((String) doc.get("id"),
                (String) doc.get("customer_id"),
                (String) doc.get("flight_id"),
                (String) doc.get("passenger_seat_num"));
    }
}
