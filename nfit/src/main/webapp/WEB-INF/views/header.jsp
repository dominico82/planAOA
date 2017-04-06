<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!---shortcut icon--->
		<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
		
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

	    <!---strat-slider---->
	    <script type="text/javascript" src="js/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="css/slider-style.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		
		<!---start-login-script--->
		<script src="js/login.js"></script>
		<!---//End-login-script--->
		
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.all.css" />
		<script type="text/javascript" src="js/jquery.mmenu.js"></script>
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
							<li><a href="#">이용안내</a></li>
							<li><a href="#">주변센터찾기</a></li>
							<li><a href="#">고객센터</a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="coin.do">코인결제</a></li>
						</ul>
					</nav>
			</div>
		<!------start-768px-menu---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="header-left">
					<div class="logo">
						<a href="index.do">N fit</a>
					</div> made by team A.O.A
				</div>
				<div class="header-right">
					<div class="top-nav">
					<ul>
						<li><a href="#">이용안내</a></li>
						<li><a href="#">주변센터찾기</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="coin.do">코인결제</a></li>
					</ul>
				</div>
				<div class="sign-ligin-btns">
					<ul>
						<li id="signupContainer"><a class="signup" id="signupButton" href="memberJoin.do"><span onclick="location.href='memberJoin.do'"><i>회원가입</i></span></a>
							 				            <!-- Login Ends Here -->
						</li>
						<li id="loginContainer"><a class="login" id="loginButton" href="#"><span><i>로그인</i></span></a>
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
					
					</ul>
				</div>
				<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
			</div>
			</div>
			<!---//End-header---->


</body>
</html>