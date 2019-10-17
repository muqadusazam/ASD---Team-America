<%@page import="java.util.*"%>
<%@page import="fc.model.dao.*"%>
<%@page import="fc.model.*"%>
<%@page import="fc.controller.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account/reschedule"/>
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

<div class="mx-auto" style="float: left">
    <%
        if (session.getAttribute("customer") == null) { //Check if customer is logged in
    %>
    <h2 class="text-danger"> You must be logged in to Reschedule Ticket. Click <a href="login.jsp">here</a> to login. </h2>
    <%
        } else if (session.getAttribute("success") != null) {
    %>
    <h1><p>Reschedule ticket</p></h1>
    <div class="alert alert-success" role="alert">
        <strong>Success!</strong> <%= session.getAttribute("success") %>. Click <a href="booking_history.jsp">here</a> to go back to booking history.
    </div>
    <%
            session.setAttribute("success", null);
            session.setAttribute("error", null);
        } else if (session.getAttribute("error") != null) {
    %>
    <h1><p>Reschedule ticket</p></h1>
    <div class="alert alert-error" role="alert">
        <strong>Error!</strong> <%= session.getAttribute("error") %>
    </div>
    <%
            session.setAttribute("success", null);
            session.setAttribute("error", null);
        } else { //Customer & Ticket are contained in session
            Customer customer = (Customer)session.getAttribute("customer");

            //Get Ticket object from database
            MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
            Ticket ticket = dbt.getTicket(request.getParameter("ticketID"));
            session.setAttribute("oldTicket", ticket);

            //Get flight from database based on ticket in session
            MongoDBManager_Flights dbf = new MongoDBManager_Flights();
            Flight flight = dbf.getFlight(ticket.getFlightID());

            //Set flight in session
            session.setAttribute("flight", flight);

            //Display ticket + flight info
    %>
    <h1><p>Reschedule ticket</p></h1>
    <table class="table table-hover">
        <tbody>
        <tr>
            <td><b>Ticket ID:</b></td>
            <td><%= ticket.getID() %></td>
        </tr>
        <tr>
            <td><b>Customer ID:</b></td>
            <td><%= ticket.getCustomerID() %></td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>First name:</b></td>
            <td><%= customer.getFirstName() %></td>
        </tr>
        <tr>
            <td><b>Last name:</b></td>
            <td><%= customer.getLastName() %></td>
        </tr>
        <tr>
            <td><b>DOB:</b></td>
            <td><%= customer.getDOB() %></td>
        </tr>
        <tr>
            <td><b>Price:</b></td>
            <td>$<%= flight.getPrice() %></td>
        </tr>
        <tr>
            <td><b>Airline:</b></td>
            <td><%= flight.getAirline() %></td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>Flight ID:</b></td>
            <td><%= ticket.getFlightID() %></td>
        </tr>
        <tr>
            <td><b>Departure:</b></td>
            <td><%= flight.getOrigin() %></td>
        </tr>
        <tr>
            <td><b>Departure date:</b></td>
            <td><%= flight.getDepartureDate() %></td>
        </tr>
        <tr>
            <td><b>Departure time (AEST):</b></td>
            <td><%= flight.getDepartureTime() %></td>
        </tr>
        <tr>
            <td><b>Seat number:</b></td>
            <td><%= ticket.getPassengerSeatNum() %></td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>Destination:</b></td>
            <td><%= flight.getDestination() %></td>
        </tr>
        <tr>
            <td><b>Destination arrival date:</b></td>
            <td><%= flight.getArrivalDate() %></td>
        </tr>
        <tr>
            <td><b>Destination arrival time (AEST):&nbsp&nbsp</b></td>
            <td><%= flight.getArrivalTime() %></td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <%
            //Get all flights in database with same destination on ticket
            ArrayList<Flight> flights = dbf.getFlights(flight);
            
            //Check if flights is empty
            if (flights == null || flights.size() == 1) {
        %>
        <tr>
            <td><b>Choose new ticket: &nbsp&nbsp</b></td>
            <td>
                There are no flights to reschedule to. 
                <form action="booking_history.jsp">
                <button type="submit" class="btn btn-danger" style="float: right">Go back</button>
                </form>
            </td>
        </tr>
        <%
            //Display all flights in array when not empty/null
            } else {
        %>
        <tr>
            <td><b>Choose new ticket: &nbsp&nbsp</b></td>
            <td>
                <form action="RescheduleServlet" method="POST">
                    <select name="newFlight" value="<%= flight.getID() %>">
                        <option selected="true" disabled="disabled">-- Select Ticket --</option>
                        <%
                            //Loop through all flights in array and display in drop down menu
                            for (Flight f: flights) {
                                if (!f.getID().equalsIgnoreCase(flight.getID())) {
                        %>
                                <option name="<%= f.getID() %>" value="<%= f.getID() %>"> 
                                    Departure: <%= f.getOrigin() %> @ <%= f.getDepartureTime() %> <%= f.getDepartureDate() %>; 
                                    Destination: <%= f.getDestination()%> @ <%= f.getArrivalTime() %> <%= f.getArrivalDate() %>; 
                                </option>
                        <%
                            }}
                        %>
                    </select>
                    <button type="submit" class="btn btn-success" style="float: right" id="rescheduleBtn">Submit</button>
                    <button type="reset" class="btn btn-danger" style="float: right">Cancel</button>
                    <input id="ticketID" name="ticketID" value="<%= request.getParameter("ticketID") %>" type="hidden">
                </form>
            </td>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>
</div>
<%  }
%>

<jsp:include page = "fc_footer.jsp"/>