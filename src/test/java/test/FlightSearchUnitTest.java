package test;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import fc.model.Flight;
import fc.model.dao.MongoDBConnector;
import fc.model.dao.MongoDBManager_Flights;
import java.net.UnknownHostException;
import java.util.ArrayList;
import org.bson.Document;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Kyle_2
 */
public class FlightSearchUnitTest {
    private static MongoDBConnector mb;
    
    public FlightSearchUnitTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        System.out.println("\n<-- Starting Unit test -->");  
        mb = new MongoDBConnector();  
    }
    
    @Test
    public void testMongoDBConnect() throws UnknownHostException {
        Assert.assertNotNull("Cannot establish connection to MDB",mb.getMongoDB());        
        System.out.println("\n- Connecting to MongoDB ");
    }
    
    @Test
    public void testSearchOriginAndDestination() {
        System.out.println("\n<---Start test for search by origin and destination--->");
        MongoDBManager_Flights db = new MongoDBManager_Flights();       //Create connection to mLab
        System.out.println("\n-Set origin as 'Sydney\n-Set destination as 'Seoul");
        String origin = "Sydney";
        String destination = "Seoul";
        System.out.println("<--- Searching database for flights from Sydney to Seoul -->");
        ArrayList<Flight> flights = db.getFlightsByOriginAndDestination(origin, destination);
        System.out.println("------------------------------------------------------");
        if(flights.isEmpty()){
            System.out.println("\nNo flights returned, did not search successfully");
        } else {
            System.out.println("Flights found: ");
            for(Flight flight: flights){   
                System.out.println("Flight ID: "+ flight.getID() + "\tFlight Airline: " + flight.getAirline() + "\tFlight Origin: " + flight.getOrigin() + "\tFlight Destination: " + flight.getDestination() + "\tFlight Arrival Date: " + flight.getAirline());
            }            
        }
        
    }
        
    
    @After
    public void tearDownClass() {
        System.out.print("\n<-- Unit Test Finished : "); 
    }

}