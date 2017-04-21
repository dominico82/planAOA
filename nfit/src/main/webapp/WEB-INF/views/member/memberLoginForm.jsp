<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

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
		<jsp:include page="../header.jsp"/>
	</header>
<br><br><br><br>
<div class="wrap">
    <div class="wrap">
	  <div class="container">
    	<div class="row">
    	  <div class="content col-md-12">
       		 <div class="page-header">
          <h2>
            로그인
            <small>로그인후 이용하세요!</small>
          </h2>
        </div>
        	</div>
        	</div>
        	</div>
        	</div>
        	</div>
	<div class="site__container" style="margin-bottom: 86px">

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
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="memberFind.do"> ID/비밀번호 찾기</a> <span
						class="fontawesome-arrow-right"></span>
				</p>
			</form>
		</div>
	</div>
	<br><br><br>
	<footer>
		<jsp:include page="../footer.jsp"/>
	</footer>
</body>
</html>