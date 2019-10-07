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
    
    public ArrayList<Flight> getFlights(Flight flight) {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight f = convertToFlight(doc);
                if (f.getDestination().equals(flight.getDestination()) && f.getID() != flight.getID()) {
                    flights.add(f);
                }
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return flights;
    }
    
    //Return a list of origins from all of the available flights
     public ArrayList<String> getAllOrigins() {
        MongoClientURI uri = generateURI();
        ArrayList<String> origins = new ArrayList<String>();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc);
                if (!origins.contains(flight.getOrigin())) {        //Checks if flight's origin is already included within arrayList
                    origins.add(flight.getOrigin());                   //If not then add to list
                }
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return origins;
    } 
    
    //Return a list of destinations from all the available flights
     public ArrayList<String> getAllDestinations() {
        MongoClientURI uri = generateURI();
        ArrayList<String> destinations = new ArrayList<String>();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc);
                if (!destinations.contains(flight.getDestination())) {      //Checks if flight's origin is already included within arrayList
                    destinations.add(flight.getDestination());                 //If not then add to list
                }
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return destinations;
    } 
    
    //Returns a list of flights whose origin matches the 'origin' parameter
    public ArrayList<Flight> getFlightsByOrigin(String origin) {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc);
                if (flight.getOrigin().equals(origin)) {
                    flights.add(flight);
                }
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
    
    public ArrayList<Flight> getFlightsByOriginAndDestination(String origin, String destination) {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc);
                if (flight.getOrigin().equals(origin) && flight.getDestination().equals(destination)) {
                    flights.add(flight);
                }
            }
        } catch (NullPointerException ex) {
            return null;
        }
        return flights;
    }
    
    //public ArrayList<Flight> getFlightsBeforeDate
    
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
