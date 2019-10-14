<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.MongoDBManager_Flights"%>
<jsp:include page="fc_header.jsp">
    <jsp:param name="title" value="Flight Management/Delete"/>
</jsp:include>


<script>
    //client side validation for preventing empty values input
    function validate()
    {
        var airline = document.forms["flight_add"]["airline"].value;
          if (airline.equals("")) {
            alert("Airline must be filled out");
            return false;
          }
          var airline = document.forms["flight_add"]["origin"].value;
          if (airline.equals("")) {
            alert("Origin must be filled out");
            return false;
          }
          var airline = document.forms["flight_add"]["destination"].value;
          if (airline.equals("")) {
            alert("Destination must be filled out");
            return false;
          }
          var airline = document.forms["flight_add"]["departureTime"].value;
          if (airline.equals("")) {
            alert("Departure time must be selected");
            return false;
          }
          var airline = document.forms["flight_add"]["arrivalTime"].value;
          if (airline.equals("")) {
            alert("Arrival time must be selected");
            return false;
          }
          var airline = document.forms["flight_add"]["departureDate"].value;
          if (airline.equals("")) {
            alert("Departure Date must be selected");
            return false;
          }
          var airline = document.forms["flight_add"]["arrivalDate"].value;
          if (airline.equals("")) {
            alert("Arrival date must be filled out");
            return false;
          }
          var airline = document.forms["flight_add"]["status"].value;
          if (airline.equals("")) {
            alert("Status time must be selected");
            return false;
          }
          var airline = document.forms["flight_add"]["price"].value;
          if (airline.equals("")) {
            alert("Price must be filled out");
            return false;
          }
          var airline = document.forms["flight_add"]["seats"].value;
          if (airline.equals("")) {
            alert("Seats must be filled out");
            return false;
          }
    }
</script>

<div class="container" style = "margin-top: 50px;">
    <h1 style = "margin-bottom:30px">Add Flight</h1>
    <form action="flightAddSuccess.jsp" method ="post" name="flight_add" onsubmit="return validate()">
        <div class="form-group col-md-6">
            <label for="inputAirline">Airline</label>
            <input type="text" class="form-control" id="inputAirline" placeholder="Airline" name="airline" onpaste ="return true">
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputOrigin">Origin</label>
                <input type="text" class="form-control" id="inputOrigin" placeholder="Origin" name="origin" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputDestination">Destination</label>
            <input type="text" class="form-control" id="inputDestination" placeholder="Destination" name="destination" onpaste ="return true">
            </div>
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputDepartTime">Departure Time</label>
                <input type="text" class="form-control" id="inputDepartTime" placeholder="Departure Time" name="departureTime" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputArriveTime">Arrival Time</label>
            <input type="text" class="form-control" id="inputArriveTime" placeholder="Arrival Time" name="arrivalTime" onpaste ="return true">
            </div>
        </div>
        <div class ="form-row">
            <div class ="form-group col-md-6">
                <label for="inputDepartDate">Departure Date</label>
                <input type="text" class="form-control" id="inputDepartDate" placeholder="Departure Date" name="departureDate" onpaste ="return true">
            </div>
            <div class ="form-group col-md-6">
                <label for="inputArriveDate">Arrival Date</label>
            <input type="text" class="form-control" id="inputArriveDate" placeholder="Arrival Date" name="arrivalDate" onpaste ="return true">
            </div>
        </div>
        <div class="form-row">
                <div class="form-group col-md-4">
                <label for ="inputStatus">Status</label>
                <input type="text" class="form-control" id="inputStatus" placeholder="Status" name = "status">
                </div>
                <div class="form-group col-md-4">
                <label for ="inputPrice">Price</label>
                <input type="text" class="form-control" id="inputPrice" placeholder="price" name = "price">
                </div>
                <div class="form-group col-md-4">
                <label for ="inputSeats">Available Seats</label>
                <input type="text" class="form-control" id="inputSeats" placeholder="Available Seats" name = "seats">
                </div>
        </div>
        <input style = "margin-top: 30px" type="submit" class="btn btn-primary"value = "Add">
    </form>
</div>

<jsp:include page = "fc_footer.jsp"/>