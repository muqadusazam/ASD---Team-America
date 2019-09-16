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


public class RescheduleUnitTest {
    private static MongoDBConnector mdb;
    public RescheduleUnitTest() {
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
       
    @Test 
    public void fetchFlights(){
        MongoDBManager_Flights db = new MongoDBManager_Flights();
        ArrayList<Flight> flights = db.getFlights();
        assertNotNull("Cannot fetch Flight Center flights", flights);
        for (Flight flight: flights) {
            System.out.println(flight.getID());
            System.out.println(flight.getAirline());
            System.out.println(flight.getOrigin());
            System.out.println(flight.getDepartureDate());
            System.out.println(flight.getDepartureTime());
            System.out.println(flight.getDestination());
            System.out.println(flight.getArrivalDate());
            System.out.println(flight.getArrivalTime());
            System.out.println(flight.getPrice());
        }
    }
    

    @AfterClass
    public static void tearDownClass() {
        System.out.print("\n<-- Unit Test Finished : ");  
    }
    
}