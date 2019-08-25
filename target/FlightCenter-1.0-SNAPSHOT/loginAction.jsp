
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
            //testing
        %>
        <h1>Welcome! <%=email%>, your password is <%=password%></h1>
        <a href="main.jsp" class="btn btn-secondary"> Home </a>
    </body>
</html>
