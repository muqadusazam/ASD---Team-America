
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account/booking_History_Results"/>
</jsp:include>

<%
    String selectedOption = request.getParameter("sortOptions");
%>


<%
    //Get logged in Customer object from session
    Customer customer = (Customer)session.getAttribute("customer");

    //Fetch all tickets the customer currently owns from DB
    MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
    ArrayList<Ticket> tickets = dbt.getTickets(customer);
    ArrayList<Flight> flights = new ArrayList();
    

    //Check if customer has tickets
    if (tickets == null) {
%>
<div class="alert alert-warning" role="alert">
    You do not currently have any tickets booked. Click <a href="flights_search.jsp">here</a> to book a new flight.
</div>
<%
} else {
%>
<div class="mx-auto" style="width: 900px; text-align: center;" >
<form action = "booking_History_Sort.jsp" method = "post">
    <!-- 3 type of values added for the drop-down menu -->
    Sort:
    <select name = "sortOptions" id = "sortOptions">
        <option value="Departure">Departure</option>
        <option value="Destination">Destination</option>
    </select>
    <input type="submit">
</form>
</div>
<% 
    MongoDBManager_Flights db = new MongoDBManager_Flights();       //Create connection to mLab
    for (Ticket ticket : tickets) {
        Flight flight = db.getFlight(ticket.getFlightID());
        flights.add(flight);        
    }
    if (selectedOption.equals("Departure")){
                      Collections.sort(flights, Flight.DepartureComparator);
                  }else if (selectedOption.equals("Destination")){
                      Collections.sort(flights, Flight.DestinationComparator);
                  }
 
    //Get list of flights
    //For each flight, make a list of unique origin
    //For each flight, make a list of unique destination
    //For loop on selects; for each origin -> display option
    //For loop on selects; for each destination -> display option
%>
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
                  // loopng through the flights list
                  for (Flight currentFlight : flights){  
              %>
              <!-- Showing individual data on the table row -->
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


                        %>
          </tbody>
        </table>
</div>






<jsp:include page = "fc_footer.jsp"/>