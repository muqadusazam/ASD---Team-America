//package test;
//
//
///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//import org.junit.AfterClass;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import static org.junit.Assert.*;
//
//import java.net.UnknownHostException;
//import fc.model.dao.*;
//import fc.model.*;
//import java.util.ArrayList;
//import java.util.Random;
//
///**
// *
// * @author el181
// */
//public class FlightManagementUuitTest {
//    
//    private static MongoDBConnector mdb;
//    public FlightManagementUuitTest() {
//    }
//    
//    @BeforeClass
//    public static void setUpClass() throws UnknownHostException{
//         System.out.println("\n<-- Starting Unit Test -->");  
//         mdb = new MongoDBConnector(); 
//    }
//    
//    
//
//    // TODO add test methods here.
//    // The methods must be annotated with annotation @Test. For example:
//    //
//    @Test //Test connection to mLab works
//   public void testMongoDBConnect() throws UnknownHostException {
//        assertNotNull("Cannot establish connection to MDB",mdb.getMongoDB());        
//       System.out.println("\n- Connecting to MongoDB ");
//    }
//   
//   @Test
//   public void listFlight()
//   {
//       MongoDBManager_Flights db = new MongoDBManager_Flights();
//       ArrayList<Flight> flights = db.getFlights();
//       assertNotNull("Cannot fetch flights",flights);
//       System.out.println("\nFetching All Flights,");
//       for(Flight flight: flights)
//       {
//           System.out.print("Flight ID: "+ flight.getID());
//           System.out.print("Airline: "+ flight.getAirline());
//           System.out.print("Origin: "+ flight.getOrigin());
//           System.out.print("Destination: "+ flight.getDestination());
//           System.out.print("status: "+ flight.getStatus());
//           System.out.print("price: "+ flight.getPrice());
//           System.out.print("Available_seats: "+ flight.getAvailableSeats());
//       }
//   }
//   @Test
//    public void AddFlight()
//   {
//       MongoDBManager_Flights db = new MongoDBManager_Flights();
//       Flight flight = new Flight("testID","Quantas","Seoul","Sydney","d_time","d_date","a_time","a_date","status","500","233");
//       assertNotNull("Failed to create flight",flight);
//       db.add(flight);
//       System.out.println("\n\nFlight is added to the database! \n");
//   }
//    
//   @Test
//    public void DeleteFlight()
//   {
//       MongoDBManager_Flights db = new MongoDBManager_Flights();
//       String testID = "testID";
//       Flight flight = db.getFlight(testID);
//       assertNotNull("Failed to get flight",flight);
//       db.remove(flight);
//       System.out.println("\n\nFlight is deleted to the database! \n");
//       System.out.println("Removed Flight ID: "+testID);
//   } 
//   
//   @AfterClass
//    public static void tearDownClass() {
//        System.out.print("\n<-- Unit Test Finished : ");  
//    }
//   
//}