
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
    <h1>Administration Page</h1>

    <div class="input-group mb-3">
        <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button>
            <form action="userAdd_management.jsp" method="POST">
                <button class="btn btn-success" type="submit">Add New User</button>
            </form>
        </div>
    </div>
</div>

<div class="mx-auto" style="width: 950px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>DOB</th>
                <th>Action</th>              
            </tr>
        </thead>
        <tr>
            <td>100001</td>
            <td>Carol</td>
            <td>Lee</td>
            <td>Cl1993@gmail.com</td>
            <td>19/02/1993</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100002</td>
            <td>James</td>
            <td>Black</td>
            <td>jamesftw@gmail.com</td>
            <td>01/06/1978</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100003</td>
            <td>Boron</td>
            <td>Chernobyl</td>
            <td>radiation@gmail.com</td>
            <td>26/04/1986</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100004</td>
            <td>Cowell</td>
            <td>Simon</td>
            <td>AGT@gmail.com</td>
            <td>15/11/1968</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100005</td>
            <td>Carol</td>
            <td>Lee</td>
            <td>Cl1993@gmail.com</td>
            <td>19/02/1993</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100006</td>
            <td>Kingdom</td>
            <td>Zom</td>
            <td>king@gmail.com</td>
            <td>26/04/1976</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100007</td>
            <td>Test</td>
            <td>Example</td>
            <td>thisismyemail@gmail.com</td>
            <td>16/08/2019</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100008</td>
            <td>Car</td>
            <td>Drive</td>
            <td>drivecar@gmail.com</td>
            <td>12/01/1993</td>
            <td>
                <form action="userDetail_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>
