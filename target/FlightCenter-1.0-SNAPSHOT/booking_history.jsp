<%@page import="java.util.ArrayList"%>
<%@ page import="fc.model.*"%>
<%@ page import="fc.model.dao.*" %>

<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/booking_history"/>
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

    //Check if customer has tickets
    if (tickets == null) {
%>
<div class="alert alert-warning" role="alert">
    You do not currently have any tickets booked. Click <a href="flights_search.jsp">here</a> to book a new flight.
</div>
<%
} else {
%>

<!-- Again specifying the layout settings for the sorting function -->
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

<div class="mx-auto" style="width: 900px; text-align: center;" >
    <form action = "ViewBookingServlet" method = "get">
        
    <label for="departure">Departure: </label> 
      <input id="departure" name="departure" type="text" />
      
      <label for="destination">Destination: </label> 
      <input id="destination" name="destination" type="text" />
      
      <button type="submit" class="btn btn-primary">Search</button>
      <div>
      <span class="error text-danger"><em>${errors.Err}</em></span>
      </div>
</form>
</div>

<div class="mx-auto" style="width: 900px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
        <th id = "ticketID">Ticket ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th id = "departure">Departure</th>
        <th>Departure Date</th>
        <th id = "destination">Destination</th>
        <th>Destination Date</th>
        <th>Action</th>
        </thead>
        <%
            //Open flights DB for ticket loop
            MongoDBManager_Flights dbf = new MongoDBManager_Flights();

            //Loop through all tickets in array and display in HTML table
            for (Ticket ticket : tickets) {
                Flight flight = dbf.getFlight(ticket.getFlightID());
        %>
        <tr>
            <td><%=ticket.getID()%></td>
            <td><%=customer.getFirstName()%></td>
            <td><%=customer.getLastName()%></td>
            <td><%=flight.getOrigin()%></td>
            <td><%=flight.getDepartureDate()%></td>
            <td><%=flight.getDestination()%></td>
            <td><%=flight.getDepartureDate()%></td>
            <td>
                <form action="reschedule.jsp" method="POST">
                    <button type="submit" class="btn btn-primary" name="ticketID" value="<%=ticket.getID()%>">Reschedule</button>
                </form>
            </td>
    </tr>
        <%
                }
            }
        %>

</div>
<%
    }
%>

<jsp:include page = "fc_footer.jsp"/>
