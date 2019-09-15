<%@page import="java.util.ArrayList"%>
<%@page import="fc.model.Flight"%>
<%@page import="fc.model.dao.*"%>
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flights"/>
</jsp:include>
<%
    Flight testflight = new Flight("1009",  //id
                "KLM", //airline
                "Macau", //origin
                "Hangzhou", //destination
                "21-09-2019", //departure_date
                "15:30PM", //departure_time
                "31-09-2019", //arrival_date
                "20:05AM", //arrival_time
                "Scheduled", //status
                "559", //price
                "54" //available_seats
        );
    Flight testflight1 = new Flight("1010",  //id
                "AerLingues", //airline
                "Chennai", //origin
                "Berlin", //destination
                "24-10-2019", //departure_date
                "09:40PM", //departure_time
                "25-10-2019", //arrival_date
                "05:00AM", //arrival_time
                "Scheduled", //status
                "865", //price
                "149" //available_seats
        );
        Flight testflight2 = new Flight("1011",  //id
                "Icelandair", //airline
                "Miami", //origin
                "Budapest", //destination
                "22-10-2019", //departure_date
                "20:15PM", //departure_time
                "23-10-2019", //arrival_date
                "10:45AM", //arrival_time
                "Scheduled", //status
                "519", //price
                "94" //available_seats
        );
    Flight testflight3 = new Flight("1012",  //id
                "Korean Air", //airline
                "Phuket", //origin
                "Bangkok", //destination
                "21-11-2019", //departure_date
                "05:25PM", //departure_time
                "22-11-2019", //arrival_date
                "07:50AM", //arrival_time
                "Scheduled", //status
                "292", //price
                "194" //available_seats
        );
        Flight testflight4 = new Flight("1013",  //id
                "air New Zealand", //airline
                "Sofia", //origin
                "Warsaw", //destination
                "01-10-2019", //departure_date
                "04:50PM", //departure_time
                "01-10-2019", //arrival_date
                "23:20AM", //arrival_time
                "Scheduled", //status
                "150", //price
                "48" //available_seats
        );
    Flight testflight5 = new Flight("1014",  //id
                "Icelandair", //airline
                "Shanghai", //origin
                "Shenzhen", //destination
                "11-10-2019", //departure_date
                "16:55PM", //departure_time
                "12-10-2019", //arrival_date
                "01:00AM", //arrival_time
                "Scheduled", //status
                "500", //price
                "17" //available_seats
        );
        Flight testflight6 = new Flight("1015",  //id
                "RegionalExpressAirlines", //airline
                "Milan", //origin
                "Orlando", //destination
                "12-10-2019", //departure_date
                "02:15PM", //departure_time
                "13-10-2019", //arrival_date
                "08:30AM", //arrival_time
                "Scheduled", //status
                "420", //price
                "149" //available_seats
        );
    Flight testflight7 = new Flight("1016",  //id
                "All Nippon Airways", //airline
                "Dublin", //origin
                "Nairobi", //destination
                "15-12-2019", //departure_date
                "22:40PM", //departure_time
                "16-12-2019", //arrival_date
                "15:10AM", //arrival_time
                "Scheduled", //status
                "159", //price
                "121" //available_seats
        );
    
    MongoDBManager_Flights db = new MongoDBManager_Flights();   
    db.add(testflight);
    db.add(testflight1);
    db.add(testflight2);
    db.add(testflight3);
    db.add(testflight4);
    db.add(testflight5);
    db.add(testflight6);
    db.add(testflight7);
    ArrayList<Flight> flights = db.getFlights();
%>
    <div class="container" style="margin-top: 50px">
        <h1 class ="bd-content-title">&nbsp;List of Flights</h1>
        <table class="table"style="margin-top: 20px">
          <thead class="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Airline</th>
              <th scope="col">Origin</th>
              <th scope="col">Destination</th>
              <th scope="col">Departure</th>
              <th scope="col">Arrival</th>
              <th scope ="col">Status</th>
              <th scope="col">Price</th>
            </tr>
          </thead>
          <tbody>
                                                 <%
                        for (Flight currentFlight : flights) //for loop for flights 
                                                          //to show all data in flights in the form of table
                            {
                        %>
                            <tr>
                                <th scope = "row" ><%=currentFlight.getID()%></th>
                                <td ><%=currentFlight.getAirline()%></td>
                                <td ><%=currentFlight.getOrigin()%></td>
                                <td ><%=currentFlight.getDestination()%></td>
                                <td ><%=currentFlight.getDepartureDate()%></td>
                                <td ><%=currentFlight.getArrivalDate()%></td>
                                <td ><%=currentFlight.getStatus()%></td>
                                <td ><%=currentFlight.getPrice()%></td>
                            </tr>
                        <%
                            }
                        %>
          </tbody>
        </table>
    </div>
<jsp:include page = "fc_footer.jsp"/>