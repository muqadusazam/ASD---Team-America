///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package test;
//
//import fc.model.Customer;
//import fc.model.Customers;
//import fc.model.dao.MongoDBConnector;
//import fc.model.dao.MongoDBManager_Customers;
//import java.net.UnknownHostException;
//import java.util.ArrayList;
//import org.junit.AfterClass;
//import org.junit.Assert;
//import org.junit.BeforeClass;
//import org.junit.Test;
//
///**
// *
// * @author muqad
// */
//public class UnitTest {
//    private static MongoDBConnector mb;
//    private static MongoDBManager_Customers mc;
//    public UnitTest() {  }
//    
//    @BeforeClass //Create an instance of MongoDBConnector using admin credentials for mLab
//    public static void setUpClass() throws UnknownHostException {
//        System.out.println("\n<-- Starting Unit test -->");  
//        mb = new MongoDBConnector();      
//    }
//    
//    @Test
//    public void testMongoDBConnect() throws UnknownHostException {
//        Assert.assertNotNull("Cannot establish connection to MDB",mb);        
//        System.out.println("\n- Connecting to MongoDB ");
//    }
//    
//    @Test 
//    public void fetchUsers(){
//        //Customers customers = mc.getCustomers();
//        ArrayList<Customer> users = mc.getCustomers();
//        Assert.assertNotNull("Cannot fetch ASD users",users);
//        System.out.println("\nFetching ASD users...");
//        System.out.println("-------------------------------------");
//        mc.getCustomers();
//        
//    }
//    
//    @AfterClass
//    public static void tearDownClass() {
//        System.out.print("\n<-- Unit Test Finished : ");        
//    }
//}
