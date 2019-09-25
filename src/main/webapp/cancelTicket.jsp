<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Cancel Ticket"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="fc.model.*"%>
<%@page import="fc.model.dao.*"%>

<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="flight_management.jsp" class ="anthy2">Flight Management (staff only)</a></li>
    </ul>
</div>


    <!-- COMMENT ON CODE *************** -->

<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp");
    } else {
        Customer customer = (Customer)session.getAttribute("customer");
        MongoDBManager_Tickets dbT = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = dbT.getTickets(customer);
        MongoDBManager_Flights dbF = new MongoDBManager_Flights();
%>
        <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
            <center>
            <h1>Cancel Ticket</h1>
            <br>
            <p>Choose from the list of your booked tickets to cancel:</p>
            <% 
                if(tickets.isEmpty()){
            %>
                <p>You do not have any booked flights to cancel!</p>
            <%
                } else {
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
                        for (Ticket ticket : tickets){
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
                                <td><button type="submit" class="btn btn-primary" id="cancelBtn">Cancel</button></td>
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