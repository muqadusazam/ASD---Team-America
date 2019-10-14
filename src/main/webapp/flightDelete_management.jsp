<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Delete"/>
</jsp:include>

<%
    String id = request.getParameter("deleteID");
    MongoDBManager_Flights flightDB = new MongoDBManager_Flights();
    Flight flight = flightDB.getFlight(id);
%>

    <div class="container" style="margin-top: 50px;">
        <h1 class ="bd-content-title">&nbsp;Delete Flight</h1>
        <h2 style ="overflow-wrap:break-word; margin-top: 30px"> The flight ID (<%=flight.getID()%>) has been deleted from database </h2>
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
                            <tr>
                                <th scope = "row" ><%=flight.getID()%></th>
                                <td ><%=flight.getAirline()%></td>
                                <td ><%=flight.getOrigin()%></td>
                                <td ><%=flight.getDestination()%></td>
                                <td ><%=flight.getDepartureDate()%></td>
                                <td ><%=flight.getArrivalDate()%></td>
                                <td ><%=flight.getStatus()%></td>
                                <td ><%=flight.getPrice()%></td>
                            </tr>
<a href = "flight_management.jsp" class = "btn btn-lg btn-primary"style = "margin: 20px; float:right"> Back to the List </a>
                            
<%
    flightDB.remove(flight);
%>

<jsp:include page = "fc_footer.jsp"/>