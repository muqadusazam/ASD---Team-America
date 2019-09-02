<%@page import="fc.model.dao.*"%>
<%@page import="fc.controller.*" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="fc.model.*"%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account/reschedule"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
    <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
    <li class="toc-entry toc-h2 active anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>

</div>

<div class="mx-auto" style="float: left">
    <%
        Ticket oldTicket = (Ticket)session.getAttribute("ticket");
        Flight oldFlight = (Flight)session.getAttribute("oldFlight");
        Ticket newTicket = new Ticket(oldTicket.getID(), oldTicket.getCustomerID(), 
                request.getParameter("newFlight"), oldTicket.getPassengerSeatNum());
        
        MongoDBManager_Tickets dbt = new MongoDBManager_Tickets();
        dbt.remove(oldTicket);
        dbt.add(newTicket);
        
        if (oldTicket.getFlightID() != dbt.getTicket(newTicket.getID()).getFlightID()) {
            %>
            <h2 class="text-success"> Successfully rescheduled ticket. </h2>
            <%
        } else {
            %>
            <h2 class="text-danger"> Error rescheduling ticket. </h2>
            <%
        }
    %>

</div>

<jsp:include page = "fc_footer.jsp"/>
