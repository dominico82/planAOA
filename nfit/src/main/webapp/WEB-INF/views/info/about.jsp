<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>만족스러운 피트니스 Nfit</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<script>
var userId="${dto.member_id}";
var userName="${dto.member_name}";
var userEmail="${dto.member_email}";
var userTel="${dto.member_tel}";
var userAddr="${dto.member_addr}";
</script>
	</head>
	
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>/
<br><br><br>
	
	<section>
		<article>
		<div style="margin-top:50px;">
		
		<div class="content">
					<div class="about">
						<div class="wrap">
							<h1>About <span>Nfit</span></h1>
							<div class="panels">
								<div class="panel-left">
									<span> </span>
								</div>
								<div class="panel-right">
									<h3>Awesome <span>Runkeeper</span> App!</h3>
									<p>iOS 7 started with a desire to take an experience people love and make it better. To make it even simpler, more useful, and more enjoyable  iOS 7 started with a desire to take an experience </p>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!---start-testimonials---->
						<div class="testimonials">
							<div class="wrap">
							<div class="testimonial-head">
								<h1><span>Runkeeper</span> Testimonials</h1>
								<p>Kind words from our valuable customers</p>
							</div>
							<div class="testimonial-grids">
								<div class="testimonial-grid">
									<a href="#"><img src="resources/images/test-people1.png" alt=""></a>
									<p>Flathost servers are having high physical security and power redundancy Your data will be secure with us.</p>
									<a href="#">james,Envato</a>
								</div>
								<div class="testimonial-grid">
									<a href="#"><img src="resources/images/test-people2.png" alt=""></a>
									<p>With our ultra mordern servers and optical cables, your data will be transfered to end user in milliseconds.</p>
									<a href="#">Mariya, Activeden</a>
								</div>
								<div class="testimonial-grid">
									<a href="#"><img src="resources/images/test-people3.png" alt=""></a>
									<p>We have a dedicated team of support for sales and support to help you in anytime. You can also chat with us.</p>
									<a href="#">Steven, Microlancer</a>
								</div>
								<div class="clear"> </div>
							</div>
				  		</div>
				  		<!---//End-testimonials---->
				  		<!----start-clients-slider--->
				  		<div class="clients-slider">
						<div class="nbs-flexisel-container"><div class="nbs-flexisel-inner"><ul class="flexiselDemo3 nbs-flexisel-ul" style="left: -175.2px; display: block;">
						<li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c3.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c4.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c1.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c2.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c3.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c4.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c1.png"></li><li onclick="location.href='#';" class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c2.png"></li></ul><div class="nbs-flexisel-nav-left" style="top: 13px;"></div><div class="nbs-flexisel-nav-right" style="top: 13px;"></div></div></div> 
						<div class="clear"> </div>      
							  <!---strat-image-cursuals---->
							<script type="text/javascript" src="resources/js/jquery.flexisel.js"></script>
							<!---End-image-cursuals---->
							<script type="text/javascript">
							$(window).load(function() {
							    $(".flexiselDemo3").flexisel({
							        visibleItems: 5,
							        animationSpeed: 1000,
							        autoPlay: true,
							        autoPlaySpeed: 3000,            
							        pauseOnHover: true,
							        enableResponsiveBreakpoints: true,
							        responsiveBreakpoints: { 
							            portrait: { 
							                changePoint:480,
							                visibleItems: 1
							            }, 
							            landscape: { 
							                changePoint:640,
							                visibleItems: 2
							            },
							            tablet: { 
							                changePoint:768,
							                visibleItems: 3
							            }
							        }
							    });
							});
							</script>
						</div>
						<!----start-clients-slider--->
					</div>
				</div>
		
		
			<div class="content">
				<div class="wrap">
					<!--- start-top-grids---->
					<div class="top-grids">
						<div class="top-grid">
							<div class="product-pic frist-product-pic">
								<img src="resources/images/watch-img.png" title="watch" />
							</div>
							<span><label>1</label></span>
							<div class="border"> </div>
							<a href="#">Get a GPS Device</a>
						</div>
						<div class="top-grid">
							<div class="product-pic">
								<img src="resources/images/shoe-img.png" title="shoe" />
							</div>
							<span><label>2</label></span>
							<div class="border hide"> </div>
							<a href="#">Go for a run</a>
						</div>
						<div class="top-grid hide">
							<div class="product-pic">
								<img src="resources/images/lap-img.png" title="laptop" />
							</div>
							<span><label>3</label></span>
							<a href="#">View your results</a>
						</div>
						<div class="clear"> </div>
					</div>
					</div>
					<!--- start-top-grids---->
					<!---start-mid-grids--->
					<div class="mid-grids">
						<div class="wrap">
						<div class="mid-grids-left">
							<img src="resources/images/app-divices.jpg" title="divices" />
							<span> </span>
						</div>
						<div class="mid-grids-right">
							<h3> Get <span>Runkeeper</span> for your mobile</h3>
							<p>The Runkeeper app is available for both i<big>OS</big> and <big>Android</big> devices.</p>
							<ul class="fea">
								<li><a href="#"><i>Log</i> your runs</a></li>
								<li><a href="#"><i>Track</i> your Progress </a></li>
								<li><a href="#">Get a <i>Virtual trainer</i></a></li>
								<li><a href="#"><i>Complete</i> with your friends </a></li>
								<li><a href="#"><i>Share</i> your routes</a></li>
							</ul>
							<div class="big-btns">
								<ul>
									<li><a class="and" href="#"> </a></li>
									<li><a class="iphone" href="#"> </a></li>
									<div class="clear"> </div>
								</ul>
							</div>
						</div>
						<div class="clear"> </div>
					</div>
				</div>		
			</div>
		</div>
		<div class="content">
				<div class="content-feature-grids">
					<div class="wrap"> 
						<h1><span>Runkeeper</span> Features</h1>
					<div class="feature-grid">
						<div class="feature-grid-left icon1">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>All-new design</h2>
							<p>iOS 7 started with a desire to take an experience people love and make it better. To make it even simpler, more useful, and more enjoyable </p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon2">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>All-new features</h2>
							<p>Control Center, AirDrop for iOS, and smarter multitasking are just a few of the great new features in iOS 7. And all your favorite apps have been enhanced</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon3">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>Date to date Update</h2>
							<p>iOS 7 started with a desire to take an experience people love and make it better. To make it even simpler, more useful, enjoyable </p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon4">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>Instant messaging</h2>
							<p>Control Center, AirDrop for iOS, and smarter multitasking are just a few of the great new features in iOS 7. And all your favorite apps</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon5">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>Digital timer</h2>
							<p>iOS 7 started with a desire to take an experience people love and make it better. To make it even simpler, more useful, enjoyable </p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon6">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>Statistics</h2>
							<p>Control Center, AirDrop for iOS, and smarter multitasking are just a few of the great new features in iOS 7. And all your favorite apps</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="clear"> </div>
				</div>
				</div>
			</div>
		
		</article>
	</section>
		<footer>
			<jsp:include page="../footer.jsp"/>
		</footer>
	</body>
</body>
</html>