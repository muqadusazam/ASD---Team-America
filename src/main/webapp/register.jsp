<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Registration"/>
</jsp:include>

<<<<<<< HEAD
<div class="container w-50"> <!-- width 50 to not take up entire screen-->

    <h1>Customer Registration</h1>

    <form action="RegisterServlet" method="post">
        <div class="form-group">
            <label>First Name:</label>
            <input type="text" class="form-control" name="fname" value="${param.firstName}"
                   placeholder="Enter your first name" required>
            <span class="error">${errors.fNameErr}</span>
=======
<!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
<div class="container w-50" style="margin-top: 50px; margin-bottom: 50px" >

    <center><h1>Customer Registration</h1></center>
    <br>
    <form action="RegisterServlet" method="post"> <!-- linking this form to RegisterServlet-->
        <div class="form-group">
            <label>First Name:</label>
            <input type="text" class="form-control" name="fName" id="first_name" value="${param.firstName}"
                   placeholder="Enter your first name" required> <!-- Retains submitted value by doing request.getParameter-->
            <span class="error text-danger"><em>${errors.fNameErr}</em></span> <!-- Shows error message if required-->
>>>>>>> Muqadus
        </div>

        <div class="form-group">
            <label>Last Name:</label>
<<<<<<< HEAD
            <input type="text" class="form-control" name="lname" value="${param.lastName}"
                   placeholder="Enter your last name" required>
            <span class="error">${errors.lNameErr}</span>
=======
            <input type="text" class="form-control" name="lName" id="last_name" value="${param.lastName}"
                   placeholder="Enter your last name" required>
            <span class="error text-danger"><em>${errors.lNameErr}</em></span>
>>>>>>> Muqadus
        </div>

        <div class="form-group">
            <label>Email:</label>
<<<<<<< HEAD
            <input type="email" class="form-control" name="email" value="${param.email}"
                   placeholder="Enter your email address" required>
            <span class="error">${errors.emailErr}</span>
=======
            <input type="email" class="form-control" name="email" id="email" value="${param.email}"
                   placeholder="Enter your email address" required>
            <span class="error text-danger"><em>${errors.emailErr}</em></span>
>>>>>>> Muqadus
        </div>

        <div class="form-group">
            <label>Password:</label>
<<<<<<< HEAD
            <input type="password" class="form-control" name="password" value="${param.password}"
                   placeholder="Enter a password" required>
            <span class="error">${errors.passwordErr}</span>
=======
            <input type="password" class="form-control" name="password" id="password" value="${param.password}"
                   placeholder="Enter a password" required>
            <span class="error text-danger"><em>${errors.passwordErr}</em></span>
>>>>>>> Muqadus
        </div>

        <div class="form-group">
            <label>Passport Number:</label>
<<<<<<< HEAD
            <input type="text" class="form-control" name="passport" value="${param.passport}"
                   placeholder="Initials (capital) followed by 3 integers" required>
            <span class="error">${errors.passportErr}</span>
=======
            <input type="text" class="form-control" name="passport" id="passport" value="${param.passport}"
                   placeholder="Capitalised initials followed by 3 numbers" required>
            <span class="error text-danger"><em>${errors.passportErr}</em></span>
>>>>>>> Muqadus
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
