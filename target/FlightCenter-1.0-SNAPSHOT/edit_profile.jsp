<%-- 
        TODO:
            - Send form to action page that grabs data from text box
            - Validate entries
            - Save changes to database
--%>

<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.*"%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/register"/>
</jsp:include>

<%    
     //Create connection to mLab DB [Customer]
    MongoDBManager_Customers db = new MongoDBManager_Customers();
    String customer_id = (String)session.getAttribute("customer_ID");       //get 'customer_id' from session

    //Try to get customer profile from mLab using customer ID
    try { Customer customer = db.getCustomer(customer_id);
             session.setAttribute("customer", customer);
%>

        <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px" >          
            
                <h1>Change your details:</h1>

                <form action="ProfileEditServlet" method="POST">
  
                    <div class="form-group">
                        <label>First Name:</label>
                        <input type="text" class="form-control" name="fname" id="Fname" value="${param.firstName}"      <!-- text box for 'fname'-->
                               accesskey=""  accept=""placeholder=" <%=customer.getFirstName() %>" required>        <!-- placeholder text displays current 'fname' -->
                        <span class="error text-danger"><em>${errors.fNameErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="text" class="form-control" name="lname" id="Lname" value="${param.lastName}"       <!-- text box for 'lname'-->
                               placeholder="<%=customer.getLastName()%> " required>     <!-- placeholder text displays current 'lname' -->
                        <span class="error text-danger"><em>${errors.lNameErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" class="form-control" name="email" id="Email" value="${param.email}"     <!-- text box for 'email'-->
                               placeholder="<%=customer.getEmail()%>" required>     <!-- placeholder text displays current 'email' -->
                        <span class="error text-danger"><em>${errors.emailErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" class="form-control" name="password" id="password" value="${param.password}"     <!-- text box for 'password'-->
                               placeholder="<%= customer.getPassword()%>" required>     <!-- placeholder text displays current 'password' -->
                        <span class="error text-danger"><em>${errors.passwordErr}</em></span>
                    </div>
                    
                     <div class="form-group">
                        <label>Passport Number:</label>
                        <input type="text" class="form-control" name="passport" id="Passport" value="${param.passport}"         <!-- text box for 'passport'-->
                               placeholder="<%= customer.getPassport()%>" required>     <!-- placeholder text displays current 'passport' -->
                        <span class="error text-danger"><em>${errors.passportErr}</em></span>
                     </div>

                    <div class="form-group">
                        <label>DOB:</label>
                        <input type="date" class="form-control" name="DOB" id="Dob" placeholder="<%=customer.getDOB()%>" required>      <!-- text box for 'DOB'-->
                    </div>
                    
                       

                        
                    <table cellpadding="10" align="center">
                        <tr>
                            <td><button type="submit" class="btn btn-success" id ="Submit"> Submit </button></td>       <!-- Submit button sends data to ProfileEditServlet -->
                            <td><button type="button" class="btn btn-secondary" id="Cancel" onclick="location.href = 'account.jsp'">Cancel</button></td>        <!-- Cancel redirects back to account page-->
                        </tr>
                    </table>                                               

                </form>                          
        </div>
        
        
        
<jsp:include page = "fc_footer.jsp"/>
<%
        }
    //If customer ID not found, redirect back to main page
    catch (Exception e){
        response.sendRedirect("login.jsp");
    }
    %>

