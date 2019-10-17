<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userDelete_management"/>
</jsp:include>
<%--Retrieves customer from session"--%>
<%
    //checks if user is logged and if use is admin
    Customer logInCustomer = (Customer)session.getAttribute("customer");
    if (logInCustomer == null) {
        response.sendRedirect("login.jsp");
    } else if ((Integer.parseInt(logInCustomer.getID())/100000) != 9){
        response.sendRedirect("noAccess_management.jsp");
    }
    
    String id = request.getParameter("ID");
    MongoDBManager_Customers customerDB = new MongoDBManager_Customers();
    Customer customer = customerDB.getCustomer(id);
    customerDB.remove(customer);
%>
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>User: <%= customer.getFirstName()%> <%=customer.getLastName()%></h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <%response.sendRedirect("user_management.jsp");%>
</div>

<jsp:include page = "fc_footer.jsp"/>
