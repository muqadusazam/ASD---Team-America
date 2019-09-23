package fc.model;

import java.io.Serializable;


public class Flight implements Serializable, Comparable<Flight>{
    
    // declaring private fields for Flight class
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
    
    public Flight() {} // default constructor
    
    public Flight(String id, // Custructor which takes in String values and validate it to default values
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
        
        // Assignment of method parameter variables with class variables
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
    
    // returning the Flight ID
    public String getID() {
        return this.id;
    }
    
    // returning the Airline
    public String getAirline() {
        return airline;
    }
    
    // setting Airline by the given input
    public void setAirline(String airline) {
        this.airline = airline;
    }
    
    // returning the Origin
    public String getOrigin() {
        return origin;
    }
    
    // setting origin by the given input
    public void setOrigin(String origin) {
        this.origin = origin;
    }
    
    // returning the destination
    public String getDestination() {
        return destination;
    }
    
    // setting destination by the given input
    public void setDestination(String destination) {
        this.destination = destination;
    }
    
    // returning the Departure Time
    public String getDepartureTime() {
        return departure_time;
    }
    
    // setting Departure Time by the given input
    public void setDepartureTime(String departure_time) {
        this.departure_time = departure_time;
    }
    
    // returning the Departure Date
    public String getDepartureDate() {
        return departure_date;
    }
    
    // setting Departure Date by the given input
    public void setDepartureDate(String departure_date) {
        this.departure_date = departure_date;
    }
    
    // returning the Arrival Time
    public String getArrivalTime() {
        return arrival_time;
    }
    
    // setting Arrival Time by the given input
    public void setArrivalTime(String arrival_time) {
        this.arrival_time = arrival_time;
    }
    
    // returning the Arrival Date
    public String getArrivalDate() {
        return arrival_date;
    }
    
    // setting Arrival Date by the given input
    public void setArrivalDate(String arrival_date) {
        this.arrival_date = arrival_date;
    }
    
    // returning the Status
    public String getStatus() {
        return status;
    }
    
    // setting Status by the given input
    public void setStatus(String status) {
        this.status = status;
    }
    
    // returning the Price
    public String getPrice() {
        return price;
    }
    
    // setting Price by the given input
    public void setPrice(String price) {
        this.price = price;
    }
    
    // returning the Available seats
    public String getAvailableSeats() {
        return available_seats;
    }
    
    // setting Available seats by the given input
    public void setAvailableSeats(String available_seats) {
        this.available_seats = available_seats;
    }
    
    @Override
    public int compareTo(Flight other) {
        return Integer.compare(Integer.parseInt(getID()), Integer.parseInt(other.getID()));
    }
}