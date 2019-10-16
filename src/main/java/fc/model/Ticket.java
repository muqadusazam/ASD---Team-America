package fc.model;

import java.io.Serializable;

/**
 *
 * @author Liam
 */
public class Ticket implements Serializable, Comparable<Ticket>{
    
    // declaring private fields for Ticket class
    private String id; // PRIMARY KEY
    private String customer_id; // FOREIGN KEY
    private String flight_id; // FOREIGN KEY + Update google doc to reflect attr name change
    private String passenger_seat_num;
    
    public Ticket() {} // default constructor
    
    public Ticket(String id, // Custructor which takes in String values and validate it to default values
            String customer_id, 
            String flight_id,
            String passenger_seat_num) {
        
        // Assignment of method parameter variables with class variables
        this.id = id;
        this.customer_id = customer_id;
        this.flight_id = flight_id;
        this.passenger_seat_num = passenger_seat_num;
    }
    
    // returning the Ticket ID
    public String getID() {
        return id;
    }
    
    // returning the Customer ID
    public String getCustomerID() {
        return customer_id;
    }
    
    // returning the Flight ID
    public String getFlightID() {
        return flight_id;
    }
    
    // returning the Passenger seat number
    public String getPassengerSeatNum() {
        return passenger_seat_num;
    }
    
    @Override
    public int compareTo(Ticket other) {
        return Integer.compare(Integer.parseInt(getID()), Integer.parseInt(other.getID()));
    }
}
