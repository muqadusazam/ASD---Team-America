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
 * @author Kelvin
 */
public class MongoDBManager_Customers extends MongoDBConnector {
    
    public void add(Customer customer) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            customerDB.insertOne(convertToDoc(customer));
        }
    }
    
    public void remove(Customer customer) {
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            customerDB.deleteOne(convertToDoc(customer));
        }
    }
    
    public Customer getCustomer(String id) {
        MongoClientURI uri = generateURI();
        Customer customer;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            Document doc = customerDB.find(eq("id", id)).first();
            customer = convertToCustomer(doc);
        }
        return customer;
    }
    
    public Customer getCustomer(String email, String password) {
        MongoClientURI uri = generateURI();
        Customer customer;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> customerDB = db.getCollection(CUSTOMER_COLLECTION);
            Document doc = customerDB.find(and(eq("email", email), eq("password", password))).first();
            customer = convertToCustomer(doc);
        } catch(NullPointerException x){
            return null;
        }
        return customer;
    }
    
    public ArrayList<Customer> getCustomers() {
        MongoClientURI uri = generateURI();
        ArrayList<Customer> customers;
        try (MongoClient client = new MongoClient(uri)) {
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            customers = new ArrayList<>();
            MongoCollection<Document> customerlist = db.getCollection(CUSTOMER_COLLECTION);
            for (Document doc : customerlist.find()) {
                Customer customer = convertToCustomer(doc);
                customers.add(customer);
            }
        }
        return customers;
    }
    
    public void editCustomer(String id, String firstName, String lastName, String email, String password, String passport, String DOB){
        MongoClientURI uri = generateURI();
        try (MongoClient client = new MongoClient(uri)){
            MongoDatabase db = client.getDatabase(uri.getDatabase());
            MongoCollection<Document> collection = db.getCollection(CUSTOMER_COLLECTION);
            Document query =  new Document();
            query.append("id", id);
            Document setData = new Document();
            setData.append("first_name", firstName)
                    .append("last_name", lastName)
                    .append("email", email)
                    .append("password", password)
                    .append("passport", passport)
                    .append("dob", DOB);
            Document update = new Document();
            update.append("$set", setData);
            collection.updateOne(query, update);
        }
    }
    
    private Customer convertToCustomer(Document doc) {
        return new Customer((String) doc.get("id"),
                (String) doc.get("first_name"),
                (String) doc.get("last_name"),
                (String) doc.get("email"),
                (String) doc.get("password"),
                (String) doc.get("passport"),
                (String) doc.get("dob"));
    }
    
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
