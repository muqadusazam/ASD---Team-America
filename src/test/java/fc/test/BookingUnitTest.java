/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.test;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import java.net.UnknownHostException;
import fc.model.dao.*;
import fc.model.*;
import java.util.ArrayList;
import java.util.Random;

public class BookingUnitTest {
    
    private static MongoDBConnector mdb;
    public BookingUnitTest() {
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
       
    @Test //Fetch all tickets in ticket collection and print them
    public void fetchTickets(){
        MongoDBManager_Tickets db = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = db.getTickets();
        assertNotNull("Cannot fetch tickets",tickets); //Assert that 'tickets' ArrayList is not null
        System.out.println("\nFetching All Tickets...");
        System.out.println("-------------------------------------");
        for (Ticket ticket : tickets){
            System.out.print("Ticket ID: " + ticket.getID() +" ");
            System.out.print("Customer ID: " + ticket.getCustomerID() +" ");
            System.out.print("Flight ID: " + ticket.getFlightID() +" ");
            System.out.println("Seat Number: " + ticket.getPassengerSeatNum());
        }
    }
    
    @Test //Book a specific ticket based on ticket ID
    public void bookTicket(){
        MongoDBManager_Tickets db = new MongoDBManager_Tickets();
        String ticketID = "1354";
        String flightID = "1015";
        String customerID = "179577";
        Ticket ticket = new Ticket(ticketID, customerID, flightID, "1");
        db.add(ticket);
        System.out.println("-------------------------------------");
        System.out.println("You have booked Ticket: " + ticketID);
        System.out.println("-------------------------------------");
    }

    @AfterClass
    public static void tearDownClass() {
        System.out.print("\n<-- Unit Test Finished : ");  
    }
}