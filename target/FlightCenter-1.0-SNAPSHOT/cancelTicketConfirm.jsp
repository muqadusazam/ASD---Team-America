<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Ticket Cancelled"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="fc.model.*"%>
<%@page import="fc.model.dao.*"%>

<%
    String ticketID = request.getParameter("ticketIDBtn"); //Gets ticket ID passed from button in cancelTicket.jsp
    MongoDBManager_Tickets db = new MongoDBManager_Tickets(); 
    Ticket ticket = db.getTicket(ticketID); //Gets ticket object based on ticket ID
    db.remove(ticket); //Remove the ticket from Ticket collection
    
    MongoDBManager_Flights dbF = new MongoDBManager_Flights();
    Flight flight = dbF.getFlight(ticket.getFlightID()); //Gets flight details of deleted ticket for printing
%>

<body>
    <!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
    <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px" align="center">
        
        <h1>Ticket Cancelled!</h1>
        <br>
        <p>You have cancelled the following ticket:</p>
        <br>
        <!-- Prints our the deleted ticket's information-->
        <div class="container w-35" align="left">
        <p><b>Ticket ID:</b> <%=ticketID%></p>
        <p><b>Airline:</b> <%=flight.getAirline()%></p>
        <p><b>From:</b> <%=flight.getOrigin()%></p>
        <p><b>To:</b> <%=flight.getDestination()%></p>
        <p><b>Depature date:</b> <%=flight.getDepartureDate()%></p>
        <p><b>Departure Time:</b> <%=flight.getDepartureTime()%></p>
        <p><b>Arrival Date:</b> <%=flight.getArrivalDate()%></p>
        <p><b>Arrival Time:</b> <%=flight.getArrivalTime()%></p>
        </div>
        
        <br>
        <!-- Redirect to booking history or cancelTicket upon clicking buttons-->
        <button type="button" class="btn btn-primary" onclick="location.href = 'booking_history.jsp'">Booking History</button>
        <button ctype="button" class="btn btn-secondary" onclick="location.href = 'cancelTicket.jsp'">Cancel Another Ticket</button>
        
    </div>
</body>
    
    
<% 
//SCRIPT CODE TO MAKE TICKET ENTRIES
//    for (int i = 0; i < 3; i++){
//        Ticket test = new Ticket("001", "179577", "3", "TEST1" );
//        MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
//        dbt.add(test);
//    }

%>

<jsp:include page = "fc_footer.jsp"/> <!-- Footer file for all pages-->
