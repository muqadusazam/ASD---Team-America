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

//Sets up the structure of Flight collection and manages it
public class MongoDBManager_Flights extends MongoDBConnector {
    
    //Adds a new flight to the Flight collection
    public void add(Flight flight) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightDB = db.getCollection(FLIGHT_COLLECTION);
            flightDB.insertOne(convertToDoc(flight)); //Convert flight's details to MongoDB's format
        }
    }
    
    //Remove an existing flight from the Flight collection
    public void remove(Flight flight) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightDB = db.getCollection(FLIGHT_COLLECTION);
            flightDB.deleteOne(convertToDoc(flight)); //Convert flight's details to MongoDB's format
        }
    }
    public void update(Flight flight) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)){
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> collection = db.getCollection(FLIGHT_COLLECTION);
            Document query =  new Document();
            query.append("id", flight.getID()); //The ticket to be updated
            Document setData = new Document(); //The new details
            setData.append("id", flight.getID());
            setData.append("airline", flight.getAirline());
            setData.append("origin", flight.getOrigin());
            setData.append("destination", flight.getDestination());
            setData.append("departure_time", flight.getDepartureTime());
            setData.append("departure_date", flight.getDepartureDate());
            setData.append("arrival_time", flight.getArrivalTime());
            setData.append("arrival_date", flight.getArrivalDate());
            setData.append("status", flight.getStatus());
            setData.append("price", flight.getPrice());
            setData.append("available_seats", flight.getAvailableSeats());
            Document update = new Document();
            update.append("$set", setData); //Add new details to an updated document
            collection.updateOne(query, update); //Merge updated details with ticket ID and update in collection
        }
    }
    
    //Fetches a single existing flight from the Flight collection by matching ID
    public Flight getFlight(String id) {
        MongoClientURI uri = generateURI();
        Flight flight;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> flightDB = db.getCollection(FLIGHT_COLLECTION);
            Document doc = flightDB.find(and(eq("id", id))).first();
            flight = convertToFlight(doc); //Convert flight's details to String format
        } catch(NullPointerException x){ //Catch exception and return null if flight does not exist
            return null;
        }
        return flight;
    }
    
    //Fetches all flights from the Flight collection
    public ArrayList<Flight> getFlights() {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc); //Convert flight's details to String format
                flights.add(flight);
            }
        } catch(NullPointerException x){ //Catch exception and return null if Flight collection is empty
            return null;
        }
        return flights; //ArrayList of all flights in the Flight collection
    }
    
    //Fetches all flights matching destination and flight ID
    public ArrayList<Flight> getFlights(Flight flight) {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight f = convertToFlight(doc); //Convert flight's details to String format
                if (f.getDestination().equals(flight.getDestination()) && f.getID() != flight.getID()) {
                    flights.add(f);
                }
            }
        } catch (NullPointerException x) { //Catch exception and return null if Flight collection is empty
            return null;
        }
        return flights; //ArrayList of all relevant flights in the Flight collection
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
    
    //Fetches all flights matching the specified destination
    public ArrayList<Flight> getFlightsByDestination(String destination) {
        MongoClientURI uri = generateURI();
        ArrayList<Flight> flights;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            flights = new ArrayList<>();
            MongoCollection<Document> flightlist = db.getCollection(FLIGHT_COLLECTION);
            for (Document doc : flightlist.find()) {
                Flight flight = convertToFlight(doc); //Convert flight's details to String format
                if (flight.getDestination().equals(destination)) {
                    flights.add(flight);
                }
            }
        } catch(NullPointerException x){ //Catch exception and return null if no matching flights are found
            return null;
        }
        return flights; //ArrayList of all relevant flights in the Flight collection
    }
    
    //Converts flight's details to String format for procressing by Java code
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
    
    //Converts flight's details to document format for storing in MongoDB
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
