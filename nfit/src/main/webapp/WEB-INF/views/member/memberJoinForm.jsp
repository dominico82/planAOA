<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Runkeeper Website Template | Home :: w3layouts</title>
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/fav-icon.png" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
</script>
<!---strat-slider---->
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/slider-style.css" />
<script type="text/javascript"
	src="resources/js/modernizr.custom.28468.js"></script>
<!---//strat-slider---->
<!---start-login-script--->
<script src="resources/js/login.js"></script>
<!---//End-login-script--->
<!-----768px-menu----->
<link type="text/css" rel="stylesheet"
	href="resources/css/jquery.mmenu.all.css" />
<link type="text/css" rel="stylesheet" href="resources/css/coin.css" />
<link type="text/css" rel="Stylesheet" href="resources/css/Join.css"/>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/jquery.mmenu.js"></script>
<script type="text/javascript">
	//	The menu on the left
	$(function() {
		$('nav#menu-left').mmenu();
	});
</script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
<form id="formmain">
		<fieldset>
			<legend>로그인 정보</legend>
			<ol>
				<li><label for="userid">아이디</label> <input id="userid"
					name="userid" type="text" required="required" autofocus /> <!-- auto focus: 처음 위치 지정 -->
				</li>
				<li><label for="pwd1">비밀번호</label> <input id="pwd1" name="pwd1"
					type="password" required="required" /></li>
				<li><label for="pwd2">비밀번호확인</label> <input id="pwd2"
					name="pwd2" type="password" required="required" /></li>
				<li><label for="level">회원 등급</label> <input id="level"
					name="level" type="text" readonly value="준회원" /> <!-- readonly 수정 불가-->
				</li>
			</ol>
		</fieldset>


		<fieldset>
			<legend>개인 정보</legend>
			<ol>
				<li><label for="fullname">이름</label> <input id="fullname"
					name="fullname" type="text" placeholder="5자 미만" required="required" />
				</li>
				<li><label for="email">이메일</label> <input id="email"
					name="email" type="email" placeholder="example@email.com"
					autocomplete="off" required="required" /></li>
				<li><label for="tel">연락처</label> <input id="tel" name="tel"
					type="tel" autocomplete="off" /></li>
			</ol>
		</fieldset>

		<fieldset>
			<legend>코딩 숙련도(상,중,하)</legend>
			<ol>
				<li><input id="skill" name="skill" type="range" min="1" max="3"
					step="1" /></li>
			</ol>
		</fieldset>
		<fieldset>
			<button type="submit">제출</button>
		</fieldset>

	</form>

	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>