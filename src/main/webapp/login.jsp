
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="login"/>
</jsp:include>

<!-- The action is being sent to login servlet where the processing is done -->
<form action = "LoginServlet" method = "post">
        <div style = "margin-top: 100px"> <h1><b><center>Login</center></b></h1></div>
        <div class="container w-25" style = "margin-top:100px">
            <div class="form-group">
                <!-- creating an email label -->
            <label>Email:</label>
            <!-- creating an email input by giving it an id to be accessed for testing -->
            <input type="email" class="form-control" name="email" id="Email" value="${param.email}"
                   placeholder="Enter your email address" required> <!-- specifying the placeholder text for email -->
            <span class="error text-danger"><em>${errors.emailErr}</em></span>
        </div>

        <div class="form-group">
            <!-- creating a password label -->
            <label>Password:</label>
            <!-- creating a password input by giving it an id to be accessed for testing -->
            <input type="password" class="form-control" name="password" id="Password" value="${param.password}"
                   placeholder="Enter a password" required> <!-- specifying the placeholder text for password -->
            <span class="error text-danger"><em>${errors.passwordErr}</em></span>
           <div>
                <span class="error text-danger"><em>${errors.noCustomer}</em></span>
            </div>
        </div class="form-group">
        <!-- creating a submit Login button by providing an id to be used for testing purpose -->
            <button type="submit" id="BtnLogin" class="btn btn-primary">Login</button>
        </div>
</form>
<jsp:include page = "fc_footer.jsp"/>
