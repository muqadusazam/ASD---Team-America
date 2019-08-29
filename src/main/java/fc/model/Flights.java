/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.model;

import java.io.Serializable;
import java.util.*;

/**
 *
 * @author Liam
 */
public class Flights implements Serializable{
   
    private ArrayList<Flight> list = new ArrayList<>();

    public Flights() {
    }
    
    public void addFlight(Flight flight) {
        list.add(flight);
    }
    public void removeFlight(Flight flight) {
        list.remove(flight);
    }

    // SCOPE 04_View flights
    public ArrayList<Flight> viewFlights() {
        return list;
    }

    // SCOPE 05_Search flights
    public Flight searchFlight(String id) {
        for (Flight flight : list) {
            if (flight.getID().equals(id)) {
                return flight;
            }
        }
        return null;
    }
}