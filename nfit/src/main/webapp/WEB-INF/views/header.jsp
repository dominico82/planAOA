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
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-zF4BRsG/fLiTGfR9QL82DrilZxrwgY/+du4p/c7J72zZj+FLYq4zY00RylP9ZjiT"
	crossorigin="anonymous">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">

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
	<!----- 새로운 부트스트랩 헤더메뉴 ----->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.do">Nfit</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">이용안내 <span class="sr-only">(current)</span></a></li>
						<li><a href="#">주변센터찾기</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="coin.do">코인결제</a></li>
					</ul>
				<form class="navbar-form navbar-left" role="search"
					style="padding-left: 100px;">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<c:choose>
				<c:when test="${empty sessionScope.saveid }">
				<a href="memberJoin.do" class="btn btn-warning"
					style="margin-left: 100px;">회원가입</a> <a href="memberLogin.do"
					class="btn btn-danger">로그인</a>
				</c:when>
				<c:when test="${sessionScope.saveid=='admin'}">
				<a href="#" class="btn btn-warning"
					style="margin-left: 100px;">관리자 페이지</a> <a href="logout.do"
					class="btn btn-danger">로그아웃</a>
				</c:when>
				<c:when  test="${!empty sessionScope.saveid }">
				<a href="myPage.do" class="btn btn-warning"
					style="margin-left: 100px;">마이페이지</a> <a href="logout.do"
					class="btn btn-danger">로그아웃</a>
				</c:when>
				
				</c:choose>
			</div>
		</div>
	</nav>
	<!----- 새로운 부트스트랩 헤더메뉴 끝 ----->
	<!------반응형 축소메뉴 시작---->
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
	<!------반응형 축소메뉴 끝---->

	<%-- <c:choose>
		<c:when test="${empty sessionScope.saveid }">
			<!---start-wrap---->
			<!------start-768px-menu---->
			<div id="page">
				<div id="header">
					<a class="navicon" href="#menu-left"> </a>
				</div>
				<nav id="menu-left">
					<ul>
						<li><a href="#">이용안내</a></li>
						<li><a href="centerPage.do">주변센터찾기</a></li>
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
								<li><a href="centerPage.do">주변센터찾기</a></li>
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
		<c:when test="${sessionScope.saveid=='admin' }">
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
		<c:when test="${!empty sessionScope.saveid }">
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
									id="signupButton" href="memberJoin.do"><span onclick=""><i>마이페이지</i></span></a></li>
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
	</c:choose> --%>

</body>
</html>