<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flights"/>
</jsp:include>
<%
    MongoDBManager_Flights db = new MongoDBManager_Flights();
    ArrayList<Flight> flights = db.getFlights();
%>
<div class="container" style="margin-top: 50px">
    <h1 class ="bd-content-title">&nbsp;List of Flights</h1>
    <table class="table"style="margin-top: 20px">
        <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Airline</th>
                <th scope="col">Origin</th>
                <th scope="col">Destination</th>
                <th scope="col">Departure</th>
                <th scope="col">Arrival</th>
                <th scope ="col">Status</th>
                <th scope="col">Price</th>
                    <%
                        if (session.getAttribute("customer") != null) {
                    %>
                <th scope="col">Action</th>
                    <%
                        }
                    %>
            </tr>
        </thead>
        <tbody>
            <%
                Collections.sort(flights);
                for (Flight currentFlight : flights) {
            %>
            <tr>
                <th scope = "row" ><%=currentFlight.getID()%></th>
                <td ><%=currentFlight.getAirline()%></td>
                <td ><%=currentFlight.getOrigin()%></td>
                <td ><%=currentFlight.getDestination()%></td>
                <td ><%=currentFlight.getDepartureDate()%></td>
                <td ><%=currentFlight.getArrivalDate()%></td>
                <td ><%=currentFlight.getStatus()%></td>
                <td ><%=currentFlight.getPrice()%></td>
                <%
                    if (session.getAttribute("customer") != null) {
                %>
                <td>
                    <form action="booking.jsp" method="POST">
                        <button type="submit" class="btn btn-primary" name="flightID" id="flightID<%=currentFlight.getID()%>" value="<%=currentFlight.getID()%>">Book</button>
                    </form>
                </td>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
<jsp:include page = "fc_footer.jsp"/>