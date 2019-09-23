
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<%@page import="fc.model.Customer"%>
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
                <th>Ticket ID</th>
                <th>Customer ID</th>
                <th>Flight ID</th>
                <th>Full Name</th>
                <th>Origin</th>
                <th>purchased date</th>           
            </tr>
        </thead>
        <%
             MongoDBManager_Customers db = new MongoDBManager_Customers();
             MongoDBManager_Tickets Tdb = new MongoDBManager_Tickets();
             MongoDBManager_Flights Fdb = new MongoDBManager_Flights();
            String customer_id = (String)session.getAttribute("customer_ID");       //Get logged in customer's ID, passed from login feature

    try { Customer customer = db.getCustomer(customer_id);        //Try to get customer profile from mLab using customer ID
             session.setAttribute("cutomer", customer);
             
             String fullName = customer.getFirstName() + " " + customer.getLastName();
              
             ArrayList<Ticket> ArrayTicket = Tdb.getTickets(customer);   
             for (Ticket currentTicket : ArrayTicket){
                 Flight flights = Fdb.getFlight(currentTicket.getFlightID());
             String origin = flights.getOrigin();

        %>
        <tr>
            <td><%= currentTicket.getID() %> </td>
            <td><%= currentTicket.getCustomerID() %> </td>
            <td><%= currentTicket.getFlightID() %> </td>
            <td><%= fullName %> </td>
            <td><%= origin %> </td>
        </tr>
        <%
          }                      
        %>
    </table>
</div>



<jsp:include page = "fc_footer.jsp"/>
<%
        }
    //If customer ID not found, redirect back to main page
    catch (Exception e){
        response.sendRedirect("login.jsp");
    }
    %>