<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/Flight Management"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="flight_management.jsp" class ="anthy2">Flight Management (staff only)</a></li>
    </ul>
</div>

<%  
    //Call the database manager for "Flight" table
    MongoDBManager_Flights db = new MongoDBManager_Flights();   
    
    //Declare ArrayList for Flight object and initialize with flight data from database 
    //getFlight returns ArrayList of Flight object in the database table 
    ArrayList<Flight> flights = db.getFlights();
%>
    <div class="container" style="margin-top: 40px; float:middle">
        <h1 class ="bd-content-title">&nbsp;List of Flights</h1>
        <a href = "flightAdd_management.jsp" class = "btn btn-lg btn-primary" style="margin:5px; float: right"> Add Flight </a> 
        <!--Table for the list of flights-->
        <table class="table"style="margin-top: 20px; margin-right: 30px">
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
              <th scope="col">Option</th>
              <th scope ="col"> </th>
            </tr>
          </thead>
          <tbody>
                        <%
                        for (Flight currentFlight : flights)  //for loop for flights data in the "Flight" table
                                                               //to show all data in flights in the form of table
                            {
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
                                <td>
                                        <div style="float: left;"> 
                                            <form action="flightUpdate_management.jsp" method="POST">
                                                <button type="submit" name="updateID" value="<%= currentFlight.getID() %>" class="btn btn-primary">Update</button> 
                                            </form>
                                        </td>
                                        <td>
                                            <form action="flightDelete_management.jsp" method="POST">
                                                <button type="submit" name="deleteID" value="<%= currentFlight.getID() %>" class="btn btn-primary">Delete</button> 
                                            </form>
                                        </div>
                                </td>
                            </tr>
                        <%
                            }
                        %>
          </tbody>
        </table>
    </div>
<jsp:include page = "fc_footer.jsp"/>