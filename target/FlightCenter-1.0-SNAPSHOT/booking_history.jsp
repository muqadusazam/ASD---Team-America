
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/booking_history"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>
</div>

<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Booking History</h1>

</div>

<div class="mx-auto" style="width: 950px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>purchased date</th>
                <th>Action</th>              
            </tr>
        </thead>
        <tr>
            <td>100001</td>
            <td>John</td>
            <td>Smith</td>
            <td>JohnSmt@gmail.com</td>
            <td>09/12/2007</td>
            <td>
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100002</td>
            <td>Calvin</td>
            <td>White</td>
            <td>Cwhite@gmail.com</td>
            <td>03/07/2002</td>
            <td>
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100003</td>
            <td>Carol</td>
            <td>Mike</td>
            <td>Cmike@gmail.com</td>
            <td>30/03/1796</td>
            <td>
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100004</td>
            <td>Bale</td>
            <td>Don</td>
            <td>Bdon@gmail.com</td>
            <td>25/12/1999</td>
            <td>
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <tr>
            <td>100005</td>
            <td>Tom</td>
            <td>Cat</td>
            <td>Tcat@gmail.com</td>
            <td>23/08/2000</td>
            <td>
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>
