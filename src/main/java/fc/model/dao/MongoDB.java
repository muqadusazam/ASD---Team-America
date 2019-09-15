/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.model.dao;

/**
 *
 * @author Liam
 */
public abstract class MongoDB {
    protected final String OWNER = "admin";
    protected final String PASSWORD = "qwerty123";
    protected final String KEY = "@ds263927.mlab.com:63927/heroku_dlsrflnl"; 
    
    protected final String CUSTOMER_COLLECTION = "ASD.Customers";
    protected final String TICKET_COLLECTION   = "ASD.Tickets";
    protected final String FLIGHT_COLLECTION  = "ASD.Flights";
}
