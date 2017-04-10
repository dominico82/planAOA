<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>M fit  | Home</title>
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css" rel="stylesheet" integrity="sha384-zF4BRsG/fLiTGfR9QL82DrilZxrwgY/+du4p/c7J72zZj+FLYq4zY00RylP9ZjiT" crossorigin="anonymous">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!---shortcut icon--->
		<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
		
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<!-- Latest compiled and minified JavaScript -->
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
		
			<!----//End-banner---->
			<!----start-content--->
			<div class="content">
				<div class="wrap">
					<!--- start-top-grids---->
					<div class="top-grids">
						<div class="top-grid">
							<div class="product-pic frist-product-pic">
								<img src="resources/images/img_step_1.png" title="join" />
							</div>
							<span><label>1</label></span>
							<div class="border"> </div>
							<a href="#">회원가입을 통해 정보를 입력한다.</a>
						</div>
						<div class="top-grid">
							<div class="product-pic">
								<img src="resources/images/img_step_2.png" title="book" />
							</div>
							<span><label>2</label></span>
							<div class="border hide"> </div>
							<a href="#">코인을 충전하고 원하는 센터를 찾아 예약!!</a>
						</div>
						<div class="top-grid hide">
							<div class="product-pic">
								<img src="resources/images/img_step_3.png" title="play" />
							</div>
							<span><label>3</label></span>
							<a href="#">센터를 방문해 즐겁게 운동을 ^^</a>
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
			<!----//End-content--->
		<!---//End-wrap---->
		<footer>
		<%@include file="footer.jsp" %>
		</footer>
	</body>
</html>