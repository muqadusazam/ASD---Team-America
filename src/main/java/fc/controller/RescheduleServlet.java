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
import fc.model.*;
import fc.model.dao.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Liam
 */
@WebServlet(name = "RescheduleServlet", urlPatterns = {"/RescheduleServlet"})
public class RescheduleServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Map<String,String> errors = new HashMap<String,String>();
        HttpSession session = request.getSession();
        
        Ticket oldTicket = (Ticket)session.getAttribute("oldTicket");
        
        MongoDBManager_Flights dbf = new MongoDBManager_Flights();
        Flight flight = dbf.getFlight(oldTicket.getFlightID());
        
        String oldDepDate = flight.getDepartureDate();
        String oldDestDate = flight.getArrivalDate();
        
        String newFlightID = request.getParameter("newFlight");
        Flight newFlight = dbf.getFlight(newFlightID);
        
        String newDepDate = newFlight.getDepartureDate();
        String newDestDate = newFlight.getArrivalDate();
        
        if (oldDepDate.compareTo(newDepDate) >= 0) {
            errors.put("dateErr", "The departure date must be after the old departure date.");
        }
        
        if (oldDestDate.compareTo(newDestDate) >= 0) {
            errors.put("dateErr", "The destination date must be after the old departure date.");
        }
        
        if (errors.isEmpty()) {
            MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
            
            Ticket newTicket = new Ticket(oldTicket.getID(),
                    oldTicket.getCustomerID(),
                    newFlightID,
                    oldTicket.getPassengerSeatNum());
            
            dbt.remove(oldTicket);
            dbt.add(newTicket);
            
            session.setAttribute("success", "The ticket has been successfully rescheduled!");
            response.sendRedirect("reschedule.jsp");
        } else {
            session.setAttribute("errors", errors);
            response.sendRedirect("reschedule.jsp");
        }
    }
    
}
