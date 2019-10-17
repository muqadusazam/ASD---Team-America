<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Flight"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account/booking_History_Results"/>
</jsp:include>

<%
    if (session.getAttribute("customer") == null) { //Redirect to login page if not logged in
        response.sendRedirect("login.jsp");
    } else { //Proceed to show booking history if logged in
%>
<!-- Setting the layout on the screen so the Title of the page stays in the middle -->
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Booking History</h1>
</div>

<%
    //Get logged in Customer object from session
    Customer customer = (Customer)session.getAttribute("customer");

    //Fetch all tickets the customer currently owns from DB
    MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
    ArrayList<Ticket> tickets = dbt.getTickets(customer);
     ArrayList<Flight> flights = new ArrayList();
     ArrayList<Flight> sortedFlights = new ArrayList();
    
    //Check if customer has tickets
    if (tickets == null) {
%>
<div class="alert alert-warning" role="alert">
    You do not currently have any tickets booked. Click <a href="flights_search.jsp">here</a> to book a new flight.
</div>
<%
} else {
%>

<% 
    MongoDBManager_Flights db = new MongoDBManager_Flights();       //Create connection to mLab
    for (Ticket ticket : tickets) { // looping through the tikets to find individual ticket within the list
        Flight flight = db.getFlight(ticket.getFlightID()); // getting the flight data based on the ticket
        flights.add(flight); // adding current flight to the list
    }
    // saving the incoming parameters into string variables
    String searchOrigin = request.getParameter("departure");
    String searchDestination = request.getParameter("destination");
   
    // checking if origin is provided but destination is not
    if (!searchOrigin.isEmpty() && searchDestination.isEmpty()) {
        for (Flight currentFlight1 : flights){ // looping through the flights
        if (currentFlight1.getOrigin().toLowerCase().contains(searchOrigin.toLowerCase())){
             sortedFlights.add(currentFlight1); // and saving it into the sorted flights
         }
        }   
    }
    // checking if origin is not provided but destination is
    if (searchOrigin.isEmpty() && !searchDestination.isEmpty()){
         for (Flight currentFlight1 : flights){ // looping through the flights
        if (currentFlight1.getDestination().toLowerCase().contains(searchDestination.toLowerCase())){
             sortedFlights.add(currentFlight1); // and saving it into the sorted flights
         }
        }
    }
    // checking if both origin and destination are provided
    if (!searchOrigin.isEmpty() && !searchDestination.isEmpty()){
        for (Flight currentFlight1 : flights){ // looping through the flights
        if (currentFlight1.getOrigin().toLowerCase().contains(searchOrigin.toLowerCase()) && currentFlight1.getDestination().toLowerCase().contains(searchDestination.toLowerCase())){
             sortedFlights.add(currentFlight1); // and saving it into the sorted flights
         }
        }
    }
 
    //Get list of flights
    //For each flight, make a list of unique origin
    //For each flight, make a list of unique destination
    //For loop on selects; for each origin -> display option
    //For loop on selects; for each destination -> display option
%>

<!-- input fields to search for the departure and destination -->
<div class="container" style="margin-top: 50px; text-align: center">
    <form action = "ViewBookingServlet" method = "get">
        
    <label for="departure">Departure: </label> 
      <input id="departure" name="departure" type="text" />
      
      <label for="destination">Destination: </label> 
      <input id="destination" name="destination" type="text" />
      
      <button type="submit" class="btn btn-primary">Search</button>
</form>
        <!-- Setting up the table and the row headings -->
        <table class="table"style="margin-top: 20px">
          <thead class="thead-dark">
             <th>Flight ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th id = "departure">Departure</th>
        <th>Departure Date</th>
        <th id = "destination">Destination</th>
        <th>Destination Date</th>
          </thead>
          <tbody>
              <%
                  // looping through the sorted flights
                  for (Flight currentFlight : sortedFlights){
              %>
              <!-- Showing the data of the current flight in the row -->
                            <tr>
             <td><%= currentFlight.getID() %></td>
            <td><%=customer.getFirstName()%></td>
            <td><%=customer.getLastName()%></td>
            <td><%=currentFlight.getOrigin()%></td>
            <td><%=currentFlight.getDepartureDate()%></td>
            <td><%=currentFlight.getDestination()%></td>
            <td><%=currentFlight.getDepartureDate()%></td>
                            </tr>
                        <%
                                }
}
}


                        %>
          </tbody>
        </table>
        
</div>
                        
<jsp:include page = "fc_footer.jsp"/>