<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%
	String saveid = "";
	Cookie cks[] = request.getCookies();
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("saveid")) {
				saveid = cks[i].getValue();
			}
		}
	}
%>
<meta charset="UTF-8">
<title>만족스러운 피트니스 Nfit</title>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">

<!---shortcut icon--->
<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />

<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!---strat-slider---->
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/slider-style.css" />
<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
<!---//strat-slider---->


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
	<c:choose>
		<c:when test="${empty sessionScope.username }">
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
						</div>
						made by team A.O.A
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

								<li id="signupContainer"><a class="signup"
									id="signupButton" href="memberJoin.do"><span
										onclick="location.href='memberJoin.do'"><i>회원가입</i></span></a></li>
								<li id="loginContainer"><a class="login" id="loginButton"
									href="#"><span onclick="location.href='memberLogin.do'"><i>로그인</i></span></a></li>

							</ul>

						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<!---//End-header---->
		</c:when>
		<c:when test="${sessionScope.username=='admin' }">
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
						<li><a href="#">관리자 페이지</a></li>
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
						</div>
						made by team A.O.A
					</div>
					<div class="header-right">
						<div class="top-nav">
							<ul>
								<li><a href="#">이용안내</a></li>
								<li><a href="#">주변센터찾기</a></li>
								<li><a href="#">고객센터</a></li>
								<li><a href="#">공지사항</a></li>
								<li><a href="coin.do">코인결제</a></li>
								<li><a href="#">관리자 페이지</a></li>
							</ul>
						</div>
						<div class="sign-ligin-btns">

							<ul>

								<li id="signupContainer"><a class="signup"
									id="signupButton" href="memberJoin.do"><span><i>관리자모드</i></span></a></li>
								<li id="loginContainer"><a class="login" id="loginButton"
									href="#"><span onclick="location.href='logout.do'"><i>로그아웃</i></span></a></li>

							</ul>

						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
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
						</div>
						made by team A.O.A
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

								<li id="signupContainer"><a class="signup"
									id="signupButton" href="memberJoin.do"><span onclick="#"><i>마이페이지</i></span></a></li>
								<li id="loginContainer"><a class="login" id="loginButton"
									href="#"><span onclick="location.href='logout.do'"><i>로그아웃</i></span></a></li>

							</ul>

						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

</body>
</html>