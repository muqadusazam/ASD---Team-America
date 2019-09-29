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

//Sets up the structure of Customer collection and manages it
public class MongoDBManager_Customers extends MongoDBConnector {
    
    //Adds a new customer to the Customer collection
    public void add(Customer customer) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            customerDB.insertOne(convertToDoc(customer)); //Convert customer's details to MongoDB's format
        }
    }
    
    //Removes an existing customer from the Customer collection
    public void remove(Customer customer) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            customerDB.deleteOne(convertToDoc(customer)); //Convert customer's details to MongoDB's format
        }
    }
    
    //Fetches a single existing customer from the Customer collection by matching ID
    public Customer getCustomer(String id) {
        MongoClientURI uri = generateURI();
        Customer customer;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            Document doc = customerDB.find(eq("id", id)).first();
            customer = convertToCustomer(doc); //Convert customer's details to String format
        } catch(NullPointerException x){ //Catch exception and return null if customer does not exist
            return null;
        }
        return customer;
    }
    
    //Fetches a single existing customer from the Customer collection by matching email and password
    public Customer getCustomer(String email, String password) {
        MongoClientURI uri = generateURI();
        Customer customer;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            Document doc = customerDB.find(and(eq("email", email), eq("password", password))).first();
            customer = convertToCustomer(doc);
        } catch(NullPointerException x){ //Catch exception and return null if customer does not exist
            return null;
        }
        return customer;
    }
    
    //Fetches all customers from the Customer collection
    public ArrayList<Customer> getCustomers() {
        MongoClientURI uri = generateURI();
        ArrayList<Customer> customers;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            customers = new ArrayList<>();
            MongoCollection<Document> customerlist = db.getCollection(CUSTOMER_COLLECTION);
            for (Document doc : customerlist.find()) {
                Customer customer = convertToCustomer(doc); //Convert customer's details to String format
                customers.add(customer);
            }
        } catch(NullPointerException x){ //Catch exception and return null if Customer collection is empty
            return null;
        }
        return customers; //ArrayList of all customers in Customer collection
    }
    
    //Changes a customer's current profile details in the Customer collection
    public void editCustomer(String id, String firstName, String lastName, String email, String password, String passport, String DOB){
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)){
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> collection = db.getCollection(CUSTOMER_COLLECTION);
            Document query =  new Document();
            query.append("id", id); //The customer to be updated
            Document setData = new Document(); //The new details
            setData.append("first_name", firstName)
                    .append("last_name", lastName)
                    .append("email", email)
                    .append("password", password)
                    .append("passport", passport)
                    .append("dob", DOB);
            Document update = new Document();
            update.append("$set", setData); //Add new details to an updated document
            collection.updateOne(query, update); //Merge updated details with customer ID and update in collection
        }
    }
    
    //Converts customer's details to String format for procressing by Java code
    private Customer convertToCustomer(Document doc) {
        return new Customer((String) doc.get("id"),
                (String) doc.get("first_name"),
                (String) doc.get("last_name"),
                (String) doc.get("email"),
                (String) doc.get("password"),
                (String) doc.get("passport"),
                (String) doc.get("dob"));
    }
    
    //Converts customer's details to document format for storing in MongoDB
    private Document convertToDoc(Customer customer) {
        return new Document("id", customer.getID())
                .append("first_name", customer.getFirstName())
                .append("last_name", customer.getLastName())
                .append("email", customer.getEmail())
                .append("password", customer.getPassword())
                .append("passport", customer.getPassport())
                .append("dob", customer.getDOB());
    }
}