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
    MongoDBManager_Customers db = new MongoDBManager_Customers();       //Create conneciton to mLab DB
    try{
        db.remove((Customer)session.getAttribute("customer"));      //Get 'customer' attribute from session, call remove() method and pass down
        response.sendRedirect("logoutAction.jsp");      //Redirect to logoutAction page after deleting customer
    } catch (Exception e) {
        response.sendRedirect("main.jsp");      //if no customer logged in, redirect back to main page
    }
    %>