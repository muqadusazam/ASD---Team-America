/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import fc.model.Customer;
import fc.model.Customers;
import fc.model.dao.MongoDBConnector;
import fc.model.dao.MongoDBManager_Customers;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Random;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author muqad
 */
public class LoginUnitTest {
    private static MongoDBConnector mb;
    private static MongoDBManager_Customers mc;
    public LoginUnitTest() {  }
    
    @BeforeClass //Create an instance of MongoDBConnector using admin credentials for mLab
    public static void setUpClass() throws UnknownHostException {
        System.out.println("\n<-- Starting Unit test -->");  
        mb = new MongoDBConnector();      
    }
    
    @Test
    public void testMongoDBConnect() throws UnknownHostException {
        Assert.assertNotNull("Cannot establish connection to MDB",mb.getMongoDB());        
        System.out.println("\n- Connecting to MongoDB ");
    }
    
    @Test 
    public void fetchCustomers(){
        MongoDBManager_Customers db = new MongoDBManager_Customers();
        ArrayList<Customer> customers = db.getCustomers();
        Assert.assertNotNull("Cannot fetch ARS customers", customers);
        System.out.println("\nFetching ARS customers...");
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
    public void loginCustomer(){
        String email = "unit@test.com";
        String password = "abcde1";
        MongoDBManager_Customers db = new MongoDBManager_Customers();
        Customer customer = db.getCustomer(email, password);
        System.out.println("\nLogging in the customer...");
        System.out.println("-------------------------------------");
        if (customer == null){
            System.out.print("Customer not found");
        } else {
            System.out.print(customer.getFirstName() + " found");
        }

    }
    
    @AfterClass
    public static void tearDownClass() {
        System.out.print("\n<-- Unit Test Finished : ");        
    }
}
