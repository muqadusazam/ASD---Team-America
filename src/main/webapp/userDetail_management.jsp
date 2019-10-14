
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userDetail_management"/>
</jsp:include>


<%
    String id = request.getParameter("ID");
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    Customer customer = customerDB.getCustomer(id);

%>
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>User: <%= customer.getFirstName()%> <%=customer.getLastName()%></h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <form action="CustomerEditAdminServlet" class="margin1" method="post">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputID">ID</label>
                <input type="text" class="form-control" name="ID" id="ID" value="<%=customer.getID()%>">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputFName">First Name</label>
                <input type="text" class="form-control" name="fname" id="firstName" value="<%=customer.getFirstName()%>">
                <span class="error">${errors.fNameErr}</span>
            </div>
            <div class="form-group col-md-6">
                <label for="inputLName">Last Name</label>
                <input type="text" class="form-control" name="lname" id="lastName" value="<%=customer.getLastName()%>">
                <span class="error">${errors.lNameErr}</span>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputEmail">Email</label>
                <input type="text" class="form-control" name="email" id="email" value="<%=customer.getEmail()%>">
                <span class="error">${errors.emailErr}</span>
            </div>
            <div class="form-group col-md-6">
                <label>Password</label>
                <input type="text" class="form-control" name="password" id="password" value="<%=customer.getPassword()%>">
                <span class="error">${errors.passwordErr}</span>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputPasspoprt">Passport</label>
                <input type="text" class="form-control" name="passport" id="passport" value="<%=customer.getPassport()%>">
                <span class="error">${errors.passportErr}</span>
            </div>
            <div class="form-group col-md-6">
                <label for="inputDob">DOB</label>
                <input type="date" class="form-control" name="DOB" id="DOB" value="<%=customer.getDOB()%>">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Edit</button>
    </form>
    <form action="userDelete_management.jsp" method="POST">
        <button type="submit" name="ID" value="<%= customer.getID()%>" class="btn btn-danger">Delete</button> 
    </form> 
</div>

<jsp:include page = "fc_footer.jsp"/>
