<%-- 
    Document   : loginAction
    Created on : 16/08/2019, 3:51:30 PM
    Author     : Muqadus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = (String)session.getAttribute("email");
            String password = (String)session.getAttribute("password");
            
//            if (email == null){
//                out.println("Please provide the email");
//            } else if (password == null){
//                out.println("Please provide the password");
//            }
        %>
        <h1>Welcome! <%=email%>, your password is <%=password%></h1>
    </body>
</html>
