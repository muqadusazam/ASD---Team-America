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
    private String passenger_first_name;
    private String passenger_last_name;
    private String passenger_dob;
    private String passenger_seat_num;
    
    public Ticket() {
    }
    
    public Ticket(String id, String customer_id, String flight_id, 
            String passenger_first_name, 
            String passenger_last_name, 
            String passenger_dob, 
            String passenger_seat_num) {
        
        this.id = id;
        this.customer_id = customer_id;
        this.flight_id = flight_id;
        this.passenger_first_name = passenger_first_name;
        this.passenger_last_name = passenger_last_name;
        this.passenger_dob = passenger_dob;
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
    
    public String getPassengerFirstName() {
        return passenger_first_name;
    }
    
    public void setPassengerFirstName(String passenger_first_name) {
        this.passenger_first_name = passenger_first_name;
    }
    
    public String getPassengerLastName() {
        return passenger_last_name;
    }
    
    public void setPassengerLastName(String passenger_last_name) {
        this.passenger_last_name = passenger_last_name;
    }
    
    public String getPassengerDOB() {
        return passenger_dob;
    }
    
    public void setPassengerDOB(String passenger_dob) {
        this.passenger_dob = passenger_dob;
    }
    
    public String getPassengerSeatNum() {
        return passenger_seat_num;
    }
    
    public void setPassengerSeatNum(String passenger_seat_num) {
        this.passenger_seat_num = passenger_seat_num;
    }
}
