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
            
            String[] admin = new String[2];
            admin[0] = "aemail";
            admin[1] = "apassword";
            
            String[] customer = new String[2];
            customer[0] = "cemail";
            customer[1] = "cpassword";
            
        String email = request.getParameter("email");
        String password = request.getParameter("password"); 
        
        if (email.equals("") || password.equals("")){ %>
        <div class="mx-auto" style="width: 800px; text-align: center;" ><h1>Please provide the details</h1></div>
       <% }
        
        else if (email.equals(admin[0]) && password.equals(admin[1])) { %>
        <div class="mx-auto" style="width: 800px; text-align: center;" ><h1>Admin</h1></div>
        
        <div class="container w-25" style = "margin-top:100px"></div>
        <div class="mx-auto" style="width: 800px; text-align: center;"><h3>Email: <%= email%></h3></div>
        <div class="mx-auto" style="width: 800px; text-align: center;"><h3>Password: <%= password %></h3></div>
        
        <% } else if (email.equals(customer[0]) && password.equals(customer[1])) { %>
        <div class="mx-auto" style="width: 800px; text-align: center;" ><h1>Customer</h1></div>
        
        <div class="container w-25" style = "margin-top:100px"></div>
        <div class="mx-auto" style="width: 800px; text-align: center;"><h3>Email: <%= email%></h3></div>
        <div class="mx-auto" style="width: 800px; text-align: center;"><h3>Password: <%= password %></h3></div>
        <%  } else { %>
         <h1>Sorry! <%= email%> does not exist</h1>
        <% }
        
        
        %>
        
        <div class="container w-15" style = "margin-top:100px"></div>
        <div class="mx-auto" style="width: 800px; text-align: center;"><a href="login.jsp" class="btn btn-secondary"> Back </a></div>
    </body>
</html>
<jsp:include page = "fc_footer.jsp"/>