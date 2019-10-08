<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Cancel Ticket"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="fc.model.*"%>
<%@page import="fc.model.dao.*"%>

<!-- Dropdown button on left side for Manage Account options -->
<!--<div class="dropdown show">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Options
  </a>

  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <a class="dropdown-item" href="account.jsp">Profile</a>
    <a class="dropdown-item" href="booking_history.">Booking History</a>
    <a class="dropdown-item active" href="cancelTicket.jsp">Cancel Ticket</a>
    <a class="dropdown-item" href="user_management.jsp">User Management (Staff only)</a>
    <a class="dropdown-item" href="flight_management.jsp">Flight Management (Staff only)</a>
  </div>
</div>-->

<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp"); //If user is not logged in, redirect to login.jsp
    } else {
        Customer customer = (Customer)session.getAttribute("customer"); //Get customer object from session
        MongoDBManager_Tickets dbT = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = dbT.getTickets(customer); //Get all tickets booked by this customer
        MongoDBManager_Flights dbF = new MongoDBManager_Flights();
%>
        <div class="container w-40" style="margin-top: 50px; margin-bottom: 50px">
            <center>
            <h1>Cancel Ticket</h1>
            <br>
            <p>Choose from the list of your booked tickets to cancel:</p>
            <%
                if(tickets.isEmpty()){ //If no tickets, print error message instead of empty ticket table
            %>
                <p>You do not have any booked flights to cancel!</p>
            <%
                } else { //Prints our ticket details in a table
            %>
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Ticket ID</th>
                            <th scope="col">Airline</th>
                            <th scope="col">From</th>
                            <th scope="col">To</th>
                            <th scope="col">Departure Date</th>
                            <th scope="col">Departure Time</th>
                            <th scope="col">Arrival Date</th>
                            <th scope="col">Arrival Time</th>
                            <th scope="col">Seat Number</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <%
                        for (Ticket ticket : tickets){ //Get flight details for all of the customer's tickets
                            Flight flight = dbF.getFlight(ticket.getFlightID());
                    %>
                            <tr>
                                <td><%=ticket.getID()%></td>
                                <td><%=flight.getAirline()%></td>
                                <td><%=flight.getOrigin()%></td>
                                <td><%=flight.getDestination()%></td>
                                <td><%=flight.getDepartureDate()%></td>
                                <td><%=flight.getDepartureTime()%></td>
                                <td><%=flight.getArrivalDate()%></td>
                                <td><%=flight.getArrivalTime()%></td>
                                <td><%=ticket.getPassengerSeatNum()%></td>
                                <!-- Generate Cancel button for each ticket in table -->
                                    <!-- Pass ticketID as the value of the button for getParameter() in cancelTicketConfirm-->
                                    <!-- id=ticketID is for identifying the button in acceptance test cancelTicketATdd.java-->
                                <td><form action="cancelTicketConfirm.jsp" method="POST">
                                    <button type="submit" class="btn btn-primary" name="ticketIDBtn" id="ticketIDBtn"
                                            value="<%=ticket.getID()%>" 
                                            onclick="return confirm('Are you sure you want to cancel this ticket?')">Cancel</button>
                                </form></td> <!-- Confirm cancellation before redirect to cancelTicketConfirm.jsp -->
                            </tr>
                    <%
                        }
                    %>
                </table>
            <%
                }
            %>
            </center>
        </div>

<jsp:include page = "fc_footer.jsp"/>
<%
    }
%>
