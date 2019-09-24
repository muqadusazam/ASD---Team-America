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

<!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
<div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
    <center>
     <h1>Cancel Ticket</h1>
     <br>
     <p>Choose from the list of your booked tickets to cancel:</p>
     
<%
    MongoDBManager_Tickets db = new MongoDBManager_Tickets();
    ArrayList<Ticket> tickets = db.getTickets();
    Customer customer = (Customer)session.getAttribute("customer");
    
    
%>
     
     <select>
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
     </select>
     <br>
     <br>
     <!-- COMMENT -->
     <button type="submit" class="btn btn-success" id="cancelTicketBtn">Cancel Ticket</button>
     </center>
</div>