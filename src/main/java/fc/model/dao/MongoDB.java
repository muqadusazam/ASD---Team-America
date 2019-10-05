package fc.model.dao;

//Sets up MongoDB collections for storing data on mLab
public abstract class MongoDB {
    protected final String OWNER = "admin"; //Credentials for accessing our team's MongoDB on mLab
    protected final String PASSWORD = "qwerty123";
    protected final String KEY = "@ds263927.mlab.com:63927/heroku_dlsrflnl"; //Link to our team's MongoDB on mLab
    
    protected final String CUSTOMER_COLLECTION = "ASD.Customers"; //Collection containing all customers's details
    protected final String TICKET_COLLECTION   = "ASD.Tickets"; //Collction containing all tickets booked 
    protected final String FLIGHT_COLLECTION  = "ASD.Flights(Anthea)"; //Collection containing all flights
}
