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
 * @author William
 */
@WebServlet(name = "AdminRescheduleServlet", urlPatterns = {"/AdminRescheduleServlet"})
public class AdminRescheduleServlet extends HttpServlet {
    
    //POST method
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Set errors attribute for storing error messages
        Map<String,String> errors = new HashMap<String,String>();
        //Get session from request object
        HttpSession session = request.getSession();
        
        //Get ticket from session
        Ticket oldTicket = (Ticket)session.getAttribute("oldTicket");
        
        //Get flight from session
        Flight oldFlight = (Flight)session.getAttribute("oldFlight");
        
        //Check if Flight ID match
        if (oldFlight.getID().compareTo(oldTicket.getFlightID()) >= 0) {
            request.setAttribute("error", "Flight ID does not match Flight ID on Ticket.");
            request.getRequestDispatcher("userEditTicket_management.jsp").forward(request, response);
        }
        
        //Check if Flight ID match
        if (oldFlight.getID().compareTo(oldTicket.getFlightID()) == 0) {
            request.setAttribute("error", "You selected the same Flight on ticket.");
            request.getRequestDispatcher("userEditTicket_management.jsp").forward(request, response);
        }
        
        //Get departure and arrival date from old flight
        String oldDepDate = oldFlight.getDepartureDate();
        String oldDestDate = oldFlight.getArrivalDate();
        
        //Get new flight from form passed in view
        String newFlightID = request.getParameter("newFlight");
        MongoDBManager_Flights dbf = new MongoDBManager_Flights();
        Flight newFlight = dbf.getFlight(newFlightID);
        
        //Get departure and arrival date of new flight
        String newDepDate = newFlight.getDepartureDate();
        String newDestDate = newFlight.getArrivalDate();
        
        //Check if departure date is after the old departure date
        if (oldDepDate.compareTo(newDepDate) >= 0) {
            request.setAttribute("error", "The departure date must be after the old departure date.");
            request.getRequestDispatcher("userEditTicket_management.jsp").forward(request, response);
        }
        
        //Check if arrival date is after the old departure date
        if (oldDestDate.compareTo(newDestDate) >= 0) {
            request.setAttribute("error", "The destination date must be after the old departure date.");
            request.getRequestDispatcher("userEditTicket_management.jsp").forward(request, response);
        }
        
        //Check errors empty and proceed to reschedule ticket 
        if (errors.isEmpty()) {
            MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
            
            Ticket newTicket = new Ticket(oldTicket.getID(),
                    oldTicket.getCustomerID(),
                    newFlightID,
                    oldTicket.getPassengerSeatNum());
            dbt.remove(oldTicket);
            dbt.add(newTicket);
            
            session.setAttribute("success", "The ticket has been successfully rescheduled!");
            response.sendRedirect("userTicket_management.jsp");
        }
    }
    
}