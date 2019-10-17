<%--
    Document   : userEditTicketSuccess_management
    Created on : Aug 25, 2019, 5:33:02 PM
    Author     : william
--%>
<%@page import="fc.model.Ticket"%>
<%@page import="fc.model.dao.MongoDBManager_Tickets"%>
<%@page import="fc.model.Customer"%>
<%@page import="fc.model.dao.MongoDBManager_Customers"%>

<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Center/accountuserEditTicketSuccess_management"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->
<%
    //checks if user is logged and if use is admin
    Customer logInCustomer = (Customer)session.getAttribute("customer");
    if (logInCustomer == null) {
        response.sendRedirect("login.jsp");
    } else if ((Integer.parseInt(logInCustomer.getID())/100000) != 9){
        response.sendRedirect("noAccess_management.jsp");
    }
%>
<body>
    <!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
    <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
        <center>
            <h1>Reschedule Successful!</h1>
            <br>
            <p>You have successfully rescheduled the flight.</p>
            <br>
            <!-- Redirect to login page or userTicket_management.jsp upon clicking buttons-->
            <form action="userTicket_management.jsp" method="POST">
                <%String customerID = (String) session.getAttribute("customerID");%>               
                <button type="submit" name="ID" value="<%=customerID%>" class="btn btn-primary">Customer List</button> 
            </form>
        </center>
    </div>
</body>

<jsp:include page = "fc_footer.jsp"/> <!-- Footer file for all pages-->