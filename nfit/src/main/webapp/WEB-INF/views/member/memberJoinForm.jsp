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
<link type="text/css" rel="Stylesheet" href="resources/css/Join.css" />
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

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
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
					yearRange : 'c-99:c+0'
				});
	});
	$(document).ready(function(){
		$('#id').css("ime-mode", "active");
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
<script>
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
</script>
<script type="text/javascript">
	function checkValue() {

		if(document.join.member_id.length<18){
			alert("6글자 이상 입력해주세요.");
			return false;
		}
		if (document.join.member_pwd.length < 6) {
			alert("6글자 이상 입력해주세요.");
			return false;
		}
		if (!document.join.member_pwd.value) {
			alert("비밀번호를 입력하세요.");
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
<style type="text/css"> 
.input[type=text] { 
-webkit-ime-mode:active; 
-moz-ime-mode:active; 
-ms-ime-mode:active; 
ime-mode:active; 
} 
</style> 
</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<div style="margin-top: 200px; margin-bottom: 200px;">
		<form id="formmain" action="memberJoin.do" method="post" name="join"
			onsubmit='return checkValue();'>
			<fieldset>
				<legend>필수 입력정보</legend>
				<ol>
					<li><label for="userid">아이디</label> <input id="input"
						name="member_id" type="text" required="required" autofocus
						maxlength="12" onkeydown="idCheck();" onkeyup="checkNumber();"
						placeholder="최소 6자 이상" pattern="[A-Za-z0-9]*">
						<div id="idCheck">
							<div id="idCheckResult"></div>
						</div>
						<!-- auto focus: 처음 위치 지정 --></li>
					<li><label for="pwd1">비밀번호</label> <input id="input"
						name="member_pwd" type="password" maxlength="12"
						placeholder="비밀번호 6~12자 이내로 작성바랍니다."></li>
					<li><label for="pwd2">비밀번호확인</label> <input id="input"
						name="member_pwd2" type="password" maxlength="12"></li>
					<li><label>이름</label><input type="text" name="member_name"
						id="input" required="required" onkeydown="checkNumber();"></li>
					<li><label>성별</label> <input type="radio" name="member_sex"
						id="member_sex-0" value="남자">남자 <input type="radio"
						name="member_sex" id="member_sex-1" value="여자">여자</li>
					<li><label>주소</label><input type="text" id="sample3_postcode"
						placeholder="우편번호" required="required" disabled="disabled">
						<input type="button" onclick="sample3_execDaumPostcode()"
						value="우편번호 찾기"><br>

						<div id="wrap"
							style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
							<img
								src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
								id="btnFoldWrap"
								style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
								onclick="foldDaumPostcode()" alt="접기 버튼">
						</div> <input type="text" id="sample3_address" class="d_form large"
						placeholder="우편번호 찾기 후 세부주소작성" name="member_addr"
						required="required" onkeydown="checkNumber();"></li>
				</ol>
				<legend>추가 입력정보</legend>
				<ol>
					<li><label>전화번호</label><input type="text" name="member_tel"
						id="tel2" maxlength="11" onkeydown='return onlyNumber(event)'
						onkeyup='removeChar(event)' style='ime-mode: disabled;'
						placeholder="-없이 숫자만 입력가능합니다." /></li>

					<li><label>생년월일</label> <input type="text" name="member_birth"
						id="datepicker" placeholder="클릭하세요"
						onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
						style='ime-mode: disabled;' /></li>

					<li><label>이메일</label> <input type="text" name="email1"
						value=" " onfocus="this.value='';" placeholder="이메일"> @ <input
						type="text" name="email2" value="" disabled> <select
						name="email" onchange="email_change()">
							<option value=" ">선택하세요</option>
							<option value="9">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="outlook.com">outlook.com</option>

					</select></li>

					<li><label>신장</label> <input type="text" name="member_tall"
						maxlength="3" placeholder="숫자만 입력하세요" id="onlyNumber" value="0"
						onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
						style='ime-mode: disabled;' />kg</li>

					<li><label>체중</label> <input type="text" name="member_weight"
						value="0" onkeydown='return onlyNumber(event)'
						onkeyup='removeChar(event)' style='ime-mode: disabled;'
						maxlength="3" placeholder="숫자만 입력하세요" />cm</li>

				</ol>
			</fieldset>
			<input type="submit" value="가입" name='submit'><input
				type="reset" id="button" value="다시작성"> <input type="button"
				id="button" onclick="location.href='index.do'" value="메인화면">
		</form>
	</div>

	<footer>
		<%@include file="../footer.jsp"%>
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