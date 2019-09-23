<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="fc.model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userTicket_management"/>
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

<%--Retrieves customer from database using "ticketID"--%>
<%
    String ticketID = request.getParameter("ticketID");
    
    MongoDBManager_Tickets ticketDB = new MongoDBManager_Tickets();
    Ticket ticket = ticketDB.getTicket(ticketID);
    
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    Customer customer = customerDB.getCustomer(ticket.getCustomerID());
    
    //MongoDBManager_Flights flightDB = new MongoDBManager_Flights();
    //Flight flight = flightDB.getFlight(ticket.getFlightID());
    
%>

<div class="mx-auto" style="width: 800px; text-align: center;" >
  <%-- <h1>User: <%=customer.getFirstName()%> <%=customer.getLastName()%></h1> --%>
</div>

<div class="mx-auto" style="width: 950px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Ticket ID</th>
                <th>Flight No.</th>
                <th>Country</th>
                <th>Flight date</th>
                <th>Seat Number</th>   
                <th>Action</th>
            </tr>
        </thead>
        
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>