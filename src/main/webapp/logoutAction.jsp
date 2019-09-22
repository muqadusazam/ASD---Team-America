<%-- 
    Document   : logoutAction
    Created on : 02/09/2019, 12:42:06 PM
    Author     : Kyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();       //invalidate current session so attributes are cleared
    response.sendRedirect("main.jsp");      //redirect user back to main page

%>
