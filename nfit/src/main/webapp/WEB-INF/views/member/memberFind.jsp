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

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<link rel="stylesheet" type="text/css" href="resources/css/modifyForm.css"/>
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
	function checkNumber() {
		var objEv = event.srcElement;
		var num = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/ "; //입력을 막을 특수문자 기재.
		event.returnValue = true;

		for (var i = 0; i < objEv.value.length; i++) {
			if (-1 != num.indexOf(objEv.value.charAt(i)))
				event.returnValue = false;
		}

		if (!event.returnValue) {
			alert("특수문자는 입력하실 수 없습니다.");
			objEv.value = "";
		}
	}
	function checkNumber1() {
		var objEv = event.srcElement;
		var num = "{}[]()<>?_|~`!@#$%^&*-+\"'\\/"; //입력을 막을 특수문자 기재
		var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		event.returnValue = true;

		for (var i = 0; i < objEv.value.length; i++) {
			if (-1 != num.indexOf(objEv.value.charAt(i)))
				event.returnValue = false;
		}
		if (check.test(objEv.value)) {
			alert('특수문자&한글은 입력하실 수 없습니다.');
			objEv.value = "";
			return false;
		}

		if (!event.returnValue) {
			alert("특수문자&한글은 입력하실 수 없습니다.");
			objEv.value = "";
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>
	<div class="wrap">
		<div class="container" style="width:600px; margin: 0px auto;">
			<div class="mypageWrap">
				<div class="row">
					<div class="col-lg-10 col-md-9 col-sm-8" id="inner_top">
						<div class="editMyInfo" style="margin-top: 150px;">
							<h3>아이디 찾기</h3>
							<form id="formmain" action="memberFindId.do" method="post"
								name="join" class="memberForm">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="name">이름</label><input type="text"
												name="member_name" required="required"
												onkeydown="checkNumber();" class="form-control">
										</div>
										<div class="form-group">
											<label>이메일</label><br> <input id="customerEmailLocal"
												name="email1" type="text" onkeyup="checkNumber1();">
											@ <input title="이메일 도메인 입력" name="email2" type="text"
												onkeyup="checkNumber1();"> <select
												title="이메일 도메인 선택" name="emailprovidor"
												onchange="this.form.email2.value=this[this.selectedIndex].value;">
												<option value="" selected="selected">직접입력</option>
												<option value="naver.com">네이버</option>
												<option value="nate.com">네이트</option>
												<option value="hanmail.net">다음</option>
												<option value="hotmail.com">핫메일</option>
												<option value="yahoo.co.kr">야후</option>
											</select>
										</div>
										
									</div>
								</div>
								<div class="row" style="margin: 0px auto; width: 600px;">
								<div class="form-group submitLine forMbileAppFloat" style="border-top: 0px; width: 455px; margin: 0px auto; margin-bottom: 40px;">
											<input type="submit" value="아이디 찾기" name='submit'
												class="btn btn-lg btn-primary btn_mobileAppFloat"><input
												type="reset" id="button" value="다시작성"
												class="btn btn-lg btn-primary btn_mobileAppFloat">
										</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="container" style="width:600px; margin: 0px auto;">
			<div class="mypageWrap">
				<div class="row">
					<div class="col-lg-10 col-md-9 col-sm-8" id="inner_top">
						<div class="editMyInfo" style="margin-top: 100px; margin-bottom: 100px;">
							<h3>비빌번호 찾기</h3>
							<form id="formmain" action="memberPwdFind.do" method="post"
								name="join" class="memberForm">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="userid">아이디</label> <input id="input"
												name="member_id" type="text" required="required"
												maxlength="12" placeholder="아이디를 입력하세요"
												onkeyup="checkNumber1();" class="form-control">
										</div>
										<div class="form-group">
											<label>이름</label><input type="text" name="member_name"
												required="required" onkeydown="checkNumber();" class="form-control">
										</div>
										<div class="form-group">
											<label>이메일</label><br>
											<input id="customerEmailLocal" name="email1" type="text"
												onkeyup="checkNumber1();"> @ <input
												title="이메일 도메인 입력" name="email2" type="text"
												onkeyup="checkNumber1();"> <select
												title="이메일 도메인 선택" name="emailprovidor"
												onchange="this.form.email2.value=this[this.selectedIndex].value;">
												<option value="" selected="selected">직접입력</option>
												<option value="naver.com">네이버</option>
												<option value="nate.com">네이트</option>
												<option value="hanmail.net">다음</option>
												<option value="hotmail.com">핫메일</option>
												<option value="yahoo.co.kr">야후</option>
											</select>
										</div>
										
									</div>
								</div>
								<div class="row" style="margin: 0px auto; width: 600px;">
								<div class="form-group submitLine forMbileAppFloat" style="border-top: 0px; width: 465px; margin: 0px auto; margin-bottom: 40px;">
											<input type="submit" value="비밀번호 찾기" name='submit'
												class="btn btn-lg btn-primary btn_mobileAppFloat"><input
												type="reset" id="button" value="다시작성"
												class="btn btn-lg btn-primary btn_mobileAppFloat"> 
										</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div></div>
	<footer>
		<jsp:include page="../footer.jsp"/>
	</footer>
</body>
</html>