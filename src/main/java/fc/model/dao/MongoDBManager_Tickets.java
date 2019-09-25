package fc.model.dao;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import fc.model.*;
import java.util.ArrayList;
import org.bson.Document;

//Sets up the structure of Ticket collection and manages it
public class MongoDBManager_Tickets extends MongoDBConnector {
     
    //Adds a new ticket to the Ticket collection
     public void add(Ticket ticket) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            ticketDB.insertOne(convertToDoc(ticket)); //Convert ticket's details to MongoDB's format
        }
    }
    
    //Removes an existing ticket from the Ticket collection
    public void remove(Ticket ticket) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            ticketDB.deleteOne(convertToDoc(ticket)); //Convert ticket's details to MongoDB's format
        }
    }
    
    //Updates the current ticket to the new ticket
    public void update(String id, String customerID, String flightID, String passengerSeatNum){
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)){
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> collection = db.getCollection(TICKET_COLLECTION);
            Document query =  new Document();
            query.append("id", id); //The ticket to be updated
            Document setData = new Document(); //The new details
            setData.append("id", id)
                    .append("customer_id", customerID)
                    .append("flight_id", flightID)
                    .append("passenger_seat_num", passengerSeatNum);
            Document update = new Document();
            update.append("$set", setData); //Add new details to an updated document
            collection.updateOne(query, update); //Merge updated details with ticket ID and update in collection
        }
    }
    
    //Fetches a single existing ticket from Ticket collection by matching ID
    public Ticket getTicket(String id) {
        MongoClientURI uri = generateURI();
        Ticket ticket;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            Document doc = ticketDB.find(and(eq("id", id))).first();
            ticket = convertToTicket(doc); //Convert ticket's details to String format
        } catch(NullPointerException x){ //Catch exception and return null if no matching ticket is found
            return null;
        }
        return ticket;
    }
    
    //Fetches a single existing ticket for the customer specified
    public Ticket getTicket(Customer customer) {
        MongoClientURI uri = generateURI();
        Ticket ticket;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            Document doc = ticketDB.find(and(eq("customer_id", customer.getID()))).first();
            ticket = convertToTicket(doc); //Convert ticket's details to String format
        } catch(NullPointerException x) { //Catch exception and return null if no matching ticket is found
            return null;
        }
        return ticket;
    }
    
    //Fetches all existing tickets in the Ticket collection
    public ArrayList<Ticket> getTickets() {
        MongoClientURI uri = generateURI();
        ArrayList<Ticket> tickets;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            tickets = new ArrayList<>();
            MongoCollection<Document> ticketlist = db.getCollection(TICKET_COLLECTION);
            for (Document doc : ticketlist.find()) {
                Ticket ticket = convertToTicket(doc); //Convert ticket's details to String format
                tickets.add(ticket);
            }
        } catch(NullPointerException x){ //Catch exception and return null if Ticket collection is empty
            return null;
        }
        return tickets; //ArrayList of all tickets in the Ticket collection
    }
    
    //Fetches all tickets for the customer specified
    public ArrayList<Ticket> getTickets(Customer customer) {
        MongoClientURI uri = generateURI();
        ArrayList<Ticket> tickets;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            tickets = new ArrayList<>();
            MongoCollection<Document> ticketlist = db.getCollection(TICKET_COLLECTION);
            for (Document doc : ticketlist.find()) {
                Ticket ticket = convertToTicket(doc); //Convert ticket's details to String format
                if (ticket.getCustomerID().equals(customer.getID())) {
                    tickets.add(ticket);
                }
            }
        } catch(NullPointerException x){ //Catch exception and return null if no matching tickets are found
            return null;
        }
        return tickets; //ArrayList of all relevant tickets in the Ticket collection
    }
    
    //Fetches all tickets booked for the flight specified
    public ArrayList<Ticket> getTickets(Flight flight) {
        MongoClientURI uri = generateURI();
        ArrayList<Ticket> tickets;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            tickets = new ArrayList<>();
            MongoCollection<Document> ticketlist = db.getCollection(TICKET_COLLECTION);
            for (Document doc : ticketlist.find()) {
                Ticket ticket = convertToTicket(doc);
                if (ticket.getCustomerID().equals(flight.getID())) {
                    tickets.add(ticket);
                }
            }
        } catch(NullPointerException x){ //Catch exception and return null if no matching tickets are found
            return null;
        }
        return tickets; //ArrayList of all relevant tickets in the Ticket collection
    }
    
    //Converts ticket's details to String format for procressing by Java code
    private Ticket convertToTicket(Document doc) {
        return new Ticket((String) doc.get("id"),
                (String) doc.get("customer_id"),
                (String) doc.get("flight_id"),
                (String) doc.get("passenger_seat_num"));
    }
    
    //Converts flight's details to document format for storing in MongoDB
    private Document convertToDoc(Ticket ticket) {
        return new Document("id", ticket.getID())
                .append("customer_id", ticket.getCustomerID())
                .append("flight_id", ticket.getFlightID())
                .append("passenger_seat_num", ticket.getPassengerSeatNum());
    }
}
