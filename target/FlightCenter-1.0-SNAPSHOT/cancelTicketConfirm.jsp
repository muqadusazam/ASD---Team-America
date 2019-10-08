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
        <p>You have successfully cancelled:</p>
        <br>
        <!-- Deleted ticket details is styled like an actual plane ticket with a logo -->
        <p style="border:3px; border-style:solid; border-color:#174D9A; padding: 1em;">
            <img src="./resources/logo.png" width="30" height="30">
            <b>Ticket <%=ticketID%></b><br>
            <%=flight.getAirline()%> - <small>Seat <%=ticket.getPassengerSeatNum()%></small><br>
            <%=flight.getOrigin()%> (<%=flight.getDepartureDate()%> <%=flight.getDepartureTime()%>) <i><small>to</small></i> 
            <%=flight.getDestination()%> (<%=flight.getArrivalDate()%> <%=flight.getArrivalTime()%>)<br>
        </p>
        <br>
        <p>You will not be able to undo this action.</p>        
        <br>
        <!-- Redirect to booking history or cancelTicket upon clicking buttons-->
        <button type="button" class="btn btn-primary" onclick="location.href = 'booking_history.jsp'">Booking History</button>
        <button ctype="button" class="btn btn-secondary" onclick="location.href = 'cancelTicket.jsp'">Cancel Another Ticket</button>
        
    </div>
</body>

<jsp:include page = "fc_footer.jsp"/> <!-- Footer file for all pages-->
