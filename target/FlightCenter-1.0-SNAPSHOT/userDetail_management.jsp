
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/user_management"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>
</div>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>User: Carol Lee</h1>
</div>

<div class="mx-auto" style="width: 950px;">
    <form action="user_management.jsp" class="margin1">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputEmail4">Email</label>
                <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
            </div>
            <div class="form-group col-md-6">
                <label for="inputPassword4">Password</label>
                <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <label for="inputAddress">Address</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
        </div>
        <div class="form-group">
            <label for="inputAddress2">Address 2</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputCity">City</label>
                <input type="text" class="form-control" id="inputCity">
            </div>
            <div class="form-group col-md-4">
                <label for="inputState">State</label>
                <select id="inputState" class="form-control">
                    <option selected>Choose...</option>
                    <option>NSW</option>
                    <option>QLD</option>
                    <option>NT</option>
                    <option>WA</option>
                    <option>SA</option>
                    <option>TAS</option>
                    <option>VIC</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <label for="inputZip">Post Code</label>
                <input type="text" class="form-control" id="inputZip">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Edit</button>
        <button type="submit" class="btn btn-danger">Delete</button>
    </form>
</div>



<jsp:include page = "fc_footer.jsp"/>