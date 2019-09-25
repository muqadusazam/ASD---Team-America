<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account/userTicket_management"/>
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
    <h1>User: Carol Lee's Ticket History</h1>

    <div class="input-group mb-3">
        <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button>        
        </div>
    </div>
</div>

<div class="mx-auto" style="width: 950px; text-align: center;">
    <table class="table table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Ticket ID</th>
                <th>Flight No.</th>
                <th>Flight date</th>
                <th>Seat Number</th>   
                <th>Action</th>
            </tr>
        </thead>
        <tr>
            <td>12394</td>
            <td>CA100</td>
            <td>13/09/2019</td>
            <td>A50</td>
            <td><form action="userTicket_management.jsp" method="POST">
                    <button type="submit" name="ID" class="btn btn-primary">Reschedule</button> 
            </form></td>
        </tr>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>