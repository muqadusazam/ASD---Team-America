<%-- 
        TODO:
            - Send form to action page that grabs data from text box
            - Validate entries
            - Save changes to database
--%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/register"/>
</jsp:include>

        <%
                //Customer customer_profile = session.getAttribute("customer_profile");
                
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
            
                <h1>Change your details:</h1>

                <form action="account.jsp" method="POST">
                        <table cellpadding="10" align="center">
                            <tr><td>ID: </td><td><input type="text" name="id" value="<%=id %>" </td></tr>
                            <tr><td>First Name: </td><td><input type="text" name="first_name" value="<%=first_name %>" </td></tr>
                            <tr><td>Last Name: </td><td><input type="text" name="last_name" value="<%=last_name %>" </td></tr>
                            <tr><td>Email: </td><td><input type="text" name="email" value="<%=email %>" </td></tr>
                            <tr><td>Password: </td><td><input type="text" name="password" value="<%=password %>" </td></tr>
                            <tr><td>Date of Birth: </td><td><input type="text" name="dob" value="<%=dob %>" </td></tr>
                        </table>
                        
                        <table cellpadding="10" align="center">
                                <tr>
                                        <td><button type="SUBMIT" class="btn btn-success"> Submit </button></td>
                                        <td><a href="account.jsp" class="btn btn-secondary"> Cancel </a></td>
                                </tr>
                        </table>                                               

                </form>
                            
        </div>
        
        
        
<jsp:include page = "fc_footer.jsp"/>
