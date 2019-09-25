<%@page import="java.util.ArrayList"%>
<%@ page import="fc.model.*"%>
<%@ page import="fc.model.dao.*" %>

<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/booking_history"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="flight_management.jsp" class ="anthy2">Flight Management (staff only)</a></li>
    </ul>
</div>

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
    <label><b>Sort: </b></label>
    <!-- 3 type of values added for the drop-down menu -->
    <select>
        <option value="DateAdded">Date Added</option>
        <option value="Alphabetically">Alphabetically</option>
        <option value="IDOrdered">ID ordered</option>
    </select>
</div>

<div class="mx-auto" style="width: 900px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
        <th>Ticket ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Departure</th>
        <th>Departure Date</th>
        <th>Destination</th>
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
