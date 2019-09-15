package test;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import java.net.UnknownHostException;
import fc.model.dao.*;
import fc.model.*;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author kelvin
 */
public class RegisterUnitTest {
    private static MongoDBConnector mdb;
    public RegisterUnitTest() {
    }
    
    @BeforeClass //Create an instance of MongoDBConnector
    public static void setUpClass() throws UnknownHostException {
        System.out.println("\n<-- Starting Unit Test -->");  
        mdb = new MongoDBConnector(); 
    }
    
    @Test //Test connection to mLab works
    public void testMongoDBConnect() throws UnknownHostException {
        assertNotNull("Cannot establish connection to MDB",mdb.getMongoDB());        
        System.out.println("\n- Connecting to MongoDB ");
    }
       
    @Test //Fetch all customers in ASD.Customers collection in mLab
    public void fetchCustomers(){
        MongoDBManager_Customers db = new MongoDBManager_Customers();
        ArrayList<Customer> customers = db.getCustomers();
        assertNotNull("Cannot fetch Flight Center customers",customers);
        System.out.println("\nFetching Flight Center customers...");
        System.out.println("-------------------------------------");
        for (Customer customer : customers){
            System.out.print(customer.getID() +" ");
            System.out.print(customer.getFirstName() +" ");
            System.out.print(customer.getLastName() +" ");
            System.out.print(customer.getEmail() +" ");
            System.out.print(customer.getPassword() +" ");
            System.out.print(customer.getPassport() +" ");
            System.out.println(customer.getDOB());
        }
    }
    
    @Test //Add a new customer to Flight Center
    public void addCustomer(){
        MongoDBManager_Customers db = new MongoDBManager_Customers();
        String key = Integer.toString(100000 + (new Random().nextInt(99999)));
        String firstName = "Unit";
        String lastName = "Test";
        String email = "unit@test.com";
        String password = "abcde1";
        String passport = "TT001";
        String dob = "1960-12-12";
        System.out.println("\nAdding a new customer...");
        System.out.println("-------------------------------------");
        System.out.println(key + " " + firstName + " " + lastName + " " + email 
                + " " + password + " " + passport + " " + dob);
        db.add(new Customer(key, firstName, lastName, email, password, passport, dob));

    }

    @AfterClass
    public static void tearDownClass() {
        System.out.print("\n<-- Unit Test Finished : ");  
    }
}