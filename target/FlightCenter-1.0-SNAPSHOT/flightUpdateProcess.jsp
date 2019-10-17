<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Delete"/>
</jsp:include>


<div class="container" style = "margin-top: 50px;">
    <h1 style = "margin-bottom:30px">Update Flight</h1>
    <form action="UpdateFlightServlet" method ="post" name="flight_update" onsubmit="return validate()">
        <div class="form-group col-md-6">
            <label for="inputAirline">Airline</label>
            <input type="text" class="form-control" id="inputAirline" value ="${param.airline}" placeholder="Airline" name="airline" onpaste ="return true">
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputOrigin">Origin</label>
                <input type="text" class="form-control" id="inputOrigin" value ="${param.origin}" placeholder="Origin" name="origin" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputDestination">Destination</label>
            <input type="text" class="form-control" id="inputDestination" value ="${param.destination}" placeholder="Destination" name="destination" onpaste ="return true">
            </div>
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputDepartTime">Departure Time</label>
                <input type="text" class="form-control" id="inputDepartTime" value ="${param.departure_time}" placeholder="Departure Time" name="departureTime" onpaste ="return true">
                <span class="error text-danger"><em>${errors.DtimeError}</em></span>
            </div>
            <div class ="form-group col-md-6">
                <label for="inputArriveTime">Arrival Time</label>
            <input type="text" class="form-control" id="inputArriveTime" value ="${param.arrival_time}" placeholder="Arrival Time" name="arrivalTime" onpaste ="return true">
            <span class="error text-danger"><em>${errors.AtimeError}</em></span>
            </div>
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputDepartDate">Departure Date</label>
                <input type="text" class="form-control" id="inputDepartDate" value ="${param.departure_date}" placeholder="Departure Date" name="departureDate" onpaste ="return true">
                <span class="error text-danger"><em>${errors.DdateError}</em></span>
            </div>
            <div class ="form-group col-md-6">
                <label for="inputArriveDate">Arrival Date</label>
            <input type="text" class="form-control" id="inputArriveDate" value ="${param.arrival_date}" placeholder="Arrival Date" name="arrivalDate" onpaste ="return true">
            <span class="error text-danger"><em>${errors.AdateError}</em></span>
            </div>
        </div>
        <div class="form-row">
                <div class="form-group col-md-4">
                <label for ="inputStatus">Status</label>
                <input type="text" class="form-control" id="inputStatus" value ="${param.status}" placeholder="Status" name = "status">
                </div>
                <div class="form-group col-md-4">
                <label for ="inputPrice">Price</label>
                <input type="text" class="form-control" id="inputPrice" value ="${param.price}" placeholder="price" name = "price">
                <span class="error text-danger"><em>${errors.priceError}</em></span>
                </div>
                <div class="form-group col-md-4">
                <label for ="inputSeats">Available Seats</label>
                <input type="text" class="form-control" id="inputSeats" value ="${param.available_seats}" placeholder="Available Seats" name = "seats">
                <span class="error text-danger"><em>${errors.avaSeatsError}</em></span>
                </div>
        </div>
                  <button style="float:right; margin:30px"type="submit" name="ID" value="${param.ID}" class="btn btn-primary">Update</button> 
        
    </form>
</div>

<jsp:include page = "fc_footer.jsp"/>