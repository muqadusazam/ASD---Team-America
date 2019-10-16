<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Registration"/> 
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
<div class="container w-50" style="margin-top: 50px; margin-bottom: 50px" >

    <center><h1>Customer Registration</h1></center>
    <br>
    <form action="RegisterServlet" method="post"> <!-- linking this form to RegisterServlet-->
        
        <!-- Retains submitted value by doing request.getParameter in servlet, show error message if required-->
        <div class="form-group">
            <label>First Name:</label>
            <input type="text" class="form-control" name="fName" id="first_name" value="${param.firstName}"
                   placeholder="Enter your first name" required>
            <span class="error text-danger"><em>${errors.fNameErr}</em></span>
        </div>

        <!-- Retains submitted value by doing request.getParameter in servlet, show error message if required-->
        <div class="form-group">
            <label>Last Name:</label>
            <input type="text" class="form-control" name="lName" id="last_name" value="${param.lastName}"
                   placeholder="Enter your last name" required>
            <span class="error text-danger"><em>${errors.lNameErr}</em></span>
        </div>

        <!-- Retains submitted value by doing request.getParameter in servlet, show error message if required-->
        <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" name="email" id="email" value="${param.email}"
                   placeholder="Enter your email address" required>
            <span class="error text-danger"><em>${errors.emailErr}</em></span>
        </div>

        <!-- Retains submitted value by doing request.getParameter in servlet, show error message if required-->
        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" name="password" id="password" value="${param.password}"
                   placeholder="Enter a password" required>
            <span class="error text-danger"><em>${errors.passwordErr}</em></span>
        </div>

        <!-- Retains submitted value by doing request.getParameter in servlet, show error message if required-->
        <div class="form-group">
            <label>Passport Number:</label>
            <input type="text" class="form-control" name="passport" id="passport" value="${param.passport}"
                   placeholder="Capitalised initials followed by 3 numbers" required>
            <span class="error text-danger"><em>${errors.passportErr}</em></span>
        </div>

        <!-- Retains submitted value by doing request.getParameter in servlet, show error message if required-->
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

<jsp:include page = "fc_footer.jsp"/> <!-- Footer file for all pages-->
