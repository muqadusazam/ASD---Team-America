<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userDeleteTicket_management"/>
</jsp:include>
<%--Retrieves ticket from database using "deleteTicketID"--%>
<%
    //checks if user is logged and if use is admin
    Customer logInCustomer = (Customer)session.getAttribute("customer");
    if (logInCustomer == null) {
        response.sendRedirect("login.jsp");
    } else if ((Integer.parseInt(logInCustomer.getID())/100000) != 9){
        response.sendRedirect("noAccess_management.jsp");
    }
    String id = request.getParameter("deleteTicketID");
    MongoDBManager_Tickets ticketDB = new MongoDBManager_Tickets();
    Ticket ticket = ticketDB.getTicket(id);
    String customerID = ticket.getCustomerID();
    ticketDB.remove(ticket);
%>
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Ticket Deleted Successfully!</h1>
</div>

<div class="mx-auto" style="width: 950px; text-align: center;">
    <form action="userTicket_management.jsp" method="POST">
        <button type="submit" name="ID" value=<%=customerID%> class="btn btn-primary">Go Back</button> 
    </form>
</div>

<jsp:include page = "fc_footer.jsp"/>
