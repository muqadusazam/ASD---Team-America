<%-- 
    TODO:
        - Follow MVC structure for code
        - Assign logged in customer as an Object [Customer] which stores attributes
        - Align tables + side bar correctly
        - Profile: get attributes from database
        - Edit: 1) Submit button sends changed details to validator
                  2) Validator checks inputs
                  3) If successful, change database entry with new details
        - Delete: Delete OWN profile from database
--%>

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
    <li class="toc-entry toc-h2 anthy3"><a href="reschedule.jsp" class ="anthy2">Reschedule Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="#" class ="anthy2">Cancel Ticket</a></li>
    <li class="toc-entry toc-h2 anthy3"><a href="user_management.jsp" class ="anthy2">User Management (staff only)</a></li>
    </ul>

</div>


<%   
     //Create connection to mLab DB [Customer]
    MongoDBManager_Customers db = new MongoDBManager_Customers();
    
 //       Customer createcus = new Customer(
 //           "1", 
 //           "John", 
 //           "Wheston", 
//            "JohnWhest@gmail.com", 
//            "JW155",
//            "secretpass2", 
//            "23/01/1990");
//    
//    db.add(createcus);
    
    String customer_id = (String)session.getAttribute("customer_ID");
//    String customer_id = "1";

    //Try to get customer profile from mLab using customer ID
    try { Customer customer = db.getCustomer(customer_id);
             session.setAttribute("customer", customer);
%>

        <div align="center" class="container w-50">
            
                <h1><%=customer.getFullName() %>'s Profile</h1>
                     
                <table class="table" align="center">
                        <tr><td>Customer ID: </td><td> <%=customer.getID()%> </td></tr>
                        <tr><td>First Name: </td><td> <%=customer.getFirstName() %> </td></tr>
                        <tr><td>Last Name: </td><td> <%=customer.getLastName()%> </td></tr>
                        <tr><td>Email: </td><td> <%=customer.getEmail()%> </td></tr>
                        <tr><td>Passport Number: </td><td> <%=customer.getPassport()%></td></tr>                       
                        <tr><td>Password: </td><td> <%=customer.getPassword()%> </td></tr>
                        <tr><td>Date of Birth: </td><td> <%=customer.getDOB()%> </td></tr>    
                </table>

                <table align="center" cellpadding="50">
                        <tr>
                                <td><a href="edit_profile.jsp" class="btn btn-primary"> Edit Profile </a></td>
                                <td><a href="logoutAction.jsp" class="btn btn-secondary"> Log Out </a></td>                                
                                <td><a href="account_deleteAction.jsp" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete Profile </a></td>
 
                        </tr>
                </table>
            
        </div>
   
        
        
</div>
        
<jsp:include page = "fc_footer.jsp"/>
<%
        }
    //If customer ID not found, redirect back to main page
    catch (Exception e){
        response.sendRedirect("login.jsp");
    }
    %>
