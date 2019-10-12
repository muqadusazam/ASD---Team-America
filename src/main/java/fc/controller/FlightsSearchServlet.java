package fc.controller;

import fc.model.Flight;
import fc.model.dao.MongoDBManager_Flights;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
        Map<String,String> errors = new HashMap<String,String>();                
        String searchOrigin = request.getParameter("searchOrigin");
        String searchDestination = request.getParameter("searchDestination");
        
        if(!validate(destinationPattern, searchDestination)){
            errors.put("searchDestErr", "Destination cannot contain numbers or special characters");
        }

        String searchArrivalDate = request.getParameter("searchArrivalDate");
        ArrayList<Flight> flights = new ArrayList();
        String title = "Find a flight";
        
        //validate destination using pattern (only letters, no numbers, no special characters, length?
        //If error, send back error message
        //If none, continue/set attributes$$$$$$$$$$$$$$$$$$$$$$$$$$
        
        if (errors.isEmpty()) {
        
        //If only searching by flight origin...
        if (searchOrigin != null && searchDestination.isEmpty()) {
             flights = db.getFlightsByOrigin(searchOrigin);
             title = "Flights from " + searchOrigin;
        }
        
        //If only searching by flight destination...
        else if (searchOrigin == null && !searchDestination.isEmpty()){
             flights = db.getFlightsByDestination(searchDestination);
             title = "Flights to " + searchDestination;
        }
        
        //If searching by flight origin and destination...
        else if (searchOrigin != null && !searchDestination.isEmpty()){
            flights = db.getFlightsByOriginAndDestination(searchOrigin, searchDestination);
            title = "Flights from " + searchOrigin + " to " + searchDestination;
        } else {
            //If none of the above apply, then no search criteria = display all flights
            flights = db.getFlights();
        }
        
        //Sort the given flight list to display results before target date...
        if (!searchArrivalDate.isEmpty()){
            ArrayList<Flight> timeSort = new ArrayList();
            //split date so can be compared
            String[] splitSearchDate = searchArrivalDate.split("-");
            //re-combine date to match format
            String searchDate = splitSearchDate[0].concat(splitSearchDate[1]).concat(splitSearchDate[2]);
            System.out.println(searchDate);
            //For every flight, split date then recombine to match format, then compare dates
            for (Flight flight: flights) {
               String[] splitFlightDate = flight.getArrivalDate().split("-");
               String flightArrival = splitFlightDate[2].concat(splitFlightDate[1]).concat(splitFlightDate[0]);
               System.out.println(flightArrival);
               //If the flight's date value < target date, then flight occurs before target thus add to list
                if (flightArrival.compareTo(searchDate) <= 0){
                    timeSort.add(flight);
                }
            }
            //Overwrite old flight list with new list sorted by arrival date
            flights = timeSort;
        }                       
        
            //Set all attibutes so can be accessed from JSP pages
            request.setAttribute("flights", flights);
            request.setAttribute("title", title);
            request.getRequestDispatcher("flights_searchResults.jsp").forward(request, response);    
        
        } else { //put errors in request scope and forward them back to register.jsp to display error messages
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("flights.jsp").forward(request, response);            
        }                 

    }  
    
    private String destinationPattern = "[a-zA-Z]*"; //Only allow characters a-z, A-Z and one use of a dash '-'
    
    public boolean validate(String patternString, String input){ //return false if input does not match pattern
        Pattern pattern = Pattern.compile(patternString); //Interprets regex pattern
        Matcher match = pattern.matcher(input); //Sets up a matcher for comparing regex pattern to input
        return match.matches();
    }
}
