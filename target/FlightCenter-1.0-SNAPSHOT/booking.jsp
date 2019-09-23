<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flights"/>
</jsp:include>
<%
    MongoDBManager_Flights db = new MongoDBManager_Flights();   
    Flight flight = db.getFlight(request.getParameter("flightId"));
    String customerID = (String)session.getAttribute("customer_ID");
    if (customerID == null) {
%>
    <h2 class="text-warning"> You must login to book flights. </h2>
<%
    } else {
        MongoDBManager_Customers dbc = new MongoDBManager_Customers();
        Customer user = dbc.getCustomer(customerID);
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">&nbsp;Book flight</h1>
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
                <button type="submit" class="btn btn-success" style="float: right" id="bookBtn">Submit</button>
                <button type="button" class="btn btn-danger" onclick="location.href = 'flights.jsp'">Cancel</button>
            </td>
        </table>
    </div>
<%
    }
%>
<jsp:include page = "fc_footer.jsp"/>