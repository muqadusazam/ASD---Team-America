<%-- 
    TODO:
        - Follow MVC structure for code
        - Assign logged in user as an Object [Customer] which stores attributes
        - Align tables + side bar correctly
        - Profile: get attributes from database
        - Edit: 1) Submit button sends changed details to validator
                  2) Validator checks inputs
                  3) If successful, change database entry with new details
        - Delete: Delete OWN profile from database
--%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/account"/>
</jsp:include>

<div class="col-12 col-md-3 col-xl-2 bd-sidebar" style = "margin-top: 100px; padding: 5px; float:left; background-color:#cecece">
    <ul class="navbar-nav mr-auto">
    <li class="toc-entry toc-h2 active anthy3"><a href="account.jsp" class ="anthy2">Profile</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="booking_history.jsp" class ="anthy2">Booking History</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>

</div>

<%
               //Customer customer_profile = session.getAttribute("customer_profile");
               //use a customer class/object stored in the session
               //contain all details necessary for app (id, name, wallet, bookings)
               //Customer customer = (Customer)session.getAttribute("customer");
               
//                String id = customer_profile.getId();
//                String name = customer_profile.getName();
//                String email = customer_profile.getEmail();
//                String password = customer_profile.getPassword();
//                String dob = customer_profile.getDob();
            
                session.setAttribute("customer_id", "12345");
                session.setAttribute("customer_first_name", "John");
                session.setAttribute("customer_last_name", "Smith");
                session.setAttribute("customer_email", "johnsmith@email.com");
                session.setAttribute("customer_password", "hunter12");
                session.setAttribute("customer_dob", "10/05/1995");   
   
                String id = (String)session.getAttribute("customer_id");
                String first_name = (String)session.getAttribute("customer_first_name");
                String last_name = (String)session.getAttribute("customer_last_name");
                String email = (String)session.getAttribute("customer_email");
                String password = (String)session.getAttribute("customer_password");
                String dob = (String)session.getAttribute("customer_dob");
                
            %>


        <div align="center" class="container w-50">
            
                <h1><%=first_name%>'s Profile</h1>
                     
                <table class="table" align="center">
                        <tr><td>Customer ID: </td><td> <%=id %> </td></tr>
                        <tr><td>First Name: </td><td> <%=first_name %> </td></tr>
                        <tr><td>Last Name: </td><td> <%=last_name %> </td></tr>
                        <tr><td>Email: </td><td> <%=email%> </td></tr>
                        <tr><td>Password: </td><td> <%=password%> </td></tr>
                        <tr><td>Date of Birth: </td><td> <%=dob%> </td></tr>    
                </table>

                <table align="center" cellpadding="50">
                        <tr>
                                <td><a href="edit_profile.jsp" class="btn btn-primary"> Edit Profile </a></td>
                                <td><a href="main.jsp" class="btn btn-secondary"> Log Out </a></td>                                
                                <td><a href="delete_profile.jsp" class="btn btn-danger">Delete Profile </a></td>
                        </tr>
                </table>
            
        </div>
   
        
        
</div>
        
<jsp:include page = "fc_footer.jsp"/>
