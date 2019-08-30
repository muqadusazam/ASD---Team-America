
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="login"/>
</jsp:include>

<form action = "LoginServlet" method = "post">
        <div style = "margin-top: 100px"> <h1><b><center>Login</center></b></h1></div>
        <div class="container w-25" style = "margin-top:100px">
            <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" name="email" value="${param.email}"
                   placeholder="Enter your email address" required>
            <span class="error text-danger"><em>${errors.emailErr}</em></span>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" name="password" value="${param.password}"
                   placeholder="Enter a password" required>
            <span class="error text-danger"><em>${errors.passwordErr}</em></span>
        </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
</form>
<jsp:include page = "fc_footer.jsp"/>
