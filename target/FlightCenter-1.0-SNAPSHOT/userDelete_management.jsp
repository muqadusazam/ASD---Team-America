<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userDetail_management"/>
</jsp:include>

<jsp:include page="fc_mininav.jsp"></jsp:include>

<%
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
