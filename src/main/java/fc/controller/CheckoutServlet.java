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
