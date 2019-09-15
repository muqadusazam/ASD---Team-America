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
    String customer_id = (String)session.getAttribute("customer_ID");

    //Try to get customer profile from mLab using customer ID
    try { Customer customer = db.getCustomer(customer_id);
             session.setAttribute("customer", customer);
%>

        <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px" >          
            
                <h1>Change your details:</h1>

                <form action="ProfileEditServlet" method="POST">
  
                    <div class="form-group">
                        <label>First Name:</label>
                        <input type="text" class="form-control" name="fname" id="Fname" value="${param.firstName}"
                               accesskey=""  accept=""placeholder=" <%=customer.getFirstName() %>" required>
                        <span class="error text-danger"><em>${errors.fNameErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="text" class="form-control" name="lname" id="Lname" value="${param.lastName}"
                               placeholder="<%=customer.getLastName()%> " required>
                        <span class="error text-danger"><em>${errors.lNameErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" class="form-control" name="email" id="Email" value="${param.email}"
                               placeholder="<%=customer.getEmail()%>" required>
                        <span class="error text-danger"><em>${errors.emailErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>Passport Number:</label>
                        <input type="text" class="form-control" name="passport" id="Passport" value="${param.passport}" 
                               placeholder="<%= customer.getPassport()%>" required>
                        <span class="error text-danger"><em>${errors.passportErr}</em></span>
                     </div>      

                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" class="form-control" name="password" id="password" value="${param.password}"
                               placeholder="<%= customer.getPassword()%>" required>
                        <span class="error text-danger"><em>${errors.passwordErr}</em></span>
                    </div>

                    <div class="form-group">
                        <label>DOB:</label>
                        <input type="date" class="form-control" name="DOB" id="Dob" placeholder="<%=customer.getDOB()%>" required>
                    </div>

                        
                    <table cellpadding="10" align="center">
                        <tr>
                            <td><button type="submit" class="btn btn-success" id ="Submit"> Submit </button></td>
                            <td><button type="button" class="btn btn-secondary" id="Cancel" onclick="location.href = 'account.jsp'">Cancel</button></td>
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

