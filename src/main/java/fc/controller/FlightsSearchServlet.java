package fc.controller;

import fc.model.Flight;
import fc.model.dao.MongoDBManager_Flights;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        String searchArrivalDate = request.getParameter("searchArrivalDate");
        ArrayList<Flight> flights = new ArrayList();
        String title = "Find a flight";


        if (searchOrigin != null && searchDestination.isEmpty()) {
             flights = db.getFlightsByOrigin(searchOrigin);
             title = "Flights from " + searchOrigin;
        }
        if (searchOrigin == null && !searchDestination.isEmpty()){
             flights = db.getFlightsByDestination(searchDestination);
             //
             //needs to interpret search results + guess incomplete results
             //
             title = "Flights to " + searchDestination;
        }
        if (searchOrigin != null && !searchDestination.isEmpty()){
            flights = db.getFlightsByOriginAndDestination(searchOrigin, searchDestination);
            title = "Flights from " + searchOrigin + " to " + searchDestination;
        }    
        if (!searchArrivalDate.isEmpty()){
            ArrayList<Flight> timeSort = new ArrayList();
            //split date so can be compared
            String[] splitSearchDate = searchArrivalDate.split("-");
            //re-combine date
            String searchDate = splitSearchDate[0].concat(splitSearchDate[1]).concat(splitSearchDate[2]);
            System.out.println(searchDate);
            for (Flight flight: flights) {
               String[] splitFlightDate = flight.getArrivalDate().split("-");
               String flightArrival = splitFlightDate[2].concat(splitFlightDate[1]).concat(splitFlightDate[0]);
               System.out.println(flightArrival);
                if (flightArrival.compareTo(searchDate) <= 0){
                    timeSort.add(flight);
                }
            }
            flights = timeSort;
        }
        
//        if (!searchArrivalDate.equals(null)){
//            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            Date searchDate = format.parse(searchArrivalDate);          
//            for(Flight flight:flights){
//               if (searchDate.before(format.parse(flight.getArrivalDate()))){
//                   flights.remove(flight);
//               }
//           }
//        }
            
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
