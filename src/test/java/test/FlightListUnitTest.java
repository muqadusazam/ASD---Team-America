package test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import fc.model.Flight;
import fc.model.dao.MongoDBManager_Flights;
import java.net.UnknownHostException;
import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
/**
 *
 * @author el181
 */
public class FlightListUnitTest {
    private static MongoDBManager_Flights mdb; 
    public FlightListUnitTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        mdb = new MongoDBManager_Flights();
    }
    

    
    @Before
    public void setUp() {
    }
    
    
    @Test
    public void testMongoDBConnect() throws UnknownHostException {
        Assert.assertNotNull("Cannot establish connection to MDB",mdb);        
        System.out.println("\n- Connecting to MongoDB ");
    }
    /**
     * Test of add method, of class MongoDBManager_Flights.
     */
    @Test
    public void testAdd() {
        System.out.println("add");
        Flight flight = new Flight("idtest",
            "airlinetest",
            "origintest",
            "destinationtest",
            "departuretimetest",
            "departuredatetest",
            "arrivaltimetest",
            "arrivaldatetest",
            "statustest",
            "pricetest",
            "availableseatstest");
        mdb.add(flight);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFlights method, of class MongoDBManager_Flights.
     */
    @Test
    public void testGetFlights() {
        System.out.println("getFlights");
        Flight flight = mdb.getFlight("idtest");
        System.out.println("flight id: "+flight.getID()+" is departing from "+flight.getOrigin());
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of remove method, of class MongoDBManager_Flights.
     */
    @Test
    public void testRemove() {
        System.out.println("remove");
        Flight flight = mdb.getFlight("idtest");
        mdb.remove(flight);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFlightsByDestination method, of class MongoDBManager_Flights.
     */
    @Test
    public void testGetFlightsByDestination() {
        System.out.println("getFlightsByDestination");
        String destination = "";
        ArrayList<Flight> expResult = null;
        ArrayList<Flight> result = mdb.getFlightsByDestination(destination);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
        @AfterClass
    public static void tearDownClass() {
        System.out.print("\n test Finished");
    }
    
}
