<%-- 
    Document   : flightAddSuccess
    Created on : 2019. 9. 28, ?? 8:37:58
    Author     : el181
--%>

<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Flight Updated"/>
</jsp:include>

<div class ="container pt-5">
    <div class ="header row">
         <h2 style ="overflow-wrap:break-word; margin-top: 30px"> The flight has been successfully updated. </h2>
    </div>
    <a href = "flight_management.jsp" class = "btn btn-lg btn-primary"style = "margin: 20px; float:right"> Back to the List </a>
</div>


<jsp:include page ="fc_footer.jsp"/>