package fc.model;

import java.io.Serializable;

/**
 *
 * @author Liam
 */
public class Flight implements Serializable{
    
    private String id; //Update google doc to reflect attr name change
    private String airline;
    private String origin;
    private String destination;
    private String departure_time; 
    private String departure_date; 
    private String arrival_time; 
    private String arrival_date; 
    private String status;
    private String price;
    private String available_seats;
    
    public Flight() {
    }
    
    public Flight(String id,
            String airline,
            String origin,
            String destination,
            String departure_time,
            String departure_date,
            String arrival_time,
            String arrival_date,
            String status,
            String price,
            String available_seats) {
        
        this.id = id;
        this.airline = airline;
        this.origin = origin;
        this.destination = destination;
        this.departure_time = departure_time;
        this.departure_date = departure_date;
        this.arrival_time = arrival_time;
        this.arrival_date = arrival_date;
        this.status = status;
        this.price = price;
        this.available_seats = available_seats;
        
    }
    
    public String getAirline() {
        return airline;
    }
    
    public void setAirline(String airline) {
        this.airline = airline;
    }
    
    public String getOrigin() {
        return origin;
    }
    
    public void setOrigin(String origin) {
        this.origin = origin;
    }
    
    public String getDestination() {
        return destination;
    }
    
    public void setDestination(String destination) {
        this.destination = destination;
    }
    
    public String getDepartureTime() {
        return departure_time;
    }
    
    public void setDepartureTime(String departure_time) {
        this.departure_time = departure_time;
    }
    
    public String getDepartureDate() {
        return departure_date;
    }
    
    public void setDepartureDate(String departure_date) {
        this.departure_date = departure_date;
    }
    
    public String getArrivalTime() {
        return arrival_time;
    }
    
    public void setArrivalTime(String arrival_time) {
        this.arrival_time = arrival_time;
    }
    
    public String getArrivalDate() {
        return arrival_date;
    }
    
    public void setArrivalDate(String arrival_date) {
        this.arrival_date = arrival_date;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getPrice() {
        return price;
    }
    
    public void setPrice(String price) {
        this.price = price;
    }
    
    public String getAvailableSeats() {
        return available_seats;
    }
    
    public void setAvailableSeats(String available_seats) {
        this.available_seats = available_seats;
    }
}