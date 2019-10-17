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

public class RescheduleAdminUnitTest {

    private static MongoDBConnector mdb;

    public RescheduleAdminUnitTest() {
    }

    @BeforeClass //Create an instance of MongoDBConnector
    public static void setUpClass() throws UnknownHostException {
        System.out.println("\n<-- Starting Unit Test -->");
        mdb = new MongoDBConnector();
    }

    @Test //Test connection to mLab works
    public void testMongoDBConnect() throws UnknownHostException {
        assertNotNull("Cannot establish connection to MDB", mdb.getMongoDB());
        System.out.println("\n- ***********Connecting to MongoDB*********** ");
    }

    @Test //Fetch all tickets in ticket collection and print them
    public void fetchTickets() {
        MongoDBManager_Tickets db = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = db.getTickets();
        assertNotNull("Cannot fetch tickets", tickets); //Assert that 'tickets' ArrayList is not null
        System.out.println("\nFetching All Tickets...");
        System.out.println("*********************************");
        for (Ticket ticket : tickets) {
            System.out.print("Ticket ID: " + ticket.getID() + " ");
            System.out.print("Customer ID: " + ticket.getCustomerID() + " ");
            System.out.print("Flight ID: " + ticket.getFlightID() + " ");
            System.out.println("Seat Number: " + ticket.getPassengerSeatNum());
        }
        System.out.println("*********************************");
    }

    @Test   //reschedule a flight to the database
    public void rescheduleFlight() {
        MongoDBManager_Flights db = new MongoDBManager_Flights();
        String key = Integer.toString(1000 + (new Random().nextInt(999)));
        String airline = "unit";
        String origin = "test";
        String destination = "asd";
        String departure_time = "06:00PM";
        String departure_date = "05-11-2019";
        String arrival_time = "11:00PM";
        String arrival_date = "05-11-2019";
        String status = "Scheduled";
        String price = "1000";
        String available_seats = "20";
        System.out.println("\nRescheduling new flight as admin...");
        System.out.println("*********************************");
        System.out.println(key + " " + airline + " " + origin + " " + destination
                + " " + departure_time + " " + departure_date + " " + arrival_time + " " + arrival_date + " " + status + " " + price + " " + available_seats);
        db.add(new Flight(key, airline, origin, destination, departure_time, departure_date, arrival_time, arrival_date, status, price, available_seats));
        System.out.println("*********************************");

    }

    @AfterClass
    public static void tearDownClass() {
        System.out.print("\n<-- ***********End of Unit Test*********** ");
    }
}
