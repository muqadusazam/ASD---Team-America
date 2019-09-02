/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.model.dao;

import fc.model.Customer;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author william
 */
public class MongoDBManager_CustomersTest {
    
    public MongoDBManager_CustomersTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of add method, of class MongoDBManager_Customers.
     */
    @Test
    public void testAdd() {
        System.out.println("add");
        Customer customer = null;
        MongoDBManager_Customers instance = new MongoDBManager_Customers();
        instance.add(customer);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of remove method, of class MongoDBManager_Customers.
     */
    @Test
    public void testRemove() {
        System.out.println("remove");
        Customer customer = null;
        MongoDBManager_Customers instance = new MongoDBManager_Customers();
        instance.remove(customer);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCustomer method, of class MongoDBManager_Customers.
     */
    @Test
    public void testGetCustomer_String() {
        System.out.println("getCustomer");
        String id = "";
        MongoDBManager_Customers instance = new MongoDBManager_Customers();
        Customer expResult = null;
        Customer result = instance.getCustomer(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCustomer method, of class MongoDBManager_Customers.
     */
    @Test
    public void testGetCustomer_String_String() {
        System.out.println("getCustomer");
        String email = "";
        String password = "";
        MongoDBManager_Customers instance = new MongoDBManager_Customers();
        Customer expResult = null;
        Customer result = instance.getCustomer(email, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getCustomers method, of class MongoDBManager_Customers.
     */
    @Test
    public void testGetCustomers() {
        System.out.println("getCustomers");
        MongoDBManager_Customers instance = new MongoDBManager_Customers();
        ArrayList<Customer> expResult = null;
        ArrayList<Customer> result = instance.getCustomers();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
