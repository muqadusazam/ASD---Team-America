
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/booking_history"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 active anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>
</div>

<!-- Setting the layout on the screen so the Title of the page stays in the middle -->
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <h1>Booking History</h1>
</div>

<!-- Again specifying the layout settings for the sorting function -->
<div class="mx-auto" style="width: 800px; text-align: center;" >
    <label><b>Sort: </b></label>
    <!-- 3 type of values added for the drop-down menu -->
    <select>
  <option value="DateAdded">Date Added</option>
  <option value="Alphabetically">Alphabetically</option>
  <option value="IDOrdered">ID ordered</option>
    </select>
</div>

<!-- width 950 specified and alignment to center -->
<div class="mx-auto" style="width: 950px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
            <!-- Dummy data entry 1 -->
            <tr>
                <!-- Entry 1 headings given -->
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>purchased date</th>
                <th>Action</th>              
            </tr>
        </thead>
        <tr>
            <!-- Entry 1 values given -->
            <td>100001</td>
            <td>John</td>
            <td>Smith</td>
            <td>JohnSmt@gmail.com</td>
            <td>09/12/2007</td>
            <td>
                <!-- View button to show the detailed info about this booking -->
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <!-- Dummy data entry 2 -->
        <tr>
            <!-- Entry 2 values given -->
            <td>100002</td>
            <td>Calvin</td>
            <td>White</td>
            <td>Cwhite@gmail.com</td>
            <td>03/07/2002</td>
            <td>
                <!-- View button to show the detailed info about this booking -->
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <!-- Dummy data entry 3 -->
        <tr>
            <!-- Entry 3 values given -->
            <td>100003</td>
            <td>Carol</td>
            <td>Mike</td>
            <td>Cmike@gmail.com</td>
            <td>30/03/1796</td>
            <td>
                <!-- View button to show the detailed info about this booking -->
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <!-- Dummy data entry 4 -->
        <tr>
            <!-- Entry 4 values given -->
            <td>100004</td>
            <td>Bale</td>
            <td>Don</td>
            <td>Bdon@gmail.com</td>
            <td>25/12/1999</td>
            <td>
                <!-- View button to show the detailed info about this booking -->
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
        <!-- Dummy data entry 5 -->
        <tr>
            <!-- Entry 5 values given -->
            <td>100005</td>
            <td>Tom</td>
            <td>Cat</td>
            <td>Tcat@gmail.com</td>
            <td>23/08/2000</td>
            <td>
                <!-- View button to show the detailed info about this booking -->
                <form action="view_booking.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">View</button> 
                </form>
            </td>
        </tr>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>
