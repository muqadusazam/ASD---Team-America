
<jsp:include page="fc_header.jsp">
	<jsp:param name="title" value="Flight Center/main"/>
</jsp:include>

<%@page import="java.util.*"%>
<%@page import="java.util.concurrent.ThreadLocalRandom"%>

	<section class="text-center">
		<div>
                    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
		    <ol class="carousel-indicators">
                      <!-- 3 screen for 3 recommanded city(flight) -->  
		      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		    </ol>
		    <div class="carousel-inner">
		      <div class="carousel-item active">
		      	<a href="./flights.jsp">
                                    <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100 scrollimg" src="./resources/seoul.jpg" height ="680"/>
                                <div class="carousel-caption d-none d-md-block">
                                    <p class="anthy1"style = "font-size: 70px">Seoul</p>
                                    <p class="anthy1">Click here to book a flight to Seoul, South Korea.</p>
                                </div>
			    </a>
		      </div>
		      <div class="carousel-item">
		      	<a href="./flights.jsp">
                                    <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100 scrollimg" src="./resources/budapest.jpg" height ="680"/>
                                <div class="carousel-caption d-none d-md-block">
                                    <p class="anthy1"style = "font-size: 70px">Budapest</p>
                                    <p class="anthy1">Click here to book a flight to Budapest, Hungary.</p>
                                </div>
			    </a>
		      </div>
                      <div class="carousel-item">
		      	<a href="./flights.jsp">
                                    <img class="bd-placeholder-img bd-placeholder-img-lg d-block w-100 scrollimg" src="./resources/dubai.jpg" height ="680" />
                                <div class="carousel-caption d-none d-md-block">
                                    <p class="anthy1"style = "font-size: 70px">Dubai</p>
                                    <p class="anthy1">Click here to book a flight to Dubai, UAE.</p>
                                </div>
			    </a>
		      </div>
		    </div>
                      
		    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		      <span class="carousel-control-next-icon" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>

                </div>
        </section>

        <h2 class="mb-4">Where to, Adventures?</h2>
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
              <a href="flights.jsp">
                <img class="bd-placeholder-img card-img-top movieCard" height="464" src="./resources/canada.jpg" /> <!--movie poster-->
              </a>
            <div class="card-body">
                <a href="flights.jsp" style="text-decoration:none; color:black;"><h3>Canada</h3></a>
              <p class="card-text">Overview:<br>Have a look at our Canada travel guide for all the information you need on this beautiful, diverse country. For great savings book with Flight Centre.</p><!--synopsis -->
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="flights.jsp">Book a trip</button> <!--go to movie detail page-->
                </div>
                <small class="text-muted">Price $350 </small> <!--runtime-->
              </div>
            </div>
          </div>
        </div>
          <div class="col-md-4">
                      <div class="card mb-4 shadow-sm">
              <a href="flights.jsp">
                <img class="bd-placeholder-img card-img-top movieCard" height="464" src="./resources/japan.jpg" /> <!--movie poster-->
              </a>
            <div class="card-body">
                <a href="flights.jsp" style="text-decoration:none; color:black;"><h3>Japan</h3></a>
              <p class="card-text">Overview:<br>Japan is truly timeless, a place where ancient traditions are fused with modern life as if it were the most natural thing in the world.</p><!--synopsis -->
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="flights.jsp">Book a trip</button> <!--go to movie detail page-->
                </div>
                <small class="text-muted">Price $580 </small> <!--runtime-->
              </div>
            </div>
          </div>
          </div>
          <div class="col-md-4">
                      <div class="card mb-4 shadow-sm">
              <a href="flights.jsp">
                <img class="bd-placeholder-img card-img-top movieCard" height="464" src="./resources/italy.jpg" /> <!--movie poster-->
              </a>
            <div class="card-body">
                <a href="flights.jsp" style="text-decoration:none; color:black;"><h3>Italy</h3></a>
              <p class="card-text">Overview:<br>Arguably Europe?s most enticing country, Italy charms visitors with irresistible food, awesome architecture, diverse scenery and unparalleled art.</p><!--synopsis -->
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="flights.jsp">Book a trip</button> <!--go to movie detail page-->
                </div>
                <small class="text-muted">Price $430 </small> <!--runtime-->
              </div>
            </div>
          </div>
        </div>
      </div>


<jsp:include page = "fc_footer.jsp"/>