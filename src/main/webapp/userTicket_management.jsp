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

<%--Retrieves customer from database using "ID"--%>
<%
    String id = request.getParameter("ID");
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    Customer customer = customerDB.getCustomer(id);

    MongoDBManager_Tickets ticketDB = new MongoDBManager_Tickets();
    ArrayList<Ticket> tickets = ticketDB.getTickets(customer);
    
    MongoDBManager_Flights flightDB = new MongoDBManager_Flights();
    
%>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>User: <%= customer.getFirstName()%> <%=customer.getLastName()%></h1>
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
        <% for (Ticket ticket : tickets) {%>
        <tr>
            <td><%= ticket.getID()%></td>
            <td><%= ticket.getFlightID()%></td>
            <td><%= flightDB.getFlight(ticket.getFlightID()).getDestination()%> </td>
            <td><%= flightDB.getFlight(ticket.getFlightID()).getDepartureDate() %></td>
            <td><%= ticket.getPassengerSeatNum()%></td>
            <td><form action="userEditTicket_management.jsp" method="POST">
                    <button type="submit" name="ticketID" value=<%=ticket.getID()%> class="btn btn-primary">Reschedule</button> 
                </form></td>
        </tr>
        <% } %>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>