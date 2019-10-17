<%@page import="java.util.*"%>
<%@page import="fc.model.dao.*"%>
<%@page import="fc.model.*"%>
<%@page import="fc.controller.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userEditTicket"/>
</jsp:include>
<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp");
    }
    //MongoDBDatabase initiliazation
    MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
    MongoDBManager_Flights dbf = new MongoDBManager_Flights();
    MongoDBManager_Customers dbc = new MongoDBManager_Customers();

    Ticket ticket = dbt.getTicket((String) request.getParameter("ticketID"));
    session.setAttribute("origTicket", ticket);

    Flight flight = dbf.getFlight(ticket.getFlightID());
    session.setAttribute("origFlight", flight);

    Customer customer = dbc.getCustomer(ticket.getCustomerID());
%>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Reschedule Ticket</h1>
</div>

<div class="mx-auto" style="float: right; text-align: left;" >
 

    <table class="table table-hover">
        <tbody>
            <tr>
                <td><b>Ticket ID:</b></td>
                <td><%= ticket.getID()%></td>
            </tr>
            <tr>
                <td><b>Customer ID:</b></td>
                <td><%= ticket.getCustomerID()%></td>
            </tr>

            <tr><td><br></td></tr>

            <tr>
                <td><b>First name:</b></td>
                <td><%= customer.getFirstName()%></td>
            </tr>
            <tr>
                <td><b>Last name:</b></td>
                <td><%= customer.getLastName()%></td>
            </tr>
            <tr>
                <td><b>DOB:</b></td>
                <td><%= customer.getDOB()%></td>
            </tr>
            <tr>
                <td><b>Price:</b></td>
                <td>$<%= flight.getPrice()%></td>
            </tr>
            <tr>
                <td><b>Airline:</b></td>
                <td><%= flight.getAirline()%></td>
            </tr>

            <tr><td><br></td></tr>

            <tr>
                <td><b>Flight ID:</b></td>
                <td><%= ticket.getFlightID()%></td>
            </tr>
            <tr>
                <td><b>Departure:</b></td>
                <td><%= flight.getOrigin()%></td>
            </tr>
            <tr>
                <td><b>Departure date:</b></td>
                <td><%= flight.getDepartureDate()%></td>
            </tr>
            <tr>
                <td><b>Departure time (AEST):</b></td>
                <td><%= flight.getDepartureTime()%></td>
            </tr>
            <tr>
                <td><b>Seat number:</b></td>
                <td><%= ticket.getPassengerSeatNum()%></td>
            </tr>

            <tr><td><br></td></tr>

            <tr>
                <td><b>Destination:</b></td>
                <td><%= flight.getDestination()%></td>
            </tr>
            <tr>
                <td><b>Destination arrival date:</b></td>
                <td><%= flight.getArrivalDate()%></td>
            </tr>
            <tr>
                <td><b>Destination arrival time (AEST):&nbsp&nbsp</b></td>
                <td><%= flight.getArrivalTime()%></td>
            </tr>

            <tr><td><br></td></tr>

            <%
                //Get all flights in database with same destination on ticket
                ArrayList<Flight> flights = dbf.getFlights(flight);

                //Check if flights is empty
                if (flights == null) {
            %>
        <h2 class="text-warning"> There are no available tickets. </h2>
        <% } else { //Display all flights in array when not empty/null %>
        <tr>
            <td><b>Choose new ticket: &nbsp&nbsp</b></td>
            <td>
                <form action="AdminRescheduleServlet" method="POST">
                    <select name="newFlight" value="<%= flight.getID()%>">
                        <option selected="true" disabled="disabled">-- Select Ticket --</option>
                        <%
                            //Loop through all flights in array and display in drop down menu
                            for (Flight f : flights) {
                        %>
                        <option name="<%= f.getID()%>" value="<%= f.getID()%>"> 
                            Departure: <%= f.getOrigin()%> @ <%= f.getDepartureTime()%> <%= f.getDepartureDate()%>; 
                            Destination: <%= f.getDestination()%> @ <%= f.getArrivalTime()%> <%= f.getArrivalDate()%>; 
                        </option>
                        <%
                            }
                        %>
                    </select>
                    <button type="submit" name="ID" value="<%=ticket.getCustomerID()%>" class="btn btn-success" style="float: right" id="rescheduleBtn">Submit</button>
                    <button type="reset" class="btn btn-danger" style="float: right">Cancel</button>
                </form>
            </td>
        </tr>
        <% }%>
        </tbody>
    </table>
</div>


<jsp:include page = "fc_footer.jsp"/>