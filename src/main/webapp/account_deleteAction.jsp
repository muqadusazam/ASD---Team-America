<%-- 
    Document   : account_deleteAction
    Created on : 02/09/2019, 3:29:50 PM
    Author     : Kyle
--%>

<%@page import="fc.model.dao.MongoDBManager_Customers"%>
<%@page import="fc.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    MongoDBManager_Customers db = new MongoDBManager_Customers();
    try{
        db.remove((Customer)session.getAttribute("customer"));
        response.sendRedirect("logoutAction.jsp");
    } catch (Exception e) {
        response.sendRedirect("main.jsp");
    }
    %>