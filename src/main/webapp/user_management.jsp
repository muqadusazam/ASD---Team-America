<%@page import="fc.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/user_management"/>
</jsp:include>

<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="flight_management.jsp" class ="anthy2">Flight Management (staff only)</a></li>
    </ul>
</div>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Administration Page</h1>

    <div class="input-group mb-3">
        <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button>
            <form action="userAdd_management.jsp" method="POST">
                <button class="btn btn-success" type="submit">Add New User</button>
            </form>
        </div>
    </div>
</div>

<% 
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    ArrayList<Customer> customers = customerDB.getCustomers();
%>

<div class="mx-auto" style="width: 950px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>DOB</th>
                <th>Action</th>              
            </tr>
        </thead>
        <% for(Customer customer : customers) {  %>
        <tr>
            <td><%= customer.getID() %></td>
            <td><%= customer.getFirstName() %></td>
            <td><%= customer.getLastName() %></td>
            <td><%= customer.getEmail() %></td>
            <td><%= customer.getDOB() %></td>
            <td>
                <div style="width:150px;">
                    <div style="float: left;"> 
                        <form action="userDetail_management.jsp" method="POST">
                            <button type="submit" name="ID" value="<%= customer.getID() %>" class="btn btn-primary">View</button> 
                        </form>
                    </div>
                    <div style="float: right;"> 
                        <form action="userTicket_management.jsp" method="POST">
                            <button type="submit" class="btn btn-info">Tickets</button>
                        </form>
                    </div>
                </div>
            </td>
        </tr> 
        <% } %>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>
