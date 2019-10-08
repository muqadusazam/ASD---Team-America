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
    for (Ticket ticket : tickets) {
        Flight flight = db.getFlight(ticket.getFlightID());
        flights.add(flight);
    }
    String searchOrigin = request.getParameter("departure");
    String searchDestination = request.getParameter("destination");    
   

    //flights = db.getFlightsByOrigin(searchOrigin);
    
    
    if (!searchOrigin.isEmpty() && searchDestination.isEmpty()) {
        for (Flight currentFlight1 : flights){
        if (currentFlight1.getOrigin().equals(searchOrigin)){
             sortedFlights.add(currentFlight1);
         }
        }   
    }
    if (searchOrigin.isEmpty() && !searchDestination.isEmpty()){
         for (Flight currentFlight1 : flights){
        if (currentFlight1.getDestination().equals(searchDestination)){
             sortedFlights.add(currentFlight1);
         }
        }
    }
    if (!searchOrigin.isEmpty() && !searchDestination.isEmpty()){
        for (Flight currentFlight1 : flights){
        if (currentFlight1.getOrigin().equals(searchOrigin) && currentFlight1.getDestination().equals(searchDestination)){
             sortedFlights.add(currentFlight1);
         }
        }
    }
 
    //Get list of flights
    //For each flight, make a list of unique origin
    //For each flight, make a list of unique destination
    //For loop on selects; for each origin -> display option
    //For loop on selects; for each destination -> display option
%>

<div class="container" style="margin-top: 50px; text-align: center">
    <form action = "booking_History_Results.jsp" method = "post">
        
    <label for="departure">Departure: </label> 
      <input id="departure" name="departure" type="text" />
      
      <label for="destination">Destination: </label> 
      <input id="destination" name="destination" type="text" />
      
      <button type="submit" class="btn btn-primary">Search</button>
</form>
        
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
                  for (Flight currentFlight : sortedFlights){
              %>

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