<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Runkeeper Website Template | Home :: w3layouts</title>
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
	    <!---strat-slider---->
	    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="resources/css/slider-style.css" />
		<script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		<!---start-login-script--->
		<script src="resources/js/login.js"></script>
		<!---//End-login-script--->
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script type="text/javascript" src="resources/js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>
		<!-----//768px-menu----->
	</head>
	<body>
	<header>
		<%@include file="header.jsp" %>
	</header>
		<!---start-wrap---->
		<!------start-768px-menu---->
			<div id="page">
					<div id="header">
						<a class="navicon" href="#menu-left"> </a>
					</div>
					<nav id="menu-left">
						<ul>
							<li><a href="resources/index.jsp">Home</a></li>
							<li><a href="resources/about.html">About</a></li>
							<li><a href="resources/features.html">Features</a></li>
							<li><a href="coin.do">코인결제</a></li>
							<div class="clear"> </div>
						</ul>
					</nav>
			</div>
		<!------start-768px-menu---->
			
			<!----start-banner---->
			<div class="text-slider">
				<div class="wrap"> 
			<!---start-da-slider----->
			<div id="da-slider" class="da-slider">
					<div class="da-slide">
						<h2>Log Your Runs</h2>
						<p> Track your Progress Compete with your Friends</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Log Your Runs</h2>
						<p> Track your Progress Compete with your Friends</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Log Your Runs</h2>
						<p> Track your Progress Compete with your Friends</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Log Your Runs</h2>
						<p> Track your Progress Compete with your Friends</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Log Your Runs</h2>
						<p> Track your Progress Compete with your Friends</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<nav class="da-arrows">
						<span class="da-arrows-prev"> </span>
						<span class="da-arrows-next"> </span>
					</nav>
			</div>
				<script type="text/javascript" src="resources/js/jquery.cslider.js"></script>
				<script type="text/javascript">
					$(function() {
						$('#da-slider').cslider({
							autoplay	: true,
							bgincrement	: 450
						});
					
					});
				</script>
			 </div>
			</div>
				<!---//End-da-slider----->
			<!----//End-banner---->
			<!----start-content--->
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
				<!---//End-mid-grids--->
				<!---start-bottom-footer-grids---->
				<div class="footer-grids">
					<div class="wrap">
						<div class="footer-grid">
							<h3>Quick Links</h3>
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#">About Features</a></li>
								<li><a href="#">Login</a></li>
								<li><a href="#">Sign Up</a></li>
							</ul>
						</div>
						<div class="footer-grid">
							<h3>More</h3>
							<ul>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Terms and Conditions</a></li>
							</ul>
						</div>
						<div class="footer-grid">
							<h3>Connect With Us</h3>
							<ul class="social-icons">
								<li><a class="facebook" href="#"> </a></li>
								<li><a class="twitter" href="#"> </a></li>
								<li><a class="youtube" href="#"> </a></li>
							</ul>
							<p class="copy-right">Template by <a href="#">W3layouts</a></p>
						</div>
						<div class="footer-grid">
							<h3>Newsletter</h3>
							<p>Subscribe to our newsletter to keep up-to-date with all the latest news.</p>
							<form>
								<input type="text" class="text" value="Your Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Name';}">
								<input type="text" class="text" value="Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Email';}">
								<input type="submit" value="subscribe" />
							</form>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<!---//End-bottom-footer-grids---->
			</div>
			<!----//End-content--->
		<!---//End-wrap---->
	</body>
</html>