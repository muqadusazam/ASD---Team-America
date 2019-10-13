<%@page import="java.util.ArrayList"%>
<<%@page import="fc.model.Flight"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.*"%>
<%@page import="fc.model.*"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flights"/>
</jsp:include>
<%
    if (session.getAttribute("customer") == null) {
%>
    <h2 class="text-warning"> You must login to book flights. </h2>
<%
    } else if (session.getAttribute("success") != null) {
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">Book flight</h1>
        <table class="table"style="margin-top: 20px">
            <h2 class="text-success"> 
                Your ticket has been successfully booked. Click <a href="booking_history.jsp">here</a> to see your booking history.
            </h2>
        </table>
    </div>
<%
        session.setAttribute("success", null);
    } else if (session.getAttribute("error") != null) {
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">Book flight</h1>
        <table class="table"style="margin-top: 20px">
            <h2 class="text-success"> 
                <%= session.getAttribute("error") %> Click <a href="booking_history.jsp">here</a> to see your booking history.
            </h2>
        </table>
    </div>
<%
        session.setAttribute("error", null);
    } else if (request.getParameter("cancel") != null) {
        session.setAttribute("flightID", null);
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">Book flight</h1>
        <table class="table"style="margin-top: 20px">
            <h2 class="text-danger"> 
                Your ticket has been successfully cancelled. Click <a href="flights_search.jsp">here</a> to go back to flights.
            </h2>
        </table>
    </div>
<%
    } else {
        Customer user = (Customer)session.getAttribute("customer");

        MongoDBManager_Flights dbf = new MongoDBManager_Flights();   
        Flight flight = dbf.getFlight(request.getParameter("flightID"));

        MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = dbt.getTickets(user);
        boolean hasDuplicate = false;
        
        for (Ticket t: tickets) {
            if (t.getFlightID().equals(flight.getID())) {
                hasDuplicate = true;
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">Book flight</h1>
        <table class="table"style="margin-top: 20px">
            <h2 class="text-danger"> 
                You already have this flight booked. Click <a href="flights_search.jsp">here</a> to go back to flights.
            </h2>
        </table>
    </div>
<%
            }
        }

        if (hasDuplicate == false) {
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">Book flight</h1>
        <table class="table"style="margin-top: 20px">
            <tr>
            <td style="width: 30%;"><b>First name:</b></td>
            <td><%= user.getFirstName() %></td>
        </tr>
        <tr>
            <td><b>Last name:</b></td>
            <td><%= user.getLastName() %></td>
        </tr>
        <tr>
            <td><b>DOB:</b></td>
            <td><%= user.getDOB() %></td>
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
            <td><%= flight.getID() %></td>
        </tr>
        <tr>
            <td><b>Departure:</b></td>
            <td><%= flight.getOrigin() %></td>
        </tr>
        <tr>
            <td><b>Departure date:</b></td>
            <td><%= flight.getDepartureTime() %></td>
        </tr>
        <tr>
            <td><b>Departure time (AEST):</b></td>
            <td><%= flight.getDepartureDate() %></td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>Destination:</b></td>
            <td><%= flight.getDestination() %></td>
        </tr>
        <tr>
            <td><b>Destination arrival date:</b></td>
            <td><%= flight.getArrivalTime() %></td>
        </tr>
        <tr>
            <td><b>Destination arrival time (AEST):&nbsp&nbsp</b></td>
            <td><%= flight.getArrivalDate() %></td>
        </tr>
          </tbody>
        </table>
        <table style="width: auto; margin-right: 0px; margin-left: auto;">
            <td>
                <form method="POST" action ="CheckoutServlet">
                    <button type="submit" class="btn btn-success" style="float: right" id="submitBtn">
                        Submit
                    </button>
                    <input type="hidden" name="flightID" id="flightID" value="<%= flight.getID() %>">
                </form>
                <form method="POST" action="booking.jsp">
                    <button type="submit" class="btn btn-danger" id="cancel" name="cancel">
                        Cancel
                    </button>
                </form>
            </td>
        </table>
    </div>
<%
    }}
%>
<jsp:include page = "fc_footer.jsp"/>