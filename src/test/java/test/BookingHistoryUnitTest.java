/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import fc.model.Customer;
import fc.model.*;
import fc.model.dao.*;
import java.net.UnknownHostException;
import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author muqad
 */
public class BookingHistoryUnitTest {
    private static MongoDBConnector mb;
    public BookingHistoryUnitTest() {  }
    
        @BeforeClass //Create an instance of MongoDBConnector using admin credentials for mLab
    public static void setUpClass() throws UnknownHostException {
        System.out.println("\n<-- Starting Unit test -->");  
        mb = new MongoDBConnector();      
    }
    
    // testing the connection
        @Test
    public void testMongoDBConnect() throws UnknownHostException {
        Assert.assertNotNull("Cannot establish connection to MDB",mb.getMongoDB());        
        System.out.println("\n- Connecting to MongoDB ");
    }
    
         @Test //Add a new customer to Flight Center
    public void listUsers(){
        String email = "user@eight.com";
        String password = "abcde1";
        MongoDBManager_Customers db = new MongoDBManager_Customers();
        Customer customer = db.getCustomer(email, password);
        System.out.println("\nLogging in the customer...");
        System.out.println("-------------------------------------");
        if (customer == null){
            System.out.print("Customer not found");
        } else {
                MongoDBManager_Tickets dbt = new MongoDBManager_Tickets(); // getting the tickets
                ArrayList<Ticket> tickets = dbt.getTickets(customer); // getting tickets based on the currently logged in customer
                if (tickets != null){
            MongoDBManager_Flights dbf = new MongoDBManager_Flights();
            //Loop through all tickets in array and display in HTML table
            for (Ticket ticket : tickets) {
                Flight flight = dbf.getFlight(ticket.getFlightID());
                // printing out all the data
                    System.out.println("Ticket ID: " + ticket.getID() + "\tCustomer name: " + customer.getFullName() + "\tFlight Origin: " + flight.getOrigin() + "\tFlight Destination: " + flight.getDestination());
                }
                }else{
                    System.out.println("Tickets are not found!!!!");
                }
    }
    }
        @AfterClass
    public static void tearDownClass() {
        System.out.print("\n<-- Unit Test Finished : ");        
    }
}
