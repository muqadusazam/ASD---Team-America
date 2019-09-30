<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userDetail_management"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>
</div>
<%--Retrieves customer from database using "ID"--%>
<%
    String id = request.getParameter("deleteTicketID");
    MongoDBManager_Tickets ticketDB = new MongoDBManager_Tickets();
    Ticket ticket = ticketDB.getTicket(id);
    ticketDB.remove(ticket);
%>
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Deleting flights....</h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <%response.sendRedirect("userTicket_management.jsp");%>
</div>

<jsp:include page = "fc_footer.jsp"/>
