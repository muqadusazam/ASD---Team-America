<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Delete"/>
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
    String id = request.getParameter("ID");
    MongoDBManager_Flights flightDB = new MongoDBManager_Flights();
    Flight flight = flightDB.getFlight(id);
%>

    <div class="container" style="margin-top: 50px; float: right">
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