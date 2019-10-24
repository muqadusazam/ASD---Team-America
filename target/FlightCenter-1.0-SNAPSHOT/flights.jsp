<%@page import="java.util.Collections"%>
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
        <div class="mx-auto" style="width: 800px; text-align: center;" >
        <h1 class ="bd-content-title">&nbsp;List of Flights</h1>
        
        <!-- Form for search query-->
        <form action="FlightsSearchServlet" method="GET">
             <!-- Dropdown box for Origins-->
                Find a flight from&nbsp;<select name ="searchOrigin" >                    
                    <!-- Default, hidden option - used for placeholder--> 
                    <option value="" selected disabled hidden>Anywhere</option>                    
                    <!-- for loop that creates an <option> for each unique Origin -->
                    <% for (String origin: db.getAllOrigins()) { %>                  
                    <option><%=origin %></option>
                    <% } %>
                </select>
                
                <!--Text box to search destinations-->
                &nbsp;to&nbsp;<input type="text" name="searchDestination" placeholder="Anywhere">
                         
                <!-- Date box for Arrival Date-->
                &nbsp;by&nbsp;<input type="date" name ="searchArrivalDate">       
                
                <!-- Submit button, send form entries to FlightSearchServlet-->
                <input type="submit" value ="Search">
                
                <br><span class="error text-danger"><em>${errors.searchDestErr}</em></span>
            
        </form>
        </div>
    <table class="table"style="margin-top: 20px">
        <thead class="thead-dark">
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
                        <button type="submit" class="btn btn-primary" name="flightID" value="<%=currentFlight.getID()%>">Book</button>
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

<jsp:include page = "fc_footer.jsp"/>