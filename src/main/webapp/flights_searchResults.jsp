<%@page import="fc.model.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flightSearch"/>
</jsp:include>

<% 
    MongoDBManager_Flights db = new MongoDBManager_Flights();       //Create connection to mLab
    ArrayList<Flight> flights = (ArrayList<Flight>)request.getAttribute("flights");
    String title = (String)request.getAttribute("title");
   
%>

<div class="container" style="margin-top: 50px">
    <div class="mx-auto" style="width: 800px; text-align: center;" >
        <h1 class ="bd-content-title">&nbsp;<%=title %></h1>

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
                            </tr>
                        <%
                                }
                        %>
          </tbody>
        </table>
        
</div>


<jsp:include page = "fc_footer.jsp"/>