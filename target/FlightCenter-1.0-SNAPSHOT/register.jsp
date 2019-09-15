<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Registration"/>
</jsp:include>

<div class="container w-50"> <!-- width 50 to not take up entire screen-->

    <h1>Customer Registration</h1>

    <form action="RegisterServlet" method="post">
        <div class="form-group">
            <label>First Name:</label>
            <input type="text" class="form-control" name="fname" value="${param.firstName}"
                   placeholder="Enter your first name" required>
            <span class="error">${errors.fNameErr}</span>
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <input type="text" class="form-control" name="lName" id="last_name" value="${param.lastName}"
                   placeholder="Enter your last name" required>
            <span class="error text-danger"><em>${errors.lNameErr}</em></span>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" name="email" id="email" value="${param.email}"
                   placeholder="Enter your email address" required>
            <span class="error text-danger"><em>${errors.emailErr}</em></span>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" name="password" id="password" value="${param.password}"
                   placeholder="Enter a password" required>
            <span class="error text-danger"><em>${errors.passwordErr}</em></span>
        </div>

        <div class="form-group">
            <label>Passport Number:</label>
            <input type="text" class="form-control" name="passport" id="passport" value="${param.passport}"
                   placeholder="Capitalised initials followed by 3 numbers" required>
            <span class="error text-danger"><em>${errors.passportErr}</em></span>
        </div>

        <div class="form-group">
            <label>DOB:</label>
            <input type="date" class="form-control" name="DOB" id="dob" value="${param.DOB}" required>
            <span class="error text-danger"><em>${errors.DOBErr}</em></span>
        </div>
        <br>
        <button type="submit" class="btn btn-success" id="registerBtn">Register</button> <!-- performs form input validation upon clicking-->
        <button type="button" class="btn btn-warning" onclick="location.href = 'main.jsp'">Cancel</button>
    </form>

</div>

<jsp:include page = "fc_footer.jsp"/>
