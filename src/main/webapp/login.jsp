
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="login"/>
</jsp:include>

        <div style = "margin-top: 100px"> <h1><b><center>Login</center></b></h1></div>
        <div class="container w-25" style = "margin-top:100px">
            <div class="form-group">
                <input type="text" class="form-control" name="email" placeholder="Email">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
<jsp:include page = "fc_footer.jsp"/>
