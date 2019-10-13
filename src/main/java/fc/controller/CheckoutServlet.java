/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fc.controller;

 import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import fc.model.*;
import fc.model.dao.*;
import java.text.SimpleDateFormat;

/**
 *
 * @author Liam
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String,String> errors = new HashMap<String,String>();
        HttpSession session = request.getSession();
        
        Customer customer = (Customer)session.getAttribute("customer");
        String flightID = request.getParameter("flightID");
        
        MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = dbt.getTickets(customer);
        
        for (Ticket ticket: tickets) 
            if (ticket.getFlightID().equals(flightID)) 
                errors.put("error", "Error! You already have a ticket with the same flight.");
        
        MongoDBManager_Flights dbf = new MongoDBManager_Flights();
        Flight flight = dbf.getFlight(flightID);
        
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        
        try {
            Date dep = formatter.parse(flight.getDepartureDate());
            Date arr = formatter.parse(flight.getArrivalDate());
            
            for (Ticket t: tickets) {
                if(!t.getFlightID().equals(flightID)) {
                    Flight f = dbf.getFlight(t.getFlightID());
                    
                    Date t_dep = formatter.parse(f.getDepartureDate());
                    Date t_arr = formatter.parse(f.getArrivalDate());
                    
                    if (!(t_dep.before(dep) || t_dep.after(arr) && t_arr.before(dep) || t_arr.after(arr))) {
                        errors.put("errors", "Error! You already have a ticket with a flight within the same date.");
                        response.sendRedirect("booking.jsp");
                    }
                }
            }
        } catch(Exception ex) {
            errors.put("error", "Error! Couldnt convert flight date");
            response.sendRedirect("booking.jsp");
        }
        
        if (errors.isEmpty()) { 
            response.sendRedirect("booking.jsp");
            String key = Integer.toString(100000 + (new Random().nextInt(99999)));
            Ticket ticket = new Ticket(key, customer.getID(), flightID, "1");
            dbt.add(ticket);
            session.setAttribute("success", true);
        }
        else { 
            session.setAttribute("errors", errors);
            response.sendRedirect("booking.jsp");
        }
    }
}