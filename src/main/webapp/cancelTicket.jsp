<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Cancel Ticket"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="fc.model.*"%>
<%@page import="fc.model.dao.*"%>

<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>
</div>

<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp");
    } else {
        Customer customer = (Customer)session.getAttribute("customer");
        MongoDBManager_Tickets db = new MongoDBManager_Tickets();
        ArrayList<Ticket> tickets = db.getTickets(customer);
%>

<!-- onclick="return confirm('Are you sure?')">Delete Profile </a></td>  NEED THIS FOR CONFIRMATION-->

<!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
<div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
    <center>
     <h1>Cancel Ticket</h1>
     <br>
     <p>Choose from the list of your booked tickets to cancel:</p>
     
     <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
              <th scope="col">Ticket ID</th>
              <th scope="col">Airline</th>
              <th scope="col">Origin</th>
              <th scope="col">Destination</th>
              <th scope="col">Departure</th>
              <th scope="col">Arrival</th>
              <th scope ="col">Seat Number</th>
            </tr>
        </thead>
         
         <!-- IF TICKETS = NULL, PRINT 'NO TICKETS BOOKED' ELSE DO BELOW CODE -->
     
     <% 
        for (Ticket ticket : tickets){
     %>
        <tr>
            <td><%=ticket.getID()%></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
     <% 
        }
     %>
     
     </table>


     <br>
     <br>
     <!-- COMMENT -->
     <button type="submit" class="btn btn-success" id="cancelTicketBtn">Cancel Ticket</button>
     </center>
</div>

<jsp:include page = "fc_footer.jsp"/>
<%
    }
%>
