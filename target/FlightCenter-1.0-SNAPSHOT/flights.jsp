<%-- 
    Document   : flights
    Created on : 2019. 8. 13, ?? 8:07:44
    Author     : el181
--%>

<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/flights"/>
</jsp:include>

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
              <th scope="col">Price</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Asiana</td>
              <td>Sydney</td>
              <td>Seoul</td>
              <td>19/08/19 11:35</td>
              <td>20/08/19 6:50</td>
              <td>455.50</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Quantas</td>
              <td>Sydney</td>
              <td>Melbourne</td>
              <td>20/08/19 20:55</td>
              <td>20/08/19 22:10</td>
              <td>150.0</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Jetstar</td>
              <td>Osaka</td>
              <td>New York</td>
              <td>17/08/19 08:20</td>
              <td>18/08/19 13:05</td>
              <td>520.0</td>
            </tr>
            <tr>
              <th scope="row">4</th>
              <td>Jetstar</td>
              <td>Seoul</td>
              <td>Sydney</td>
              <td>20/08/19 06:20</td>
              <td>21/08/19 07:05</td>
              <td>450.0</td>
            </tr>
            <tr>
              <th scope="row">5</th>
              <td>Jetstar</td>
              <td>Seoul</td>
              <td>New York</td>
              <td>17/08/19 08:20</td>
              <td>18/08/19 13:05</td>
              <td>410.0</td>
            </tr>
          </tbody>
        </table>
    </div>
<jsp:include page = "fc_footer.jsp"/>