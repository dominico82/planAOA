<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/fav-icon.png" />
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
<link type="text/css" rel="Stylesheet" href="resources/css/Join.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript">
function email_change() {
	if (document.join.email.options[document.join.email.selectedIndex].value == "") {
		document.join.email2.disabled = true;
		document.join.email2.value = "";
	}
	if (document.join.email.options[document.join.email.selectedIndex].value == '9') {
		document.join.email2.disabled = false;
		document.join.email2.value = "";
		document.join.email2.focus();
	} else {
		document.join.email2.disabled = true;
		document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;
	}
}
</script>
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div style="margin-top: 100px; margin-bottom: 100px;">
		<form id="formmain" action="memberFindId.do" method="post" name="join">
			<fieldset>
				 아이디 찾기
				<ol>
					<li><label>이름</label><input type="text" name="member_name"
						required="required" onkeydown="checkNumber();"></li>
					<li><label>이메일</label> <input id="customerEmailLocal"
						name="email1" type="text"> @ <input title="이메일 도메인 입력"
						name="email2" type="text"> <select title="이메일 도메인 선택"
						name="emailprovidor"
						onchange="this.form.email2.value=this[this.selectedIndex].value;">
							<option value="" selected="selected">선택</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="hanmail.net">다음</option>
							<option value="hotmail.com">핫메일</option>
							<option value="yahoo.co.kr">야후</option>
							<option value="">직접입력</option>
					</select></li>
				</ol>
			</fieldset>
			<input type="submit" value="아이디 찾기" name='submit'><input
				type="reset" id="button" value="다시작성">
		</form>
	</div>
	<div>
		<form id="formmain" action="memberJoin.do" method="post" name="join">
			<fieldset>
				비밀번호 찾기
				<ol>
					<li><label for="userid">아이디</label> <input id="input"
						name="member_id" type="text" required="required" autofocus
						maxlength="12" placeholder="아이디를 입력하세요"></li>
					<li><label>이름</label><input type="text" name="member_name"
						required="required" onkeydown="checkNumber();"></li>
					<li><label>이메일</label> <input id="customerEmailLocal"
						name="email1" type="text"> @ <input title="이메일 도메인 입력"
						name="email2" type="text"> <select title="이메일 도메인 선택"
						name="emailprovidor"
						onchange="this.form.email2.value=this[this.selectedIndex].value;">
							<option value="" selected="selected">선택</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="hanmail.net">다음</option>
							<option value="hotmail.com">핫메일</option>
							<option value="yahoo.co.kr">야후</option>
							<option value="">직접입력</option>
					</select></li>
				</ol>
			</fieldset>
			<input type="submit" value="비밀번호 찾기" name='submit'><input
				type="reset" id="button" value="다시작성">
		</form>
	</div>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>