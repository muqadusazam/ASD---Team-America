<%-- 
    Document   : flightAddSuccess
    Created on : 2019. 9. 28, ?? 8:37:58
    Author     : el181
--%>

<%@page import="java.util.Random"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Flight Added"/>
</jsp:include>
<%
    String airline = request.getParameter("airline");
            String origin = request.getParameter("origin");
            String destination= request.getParameter("destination");
            String departure_time= request.getParameter("departureTime");
            String departure_date= request.getParameter("departureDate");
            String arrival_time= request.getParameter("arrivalTime");
            String arrival_date= request.getParameter("arrivalDate");
            String status= request.getParameter("status");
            String price= request.getParameter("price");
            String available_seats= request.getParameter("seats");
            int key = (new Random()).nextInt(99999);
            String ID = "" + key;

%>

<div class ="container pt-5">
    <div class ="header row">
         <h2 style ="overflow-wrap:break-word; margin-top: 30px"> The flight (ID: <%=ID%>) has been added to database </h2>
    </div>
    <div class="container pt-2">
        <p>Flight(<%=ID%>) Details</p>
        <p>Airline: <%=airline%></p>
        <p>Origin: <%=origin%></p>
        <p>Destination: <%=destination%></p>
        <p>Departure Time: <%=departure_time%></p>
        <p>Departure Date: <%=departure_date%></p>
        <p>Arrival Time: <%=arrival_time%></p>
        <p>Arrival Date: <%=arrival_date%></p>
        <p>Status: <%=status%></p>
        <p>Price: <%=price%></p>    
        <p>Available Seats: <%=available_seats%></p>
    </div>
    <a href = "flight_management.jsp" class = "btn btn-lg btn-primary"style = "margin: 20px; float:right"> Back to the List </a>
</div>
<%
    //Call the database manager for "Flight" table
    MongoDBManager_Flights db = new MongoDBManager_Flights();   
    Flight flight = new Flight(ID,airline,origin,destination,departure_time,departure_date,arrival_time,arrival_date,status,price,available_seats);
    db.add(flight);
%>
<jsp:include page ="fc_footer.jsp"/>
