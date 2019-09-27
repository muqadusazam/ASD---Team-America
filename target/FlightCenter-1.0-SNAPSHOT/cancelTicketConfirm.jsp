<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Registration Successful"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="fc.model.*"%>
<%@page import="fc.model.dao.*"%>

<%
    String ticketID = request.getParameter("ticketIDBtn");
    MongoDBManager_Tickets db = new MongoDBManager_Tickets();
    Ticket ticket = db.getTicket(ticketID);
    db.remove(ticket);  
%>

<body>
    <!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
    <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
        <center>
        <h1>Ticket Cancelled!</h1>
        <br>
        <p>You have cancelled the following ticket:</p>
        <br>
        <p>TICKET ID TEMP: <%= ticketID%></p>
        <p> YOU WILL BE REDIRECTED IN XXX SECONDS </p>
        </center>
    </div>
</body>
    
    
<% //SCRIPT CODE TO MAKE TICKET ENTRIES
//    for (int i = 0; i < 5; i++){
//        Ticket test = new Ticket("001", "179577", "3", "TEST1" );
//        MongoDBManager_Tickets db = new MongoDBManager_Tickets();
//        db.add(test);
//    }

%>

<jsp:include page = "fc_footer.jsp"/> <!-- Footer file for all pages-->
