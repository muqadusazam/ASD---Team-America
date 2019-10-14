<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Delete"/>
</jsp:include>

<%
    String id = request.getParameter("updateID");
    MongoDBManager_Flights flightDB = new MongoDBManager_Flights();
    Flight flight = flightDB.getFlight(id);
%>

<div class="container" style = "margin-top: 50px;">
    <h1 style = "margin-bottom:30px">Update Flight</h1>
    <form action="flightUpdateSuccess.jsp" method ="post" name="flight_update" onsubmit="return validate()">
        <div class="form-group col-md-6">
            <label for="inputAirline">Airline</label>
            <input type="text" class="form-control" id="inputAirline" value ="<%=flight.getAirline()%>" placeholder="Airline" name="airline" onpaste ="return true">
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputOrigin">Origin</label>
                <input type="text" class="form-control" id="inputOrigin" value ="<%=flight.getOrigin()%>" placeholder="Origin" name="origin" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputDestination">Destination</label>
            <input type="text" class="form-control" id="inputDestination" value ="<%=flight.getDestination()%>" placeholder="Destination" name="destination" onpaste ="return true">
            </div>
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputDepartTime">Departure Time</label>
                <input type="text" class="form-control" id="inputDepartTime" value ="<%=flight.getDepartureTime()%>" placeholder="Departure Time" name="departureTime" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputArriveTime">Arrival Time</label>
            <input type="text" class="form-control" id="inputArriveTime" value ="<%=flight.getArrivalTime()%>" placeholder="Arrival Time" name="arrivalTime" onpaste ="return true">
            </div>
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputDepartDate">Departure Date</label>
                <input type="text" class="form-control" id="inputDepartDate" value ="<%=flight.getDepartureDate()%>" placeholder="Departure Date" name="departureDate" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputArriveDate">Arrival Date</label>
            <input type="text" class="form-control" id="inputArriveDate" value ="<%=flight.getArrivalDate()%>" placeholder="Arrival Date" name="arrivalDate" onpaste ="return true">
            </div>
        </div>
        <div class="form-row">
                <div class="form-group col-md-4">
                <label for ="inputStatus">Status</label>
                <input type="text" class="form-control" id="inputStatus" value ="<%=flight.getStatus()%>" placeholder="Status" name = "status">
                </div>
                <div class="form-group col-md-4">
                <label for ="inputPrice">Price</label>
                <input type="text" class="form-control" id="inputPrice" value ="<%=flight.getPrice()%>" placeholder="price" name = "price">
                </div>
                <div class="form-group col-md-4">
                <label for ="inputSeats">Available Seats</label>
                <input type="text" class="form-control" id="inputSeats" value ="<%=flight.getAvailableSeats()%>" placeholder="Available Seats" name = "seats">
                </div>
        </div>
                  <button style="float:right; margin:30px"type="submit" name="ID" value="<%= flight.getID() %>" class="btn btn-primary">Update</button> 
        
    </form>
</div>

<jsp:include page = "fc_footer.jsp"/>