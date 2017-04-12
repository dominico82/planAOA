<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/fav-icon.png" />

<!---start-login-script--->
<script src="resources/js/login.js"></script>
<!---//End-login-script--->
<!-----768px-menu----->
<link type="text/css" rel="stylesheet"
	href="resources/css/jquery.mmenu.all.css" />

<link type="text/css" rel="stylesheet" href="resources/css/Login.css" />

</head>
<body >
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div class="site__container" >

		<div class="grid__container">

			<form action="memberLogin.do" method="post" class="form form--login">

				<div class="form__field">
					<label class="fontawesome-user" for="login__username"><span
						class="hidden">ID</span></label> <input id="login__username"
						name="member_id" type="text" class="form__input" placeholder="ID"
						required value="${cookie.saveid.value }">
				</div>

				<div class="form__field">
					<label class="fontawesome-lock" for="login__password"><span
						class="hidden">Password</span></label> <input id="login__password"
						name="member_pwd" type="password" class="form__input"
						placeholder="Password" required>
				</div>

				<div class="form__field">
					<input type="submit" value="Log In">
				</div>
				<p class="text--center">
					<input type="checkbox" name="saveid" value="on"
						${empty cookie.saveid.value?'':'checked' }>ID저장
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"> ID/비밀번호 찾기</a> <span
						class="fontawesome-arrow-right"></span>
				</p>
			</form>
		</div>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>