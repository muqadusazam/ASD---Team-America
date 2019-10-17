<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="fc.model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<%@page import="fc.model.Flight"%>

<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userTicket_management"/>
</jsp:include>
<%--Retrieves customer from database using "ID"--%>
<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp");
    }

    String id = request.getParameter("ID");
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    MongoDBManager_Flights flightDB = new MongoDBManager_Flights();
    MongoDBManager_Tickets ticketDB = new MongoDBManager_Tickets();
    Customer customer = customerDB.getCustomer(id);
    ArrayList<Ticket> tickets = ticketDB.getTickets(customer);


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
                <th>From</th>
                <th>To</th>
                <th>Departure</th>
                <th>Seat Number</th>   
                <th>Action</th>
            </tr>
        </thead>
        <% for (Ticket ticket : tickets) {%>
        <tr>
            <td><%= ticket.getID()%></td>
            <td><%= ticket.getFlightID()%></td>
            <td><%= flightDB.getFlight(ticket.getFlightID()).getOrigin()%></td>
            <td><%= flightDB.getFlight(ticket.getFlightID()).getDestination()%></td>
            <td><%= flightDB.getFlight(ticket.getFlightID()).getDepartureDate()%></td>
            <td><%= ticket.getPassengerSeatNum()%></td>
            <td>
                <div style="width:200px;">
                    <div style="float: left;"> 
                        <form action="userEditTicket_management.jsp" method="POST">
                            <button type="submit" name="ticketID" value=<%=ticket.getID()%> class="btn btn-primary">Reschedule</button> 
                        </form>
                    </div>
                    <div style="float: right;"> 
                        <form action="userDeleteTicket_management.jsp" method="POST">
                            <button type="submit" name="deleteTicketID" value=<%=ticket.getID()%> class="btn btn-danger">Delete</button> 
                        </form>
                    </div>
                </div>
            </td>
        </tr>
        <% }%>
    </table>
</div>

<jsp:include page = "fc_footer.jsp"/>