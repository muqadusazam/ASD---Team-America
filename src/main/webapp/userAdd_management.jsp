<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userAdd_management"/>
</jsp:include>

<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="flight_management.jsp" class ="anthy2">Flight Management (staff only)</a></li>
    </ul>
</div>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Create new user</h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <form action="CustomerAdminServlet" method="post" class="margin1">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>First Name</label>
                <input type="text" class="form-control" id="inputFirstName" name="fname" value="${param.firstName}"
                       placeholder="Enter your first name" required>
                <span class="error">${errors.fNameErr}</span>
            </div>
            <div class="form-group col-md-6">
                <label>Last Name</label>
                <input type="text" class="form-control" id="inputLastName" name="lname" value="${param.lastName}"
                       placeholder="Enter your last name" required>
                <span class="error">${errors.lNameErr}</span>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Email</label>
                <input type="email" class="form-control" name="email" id="inputEmail" value="${param.email}"
                       placeholder="Enter your email address" required>
                <span class="error">${errors.emailErr}</span>
            </div>
            <div class="form-group col-md-6">
                <label>Password</label>
                <input type="password" class="form-control" name="password" id="inputPassword"value="${param.password}"
                       placeholder="Enter a password" required>
                <span class="error">${errors.passwordErr}</span>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Passport Number</label>
                <input type="text" class="form-control" name="passport" id="inputPassport"value="${param.passport}"
                       placeholder="Initials (capital) followed by 3 integers" required>
                <span class="error">${errors.passportErr}</span>
            </div>
            <div class="form-group col-md-6">
                <label>Date of Birth</label>
                <input type="date" class="form-control" name="DOB" id="inputDOB" required>
            </div>

        </div>
        <button type="submit" class="btn btn-success" id="registerButton">Create</button>
        <button type="button" class="btn btn-secondary" onclick="location.href = 'user_management.jsp'">Cancel</button>

    </form>
</div>
<jsp:include page = "fc_footer.jsp"/>