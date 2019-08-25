package fc.model;

import java.io.Serializable;

/**
 *
 * @author Liam
 */
public class Ticket implements Serializable{
    
    private String id; // PRIMARY KEY
    private String customer_id; // FOREIGN KEY
    private String flight_id; // FOREIGN KEY + Update google doc to reflect attr name change
    private String passenger_seat_num;
    
    public Ticket() {
    }
    
    public Ticket(String id, 
            String customer_id, 
            String flight_id,
            String passenger_seat_num) {
        
        this.id = id;
        this.customer_id = customer_id;
        this.flight_id = flight_id;
        this.passenger_seat_num = passenger_seat_num;
    }
    
    public String getID() {
        return id;
    }
    
    public String getCustomerID() {
        return customer_id;
    }
    
    public String getFlightID() {
        return flight_id;
    }
    
    public String getPassengerSeatNum() {
        return passenger_seat_num;
    }
}
