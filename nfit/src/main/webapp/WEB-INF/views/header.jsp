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
		<!---start-wrap---->
		<!------start-768px-menu---->
			<div id="page">
					<div id="header">
						<a class="navicon" href="#menu-left"> </a>
					</div>
					<nav id="menu-left">
						<ul>
							<li><a href="resources/index.html">Home</a></li>
							<li><a href="resources/about.html">About</a></li>
							<li><a href="resources/features.html">Features</a></li>
							<li><a href="coin.do">코인결제</a></li>
							<div class="clear"> </div>
						</ul>
					</nav>
			</div>
		<!------start-768px-menu---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="header-left">
					<div class="logo">
						<a href="resources/index.html">Runkeeper</a>
					</div>
				</div>
				<div class="header-right">
					<div class="top-nav">
					<ul>
						<li><a href="resources/index.html">Home</a></li>
						<li><a href="resources/about.html">About</a></li>
						<li><a href="resources/features.html">Features</a></li>
						<li><a href="coin.do">코인결제</a></li>
					</ul>
				</div>
				<div class="sign-ligin-btns">
					<ul>
						<li id="memberJoinContainer"><a class="memberJoin" id="memberJoinButton" href="memberJoin.do"><span><i>회원가입</i></span></a></li>
						<li id="loginContainer"><a class="login" id="loginButton" href="#"><span><i>Login</i></span></i></a>
							 <div class="clear"> </div>
				                <div id="loginBox">                
				                    <form id="loginForm">
				                        <fieldset id="body">
				                            <fieldset>
				                                <label for="email">Email Address</label>
				                                <input type="text" name="email" id="email" />
				                            </fieldset>
				                            <fieldset>
				                                <label for="password">Password</label>
				                                <input type="password" name="password" id="password" />
				                            </fieldset>
				                            <label class="remeber" for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
				                            <input type="submit" id="login" value="login" />
				                        </fieldset>
				                        <span><a href="#">Forgot your password?</a></span>
				                    </form>
				                </div>
				            <!-- Login Ends Here -->
						</li>
						<div class="clear"> </div>
					</ul>
				</div>
				<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
			</div>
			</div>
</body>
</html>