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
        //Get session from request object
        HttpSession session = request.getSession();
        //Set errors attribute for storing error messages
        Map<String, String> errors = new HashMap<String, String>();

        //Get ticket from session
        Ticket oldTicket = (Ticket) session.getAttribute("origTicket");

        //Get flight from session
        Flight oldFlight = (Flight) session.getAttribute("origFlight");

        //Get new flight from form passed in view
        String newFlightID = request.getParameter("newFlight");
        MongoDBManager_Flights dbf = new MongoDBManager_Flights();
        Flight newFlight = dbf.getFlight(newFlightID);
        //Get departure and arrival date of new flight
        String newDepDate = newFlight.getDepartureDate();
        String newDestDate = newFlight.getArrivalDate();

        //Check errors empty and proceed to reschedule ticket 
        MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();

        System.out.println("***********TEST***********");
        Ticket newTicket = new Ticket(oldTicket.getID(),
                oldTicket.getCustomerID(),
                newFlightID,
                oldTicket.getPassengerSeatNum());
        System.out.println("***********TEST***********");
        dbt.remove(oldTicket);
        dbt.add(newTicket);
        request.getRequestDispatcher("userEditTicketSuccess_management.jsp").forward(request, response);
    }

}
