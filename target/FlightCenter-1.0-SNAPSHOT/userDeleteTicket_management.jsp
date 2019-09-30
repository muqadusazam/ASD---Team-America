<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userDeleteTicket_management"/>
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
<%--Retrieves ticket from database using "deleteTicketID"--%>
<%
    String id = request.getParameter("deleteTicketID");
    MongoDBManager_Tickets ticketDB = new MongoDBManager_Tickets();
    Ticket ticket = ticketDB.getTicket(id);
    String customerID = ticket.getCustomerID();
    ticketDB.remove(ticket);
%>
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Ticket Deleted Successfully!</h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <form action="userTicket_management.jsp" method="POST">
        <button type="submit" name="ID" value=<%=customerID%> class="btn btn-danger">Delete</button> 
    </form>
</div>

<jsp:include page = "fc_footer.jsp"/>
