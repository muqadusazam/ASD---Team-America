
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account/reschedule"/>
</jsp:include>
<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
    <li class="toc-entry toc-h2 anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Booking History</a></li>
    <li class="toc-entry toc-h2 active anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>

</div>

<div class="mx-auto" style="float: left">
    <form>
    <h1><p>Reschedule ticket</p></h1>
    
    <table class="table table-hover">
        <tbody>
        <tr>
            <td><b>Ticket ID:</b></td>
            <td>12345898</td>
        </tr>
        <tr>
            <td><b>Customer ID:</b></td>
            <td>123456</td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>First name:</b></td>
            <td>John</td>
        </tr>
        <tr>
            <td><b>Last name:</b></td>
            <td>Smith</td>
        </tr>
        <tr>
            <td><b>DOB:</b></td>
            <td>01/01/1990</td>
        </tr>
        <tr>
            <td><b>Price:</b></td>
            <td>$2,500</td>
        </tr>
        <tr>
            <td><b>Airline:</b></td>
            <td>Qantas </td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>Flight ID:</b></td>
            <td>123ABC</td>
        </tr>
        <tr>
            <td><b>Departure:</b></td>
            <td>Sydney International Airport</td>
        </tr>
        <tr>
            <td><b>Departure date:</b></td>
            <td>15-08-2019</td>
            <td><input type="date" class="form-control" name="dep_date"></td>
        </tr>
        <tr>
            <td><b>Departure time (AEST):</b></td>
            <td>10:00PM</td>
            <td><input type="time" class="form-control" name="dep_time"></td>
        </tr>
        <tr>
            <td><b>Terminal:</b></td>
            <td>T1</td>
        </tr>
        <tr>
            <td><b>Gate:</b></td>
            <td>1</td>
        </tr>
        <tr>
            <td><b>Seat number:</b></td>
            <td>23A</td>
        </tr>
        
        <tr><td><br></td></tr>
        
        <tr>
            <td><b>Destination:</b></td>
            <td>Seoul-Incheon International Airport</td>
        </tr>
        <tr>
            <td><b>Destination arrival date:</b></td>
            <td>16-08-2019</td>
            <td><input type="date" class="form-control" name="arr_date"></td>
        </tr>
        <tr>
            <td><b>Destination arrival time (AEST):&nbsp&nbsp</b></td>
            <td>09:00AM</td>
            <td><input type="time" class="form-control" name="arr_time"></td>
        </tr>
        <tr>
            <td><b>Terminal:</b></td>
            <td>T2</td>
        </tr>
        <tr>
            <td><b>Gate:</b></td>
            <td>5</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <button type="submit" class="btn btn-success" style="float: right">Submit</button>
                <button type="reset" class="btn btn-danger" style="float: right">Cancel</button>
            </td>
        </tr>
        </tbody>
    </table>
    </form>
</div>    

<jsp:include page = "fc_footer.jsp"/>
