package fc.model.dao;

import com.mongodb.client.MongoCollection;
import org.bson.Document;
import java.util.*;
import fc.model.*;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

/**
 *
 * @author Liam
 */
public class MongoDBManager_Flights extends MongoDBConnector {
    
    public void add(Flight flight) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightDB = db.getCollection(FLIGHT_COLLECTION);
            flightDB.insertOne(convertToDoc(flight));
        }
    }
    
    public void remove(Flight flight) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightDB = db.getCollection(FLIGHT_COLLECTION);
            flightDB.deleteOne(convertToDoc(flight));
        }
    }
    
    public Flight getFlight(String id) {
        MongoClientURI uri = generateURI();
        Flight flight;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightDB = db.getCollection(FLIGHT_COLLECTION);
            Document doc = flightDB.find(and(eq("id", id))).first();
            flight = convertToFlight(doc);
        } catch (NullPointerException ex) {
            return null;
        }
        return flight;
    }
    
    
    public ArrayList<Flight> getFlights() {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc);
                flights.add(flight);
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return flights;
    }
    
    public ArrayList<Flight> getFlightsByDestination(String destination) {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc);
                if (flight.getDestination().equals(destination)) {
                    flights.add(flight);
                }
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return flights;
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
    
    private Document convertToDoc(Flight flight) {
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
}
