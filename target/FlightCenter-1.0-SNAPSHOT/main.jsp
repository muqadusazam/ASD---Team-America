
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

<jsp:include page = "fc_footer.jsp"/>