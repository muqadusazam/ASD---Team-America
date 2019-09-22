<%--
    Document   : registerSuccess
    Created on : Aug 25, 2019, 5:33:02 PM
    Author     : kelvin
--%>

<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Registration Successful"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

    <body>
        <!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
        <div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
            <center>
            <h1>Registration Successful!</h1>
            <br>
            <p>You have successfully registered! Click on the buttons below to be redirected.</p>
            <br>
            <!-- Redirect to login page or main page upon clicking buttons-->
            <button type="button" class="btn btn-primary" onclick="location.href = 'login.jsp'">Login</button>
            <button ctype="button" class="btn btn-secondary" onclick="location.href = 'main.jsp'">Home Page</button>
            </center>
        </div>
    </body>

<jsp:include page = "fc_footer.jsp"/> <!-- Footer file for all pages-->
