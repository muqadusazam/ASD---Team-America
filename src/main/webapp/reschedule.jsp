<%@page import="fc.model.dao.*"%>
<%@page import="fc.controller.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="fc.model.*"%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account/reschedule"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
    <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
    <li class="toc-entry toc-h2 active anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>

</div>

<div class="mx-auto" style="float: left">
    <%
        MongoDBManager_Customers dbc = new MongoDBManager_Customers();
        Customer cust = dbc.getCustomer("2");
        session.setAttribute("loggedIn", cust);

        MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
        Ticket tick = dbt.getTicket(cust);
        session.setAttribute("oldTicket", tick);
        
        Customer customer = (Customer)session.getAttribute("loggedIn");
        Ticket ticket = (Ticket)session.getAttribute("ticket");
        
        if (customer == null) {
    %>
    <h2 class="text-danger"> You must be logged in to Reschedule Ticket. </h2>
    <%
        } else if (ticket == null) {
    %>
    <h2 class="text-warning"> Could not find ticket in the database. </h2>
    <%
        } else {
            MongoDBManager_Flights dbf = new MongoDBManager_Flights();
            Flight flight = dbf.getFlight(ticket.getFlightID());
            session.setAttribute("oldFlight", flight);
    %>
    <form>
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
            ArrayList<Flight> flights = dbf.getFlights(flight);
            if (flights == null) {
        %>
                <h2 class="text-warning"> There are no available tickets. </h2>
        <%
            } else {
        %>
        <tr>
            <td><b>Choose new ticket: &nbsp&nbsp</b></td>
            <td>
                <form action="RescheduleServlet" method="post">
                    <select name="newFlight" value="<%= flight.getID() %>">
                        <option selected="true" disabled="disabled">-- Select Ticket --</option>
                        <%
                            for (Flight f: flights) {
                        %>
                                <option name="<%= f.getID() %>" value="<%= f.getID() %>"> 
                                    Departure: <%= f.getOrigin() %> @ <%= f.getDepartureTime() %> <%= f.getDepartureDate() %>; 
                                    Destination: <%= f.getDestination()%> @ <%= f.getArrivalTime() %> <%= f.getArrivalDate() %>; 
                                </option>
                        <%
                            }
                        %>
                    </select>
                <span class="error text-danger"><em>${errors.dateErr}</em></span>
            </td>
        </tr>
        
        <tr>
            <td></td>
            <td></td>
            <td>
                <button type="submit" class="btn btn-success" style="float: right">Submit</button>
                <button type="reset" class="btn btn-danger" style="float: right">Cancel</button>
            </td>
        </tr>
        </form>

        <%
            }
        %>
        </tbody>
    </table>
    </form>
</div>
<%  }
%>

<jsp:include page = "fc_footer.jsp"/>
