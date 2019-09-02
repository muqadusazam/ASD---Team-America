
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

<%
    String id = request.getParameter("ID");
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    Customer customer = customerDB.getCustomer(id);

%>
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>User: <%= customer.getFirstName()%> <%=customer.getLastName()%></h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <form action="user_management.jsp" class="margin1">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputFName">First Name</label>
                <input type="text" class="form-control" id="firstName" value="<%=customer.getFirstName()%>">
            </div>
            <div class="form-group col-md-6">
                <label for="inputLName">Last Name</label>
                <input type="text" class="form-control" id="lastName" value="<%=customer.getLastName()%>">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail">Email</label>
            <input type="text" class="form-control" id="email" value="<%=customer.getEmail()%>">
        </div>
        <div class="form-group">
            <label for="inputPasspoprt">Passport</label>
            <input type="text" class="form-control" id="passport" value="<%=customer.getPassport()%>">
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputCity">DOB</label>
                <input type="date" class="form-control" id="DOB" value="<%=customer.getDOB()%>">
            </div>

        </div>
        <button type="submit" class="btn btn-primary">Edit</button>
        
    </form>
    <form action="userDelete_management.jsp" method="POST">
        <button type="submit" name="ID" value="<%= customer.getID()%>" class="btn btn-danger">Delete</button> 
    </form> 
</div>



<jsp:include page = "fc_footer.jsp"/>
