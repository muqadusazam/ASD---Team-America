<%@page import="java.util.ArrayList"%>
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
        
        <form action="flights_searchResults.jsp" method="get">        <!-- Form for search query-->
                From&nbsp;<select name ="searchOrigin" placeholder="Select Airport" >     <!-- Dropdown box for Origin-->
                    <option value="" selected disabled hidden>Select Origin</option>        <!-- Default, hidden option - used for placeholder--> 
                    <% for (String origin: db.getAllOrigins()) { %>    <!-- for loop that creates an <option> for each unique Origin -->              
                    <option><%=origin %></option>
                    <% } %>
                </select>
            
                &nbsp;To&nbsp;<select name ="searchDestination" placeholder="Select Destination" >        <!-- Dropdown box for Destination-->
                    <option value="" selected disabled hidden>Select Destination</option>       <!-- Default, hidden option - used for placeholder-->
                    <% for (String destination: db.getAllDestinations()) { %>    <!-- for loop that creates an <option> for each unique Destination -->             
                    <option><%=destination %></option>
                    <% } %>
                </select>
            
                &nbsp;Arriving before&nbsp;<input type="date" name ="searchArrivalDate">       <!-- Date box for Arrival Date-->
                
                <input type="submit" value ="Search">       <!-- Submit button, send form entries to ****-->
            
        </form>
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
                if (session.getAttribute("customer_ID") != null) {
              %>
              <th scope="col">Action</th>
              <%
                  }
               %>
            </tr>
          </thead>
          <tbody>
                                                 <%
                        for (Flight currentFlight : flights) //for loop for flights 
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
                                <%
                                    if (session.getAttribute("customer_ID") != null) {
                                %>
                                <td>
                                    <form action="booking.jsp" method="POST">
                                        <button type="submit" class="btn btn-success" name="flightId" value="<%=currentFlight.getID()%>">Book</button>
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