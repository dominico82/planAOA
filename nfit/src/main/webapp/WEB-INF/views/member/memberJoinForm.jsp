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
<!---strat-slider---->
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/slider-style.css" />
<script type="text/javascript"
	src="resources/js/modernizr.custom.28468.js"></script>
<!---//strat-slider---->
<!---start-login-script--->
<!---//End-login-script--->
<!-----768px-menu----->
<link type="text/css" rel="stylesheet"
	href="resources/css/jquery.mmenu.all.css" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/modifyForm.css" />
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNmaeMin : [ '일', '월', '화', '수', '목', '금', '토', ],
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					yearRange : 'c-40:c+30'
				});
	});
</script>
<script type="text/javascript">
	function email_change() {
		if (document.join.email.options[document.join.email.selectedIndex].value == ' ') {
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
<script type="text/javascript">
	function checkValue() {

		if (document.join.member_pwd.value.size < 6) {
			alert("6글자 이상 입력해주세요.");
			return false;
		}
		if (document.join.member_pwd.value != document.join.member_pwd2.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		if (!form.member_sex.value) {
			alert("성별을 선택해 주세요");
			return false;
		}
		if (!isNaN(form.member_name.value)) {
			alert("이름은 문자만 입력가능합니다.");
			return false;
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

	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	function emailCheck(){
		var a=document.join.email1.value;
		var b=document.join.email2.value;
		finemail=a+"@"+b;
		url="emailAuth.do?email="+finemail;
			window.open(url,"","width=350,height=150,scrollbars=1");
		}
</script>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<script>
	var checkFirst = false;
	var lastKeyword = '';
	var loopSendKeyword = false;

	function idCheck() {
		if (checkFirst == false) {
			setTimeout("sendId();", 500);
			loopSendKeyword = true;
		}
		checkFirst = true;
	}
	function sendId() {
		if (loopSendKeyword == false)
			return;
		var userId = document.join.member_id.value;
		if (userId == '') {
			lastKeyword = '';
			hide('idCheck');
		} else if (userId != lastKeyword) {
			lastKeyword = userId;
			if (userId != '') {
				var param = "member_id=" + encodeURIComponent(userId);
				sendRequest("idCheckResult.do", param, displayResult, 'POST');
			} else {
				hide('idCheck');
			}
		}
		setTimeout("sendId();", 500);
	}
	function displayResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				if (result == null && result.equals('')) {
					hide('idCheck');
				} else {
					var msg = '';
					msg = result;
					var idView = document.getElementById('idCheckResult');
					idView.innerHTML = msg;
					show('idCheck');
				}
			} else {
				alert("에러발생: " + XHR.status);
			}
		}
	}
	function show(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.style.display = '';
		}
	}
	function hide(elementId) {
		var element = document.getElementById(elementId);
		if (element) {
			element.style.display = 'none';
		}
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<div class="wrap">
		<div class="container" style="margin: 0px auto; width: 600px;">
			<div class="mypageWrap">
				<div class="row">
					<div class="col-lg-10 col-md-9 col-sm-8" id="inner_top">
						<div class="editMyInfo" style="margin-top: 120px;">
							<h3>회원가입</h3>

							<form class="memberForm" action="memberJoin.do" method="post"
								name="join" onsubmit='return checkValue();'
								style="margin-top: 35px;">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="userid">*아이디</label> <input id="input"
												name="member_id" type="text" required="required" autofocus
												maxlength="12" onkeydown="idCheck();"
												onkeyup="checkNumber1();" placeholder="아이디를 입력해주세요"
												class="form-control">
											<div id="idCheck">
												<div id="idCheckResult"></div>
											</div>
										</div>
										<div class="form-group">
											<label for="password">*비밀번호</label> <input id="input"
												name="member_pwd" type="password" maxlength="12"
												class="form-control" required="required">
										</div>
										<div class="form-group">
											<label for="password2">*비밀번호확인</label> <input id="input"
												name="member_pwd2" type="password" maxlength="12"
												class="form-control" required="required">
										</div>
										<div class="form-group">
											<label for="name">*이름</label><input type="text"
												name="member_name" id="input" required="required"
												onkeydown="checkNumber();" class="form-control">
										</div>
										<div class="form-group">
											<label>*성별</label> &nbsp;&nbsp;&nbsp; <label
												class="radio-inline male"> <input type="radio"
												name="member_sex" id="male" value="남자"> <i
												class="fa fa-mars"></i> 남자
											</label> <label class="radio-inline female"> <input
												type="radio" name="member_sex" value="여자" id="female">
												<i class="fa fa-venus"></i> 여자
											</label>
										</div>
										<div class="form-group">
											<label>*주소</label>
											<div class="input-group postNumber">
												<input type="text" id="sample3_postcode" placeholder="우편번호"
													required="required" disabled="disabled"> <input
													type="button" onclick="sample3_execDaumPostcode()"
													value="우편번호 찾기"><br>
											</div>
											<div id="wrap"
												style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
												<img
													src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
													id="btnFoldWrap"
													style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
													onclick="foldDaumPostcode()" alt="접기 버튼">
											</div>
											<input type="text" id="sample3_address" class="form-control"
												placeholder="우편번호 찾기 후 세부주소작성" name="member_addr"
												required="required" style="margin-top: 10px;">
										</div>
										<div class="form-group">
											<label>전화번호</label><input type="text" name="member_tel"
												id="tel2" maxlength="11"
												onkeydown='return onlyNumber(event)'
												onkeyup='removeChar(event)' style='ime-mode: disabled;'
												placeholder="-없이 숫자만 입력가능합니다." class="form-control" />
										</div>
										<div class="form-group">
											<label>생년월일</label> <input type="text" name="member_birth"
												id="datepicker" placeholder="클릭하세요"
												onkeydown='return onlyNumber(event)'
												onkeyup='removeChar(event)' style='ime-mode: disabled;'
												class="form-control" />
										</div>
										<div class="form-group">
											<label>이메일</label><br> <input id="customerEmailLocal"
												name="email1" type="text" onkeyup="checkNumber1();" required="required">
											@ <input title="이메일 도메인 입력" name="email2" type="text"
												onkeyup="checkNumber1();" required="required"> <select
												title="이메일 도메인 선택" name="emailprovidor"
												onchange="this.form.email2.value=this[this.selectedIndex].value;">
												<option value="" selected="selected">직접입력</option>
												<option value="naver.com">네이버</option>
												<option value="nate.com">네이트</option>
												<option value="hanmail.net">다음</option>
												<option value="hotmail.com">핫메일</option>
												<option value="yahoo.co.kr">야후</option>
											</select> <br> 
											<input type="text" name="mailCheck" style="border: 0px;" readonly="readonly" required="required">
											<div align="right">
											<input type="button" value="이메일 인증" onclick='emailCheck();'>
											</div>
										</div>
										<div class="form-group">
											<label>신장</label> <input type="text" name="member_tall"
												maxlength="3" placeholder="숫자만 입력하세요" id="onlyNumber"
												value="0" onkeydown='return onlyNumber(event)'
												onkeyup='removeChar(event)' style='ime-mode: disabled;'
												class="form-control" />
										</div>
										<div class="form-group">
											<label>체중</label> <input type="text" name="member_weight"
												value="0" onkeydown='return onlyNumber(event)'
												onkeyup='removeChar(event)' style='ime-mode: disabled;'
												maxlength="3" placeholder="숫자만 입력하세요" class="form-control" />
										</div>

									</div>
								</div>
								<div class="row" style="margin: 0px auto; width: 600px;">
									<div class="form-group submitLine forMbileAppFloat"
										style="border-top: 0px; width: 525px; margin: 0px auto; margin-bottom: 40px;">
										<input type="submit" value="가입" name='submit'
											class="btn btn-lg btn-primary btn_mobileAppFloat"><input
											type="reset" id="button" value="다시작성"
											class="btn btn-lg btn-primary btn_mobileAppFloat"> <input
											type="button" id="button" onclick="location.href='index.do'"
											value="메인화면"
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


	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}

		function sample3_execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = data.address; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 기본 주소가 도로명 타입일때 조합한다.
							if (data.addressType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample3_address').value = fullAddr;

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_wrap.style.display = 'none';

							// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							document.body.scrollTop = currentScroll;
						},
						// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
						onresize : function(size) {
							element_wrap.style.height = size.height + 'px';
						},
						width : '100%',
						height : '100%'
					}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}
	</script>
</body>
</html>