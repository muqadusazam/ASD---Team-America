<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flights"/>
</jsp:include>
<%  
    //Call the database manager for "Flight" table
    MongoDBManager_Flights db = new MongoDBManager_Flights();   
    
    //Declare ArrayList for Flight object and initialize with flight data from database 
    //getFlight returns ArrayList of Flight object in the database table 
    ArrayList<Flight> flights = db.getFlights();
    
    String ID = "111";//****get ID of current user here*****
    //String ID = (String)session.getAttribute("current_user");
    boolean staff = true;
    //staff = manager.isStaff(ID); // check if the user is staff (authorised user for create/update/delete)
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">&nbsp;List of Flights</h1>
        
        <%if(staff){%> <!-- check if user is Staff and only show button for staff -->
        <a href = "add_movie.jsp" class = "btn btn-lg btn-primary button1"> Add Movie </a> <!--go to add movie page -->
        <%}%>
        <!--Table for the list of flights-->
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
                            </tr>
                        <%
                            }
                        %>
          </tbody>
        </table>
    </div>
<jsp:include page = "fc_footer.jsp"/>