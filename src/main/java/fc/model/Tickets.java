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
public class Tickets implements Serializable{
   
    private ArrayList<Ticket> list = new ArrayList<>();

    public Tickets() {
    }
    
    public void addTicket(Ticket ticket) {
        list.add(ticket);
    }
    public void removeCustomer(Ticket ticket) {
        list.remove(ticket);
    }

    // SCOPE 04_View flights
    public ArrayList<Ticket> viewTickets() {
        return list;
    }

    // SCOPE 05_Search flights
    public Ticket searchTicket(String id) {
        for (Ticket flight : list) {
            if (flight.getID().equals(id)) {
                return flight;
            }
        }
        return null;
    }
}