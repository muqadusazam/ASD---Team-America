<%@page import="fc.model.dao.MongoDBConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.dao.*"%>
<%@page import="fc.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="fc.model.*"%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="login"/>
</jsp:include>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <% 
           MongoDBManager_Customers db = new MongoDBManager_Customers(); 
//           Customer testcust = new Customer("2", 
//                "John", 
//                "Smith", 
//                "johnsmith@gmail.com", 
//                "password", 
//                "01/01/2000");
//    
//    db.add(testcust);
           
           String email = request.getParameter("email");
        String password = request.getParameter("password"); 
        
           Customer customer = db.getCustomer(email, password);
           if (customer == null) {
               %>
               NO CUSTOMER COULD BE LOADED
               <%
           } else { %>
           CUSTOMER LOADED
           <%
           }
           %>
        
        
            
           
        
        <div class="container w-15" style = "margin-top:100px"></div>
        <div class="mx-auto" style="width: 800px; text-align: center;"><a href="login.jsp" class="btn btn-secondary"> Back </a></div>
    </body>
</html>
<jsp:include page = "fc_footer.jsp"/>