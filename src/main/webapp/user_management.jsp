<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="fc.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/user_management"/>
</jsp:include>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Administration Page</h1>
    <form action="CustomerSearchServlet" method="GET" id="searchForm">
        <div class="input-group mb-3">
            <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" type="text" name="search" placeholder="Search by Name or ID">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Search</button>
            </div>
        </div>
    </form>

    <span class="error">${errors.searchCustomerErr} </span>
    <span class="error">${errors.noCustomerErr}</span>

</div>
<%
    String sortBy = (String)request.getAttribute("sortBy");
%>

<div style="text-align: center;">
    <div>
        Sort By:
        <select name="sortBy" form="searchForm">
            <option value="id" ${sortBy == "id" ? 'selected="selected"' : ''}>ID</option>
            <option value="name" ${sortBy == "name" ? 'selected="selected"' : ''}>Name</option>
            <option value="email" ${sortBy == "email" ? 'selected="selected"' : ''}>Email</option>
        </select>
    </div>
    <br>
    <form action="userAdd_management.jsp" method="POST">
        <button class="btn btn-success" type="submit">Add New User</button>
    </form>
    <br>
</div>

<%--Retrieves all customer from database into arraylist--%>
<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp");
    }

    ArrayList<Customer> customers;
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();       //Create connection to mLab
    if (request.getAttribute("customers") != null) {
        customers = (ArrayList<Customer>) request.getAttribute("customers");
    } else {
        customers = customerDB.getCustomers();
    }


%>
<%--Displaying arraylist in for loop--%>
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
        <% for (Customer customer : customers) {%>
        <tr>
            <td><%= customer.getID()%></td>
            <td><%= customer.getFirstName()%></td>
            <td><%= customer.getLastName()%></td>
            <td><%= customer.getEmail()%></td>
            <td><%= customer.getDOB()%></td>
            <td>
                <div style="width:150px;">
                    <div style="float: left;"> 
                        <form action="userDetail_management.jsp" method="POST">
                            <button type="submit" name="ID" value="<%= customer.getID()%>" class="btn btn-primary">View</button> 
                        </form>
                    </div>
                    <div style="float: right;"> 
                        <form action="userTicket_management.jsp" method="POST">
                            <button type="submit" name="ID" value="<%= customer.getID()%>" class="btn btn-info">Tickets</button>
                        </form>
                    </div>
                </div>
            </td>
        </tr> 
        <% }%>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>
