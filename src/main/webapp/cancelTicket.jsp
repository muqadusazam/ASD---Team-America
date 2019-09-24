<!-- Header file contains Boostrap CSS and page formatting for all pages -->
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Cancel Ticket"/>
</jsp:include>
<!-- Sends 'value' as parameter to update this page's title-->

<jsp:include page="fc_mininav.jsp"></jsp:include>

<!-- width 50 to not take up entire screen, margin to sit nicely in middle of screen -->
<div class="container w-50" style="margin-top: 50px; margin-bottom: 50px">
    <center>
     <h1>Cancel Ticket</h1>
     <br>
     <p>Choose from the list of your booked tickets to cancel:</p>
     
     <select>
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
     </select>
     <br>
     <br>
     <!-- COMMENT -->
     <button type="submit" class="btn btn-success" id="cancelTicketBtn">Cancel Ticket</button>
     </center>
</div>