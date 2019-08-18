
<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Registration"/>
</jsp:include>

    <div class="container w-50"> <!-- width 50 to not take up entire screen-->

    <h1>Customer Registration</h1>

    <form>
        <div class="form-group">
            <label>First Name:</label>
            <input type="text" class="form-control" name="fname" placeholder="Enter your first name" required>
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <input type="text" class="form-control" name="lname" placeholder="Enter your last name" required>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" name="email" placeholder="Enter your email address" required>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" name="password" placeholder="Enter a password" required>
        </div>
        
        <div class="form-group">
            <label>Passport Number:</label>
            <input type="text" class="form-control" name="passport" placeholder="Initials (capital) followed by 3 integers" required>
        </div>

        <div class="form-group">
            <label>DOB:</label>
            <input type="date" class="form-control" name="DOB" required>
        </div>

        <button type="submit" class="btn btn-success">Register</button>
        <button type="button" class="btn btn-danger" onclick="location.href = 'main.jsp'">Cancel</button>
    </form>

    </div>

<jsp:include page = "fc_footer.jsp"/>