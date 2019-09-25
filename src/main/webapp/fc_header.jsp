<%-- 
    Document   : fc_header
    Created on : 2019. 8. 13, 오후 4:26:29
    Author     : el181
--%>

<%--header should be included at the begining of every page (jsp file)--%>
<%@page import="fc.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title><%=request.getParameter("title")%></title>

    </head>

    <body style="background-color: #eeeeee">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #eeeeee;">
            <img src="./resources/logo.png" width="30" height="30">
            <a class="navbar-brand" style="font-size: 31px;margin-left: 20px; padding:0px"  href="#">FC</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor03" style = "margin-left: 60px">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active h">
                        <a class="nav-link" href="main.jsp" >Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item h">
                        <a class="nav-link" href="flights_search.jsp">Flights</a>

                </ul>
                <ul class="navbar-nav mr-sm-2">
                    </li>
                    <%
                        if (session.getAttribute("customer") == null) {
                    %>
                    <li class="nav-item h">
                        <a class="nav-link" href="login.jsp" >Login</a>
                    </li>
                    <li class="nav-item h">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                    <%
                    } else {
                    %>
                    <li class="nav-item h">
                        <a class="nav-link" href="account.jsp">Manage Account</a>
                    </li>
                    <li class="nav-item h">
                        <a class="nav-link" href="logoutAction.jsp">Logout</a>
                    </li>
                    <%
                        }
                    %>
                </ul>

            </div>

        </nav>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #393e46;">
        </nav>

        <main role = "main">
