<%@page import="java.util.ArrayList"%>
<%@ page import="fc.model.Customer"%>
<%@ page import="fc.model.dao.*" %>


<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/account"/>
</jsp:include>

<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
        <li class="toc-entry toc-h2 active anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="cancelTicket.jsp" class ="anthy2">Cancel Ticket</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
        <li class="toc-entry toc-h2 anthy3"><a href="flight_management.jsp" class ="anthy2">Flight Management (staff only)</a></li>
    </ul>
</div>

<%
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp");
    } else {
        Customer customer = (Customer) session.getAttribute("customer");
%>

<div align="center" class="container w-50">

    <h1><%=customer.getFullName()%>'s Profile</h1>     <!-- Displays the name of the currently logged in customer -->

    <table class="table" align="center">
        <tr><td>Customer ID: </td><td> <%=customer.getID()%> </td></tr>     <!-- Display customer's ID -->
        <tr><td>First Name: </td><td> <%=customer.getFirstName()%> </td></tr>      <!-- Display customer's first name -->
        <tr><td>Last Name: </td><td> <%=customer.getLastName()%> </td></tr>     <!-- Display customer's last name -->
        <tr><td>Email: </td><td> <%=customer.getEmail()%> </td></tr>        <!-- Display customer's email -->
        <tr><td>Password: </td><td> <%=customer.getPassword()%> </td></tr>      <!-- Display customer's password -->
        <tr><td>Passport Number: </td><td> <%=customer.getPassport()%></td></tr>        <!-- Display customer's passport number -->                
        <tr><td>Date of Birth: </td><td> <%=customer.getDOB()%> </td></tr>      <!-- Display customer's date of birth --> 
    </table>

    <table align="center" cellpadding="50">
        <tr>
            <td><a href="edit_profile.jsp" class="btn btn-primary"> Edit Profile </a></td>      <!-- Button that redirects to 'edit_profile' page -->
            <td><a href="logoutAction.jsp" class="btn btn-secondary"> Log Out </a></td>     <!-- Button that logs out the current customer -->                    
            <td><a href="account_deleteAction.jsp" class="btn btn-danger" 
                   onclick="return confirm('Are you sure?')">Delete Profile </a></td>       <!-- Button that deletes the current customer, displays confirmation message beforehand -->

        </tr>
    </table>

</div>



</div>

<jsp:include page = "fc_footer.jsp"/>
<%
    }
%>
