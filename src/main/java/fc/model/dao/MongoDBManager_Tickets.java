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

/**
 *
 * @author Liam
 */
public class MongoDBManager_Tickets extends MongoDBConnector {
    
     public void add(Ticket ticket) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            ticketDB.insertOne(convertToDoc(ticket));
        }
    }
    
    public void remove(Ticket ticket) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            ticketDB.deleteOne(convertToDoc(ticket));
        }
    }
    
    public Ticket getTicket(String id) {
        MongoClientURI uri = generateURI();
        Ticket ticket;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            Document doc = ticketDB.find(and(eq("id", id))).first();
            ticket = convertToTicket(doc);
        } catch (NullPointerException ex) {
            return null;
        }
        return ticket;
    }
    
    public Ticket getTicket(Customer customer) {
        MongoClientURI uri = generateURI();
        Ticket ticket;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> ticketDB = db.getCollection(TICKET_COLLECTION);
            Document doc = ticketDB.find(and(eq("customer_id", customer.getID()))).first();
            ticket = convertToTicket(doc);
        } catch (NullPointerException ex) {
            return null;
        }
        return ticket;
    }
    
    public ArrayList<Ticket> getTickets() {
        MongoClientURI uri = generateURI();
        ArrayList<Ticket> tickets;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            tickets = new ArrayList<>();
            MongoCollection<Document> ticketlist = db.getCollection(TICKET_COLLECTION);
            for (Document doc : ticketlist.find()) {
                Ticket ticket = convertToTicket(doc);
                tickets.add(ticket);
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return tickets;
    }
    
    public ArrayList<Ticket> getTickets(Customer customer) {
        MongoClientURI uri = generateURI();
        ArrayList<Ticket> tickets;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            tickets = new ArrayList<>();
            MongoCollection<Document> ticketlist = db.getCollection(TICKET_COLLECTION);
            for (Document doc : ticketlist.find()) {
                Ticket ticket = convertToTicket(doc);
                if (ticket.getCustomerID().equals(customer.getID())) {
                    tickets.add(ticket);
                }
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return tickets;
    }
    
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
        } catch (NullPointerException ex) {
            return null;
        }
        return tickets;
    }
    
    private Ticket convertToTicket(Document doc) {
        return new Ticket((String) doc.get("id"),
                (String) doc.get("customer_id"),
                (String) doc.get("flight_id"),
                (String) doc.get("passenger_seat_num"));
    }
    
    private Document convertToDoc(Ticket ticket) {
        return new Document("id", ticket.getID())
                .append("customer_id", ticket.getCustomerID())
                .append("flight_id", ticket.getFlightID())
                .append("passenger_seat_num", ticket.getPassengerSeatNum());
    }
}
