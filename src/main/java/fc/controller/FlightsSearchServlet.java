package fc.controller;

import fc.model.Flight;
import fc.model.dao.MongoDBManager_Flights;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;



@WebServlet(name = "FlightsSearchServlet", urlPatterns = {"/FlightsSearchServlet"})
public class FlightsSearchServlet extends HttpServlet{
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        MongoDBManager_Flights db = new MongoDBManager_Flights();       //Create connection to mLab

        String searchOrigin = request.getParameter("searchOrigin");
        String searchDestination = request.getParameter("searchDestination");
        ArrayList<Flight> flights = new ArrayList();
        String title = "Find a flight";


        if (searchOrigin != null && searchDestination.isEmpty()) {
             flights = db.getFlightsByOrigin(searchOrigin);
             title = "Results from " + searchOrigin;
        }
        if (searchOrigin == null && !searchDestination.isEmpty()){
             flights = db.getFlightsByDestination(searchDestination);
             //
             //needs to interpret search results + guess incomplete results
             //
             title = "Results to " + searchDestination;
        }
        if (searchOrigin != null && !searchDestination.isEmpty()){
            flights = db.getFlightsByOriginAndDestination(searchOrigin, searchDestination);
            title = "Results from " + searchOrigin + " to " + searchDestination;
        }     
        
        //if (results.count = 0){
        //    print "no flights found"
        //}

        //    if (find flight by date){
        //        return flights.before(date);
        //    }
        
        request.setAttribute("flights", flights);
        request.setAttribute("title", title);
        request.getRequestDispatcher("flights_searchResults.jsp").forward(request, response);
        
    //read input elements
    
    //create list of flights
    
    //display title
    
    //validate inputs
    
    //
    }  
}
