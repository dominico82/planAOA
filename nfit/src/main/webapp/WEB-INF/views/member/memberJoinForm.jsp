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
$(function(){
	$("#datepicker").datepicker({
		dateFormat:'yy-mm-dd',
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNmaeMin:['일','월','화','수','목','금','토',],
		changeMonth:true,
		changeYear:true,
		showMonthAfterYear:true,
		yearRange:'c-99:c+0'
	});
});

</script>
<script type="text/javascript">
function email_change(){
	if(document.join.email.options[document.join.email.selectedIndex].value == '0'){
	 document.join.email2.disabled = true;
	 document.join.email2.value = "";
	}
	if(document.join.email.options[document.join.email.selectedIndex].value == '9'){
	 document.join.email2.disabled = false;
	 document.join.email2.value = "";
	 document.join.email2.focus();
	} else{
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
	<form id="formmain" action="memberJoin.do" method="post" name="join">
		<fieldset>
			<legend>필수 입력정보</legend>
			<ol>
				<li><label for="userid">아이디</label> <input id="input"
					name="member_id" type="text" required="required" autofocus
					maxlength="12" /> <!-- auto focus: 처음 위치 지정 --></li>
				<li><label for="pwd1">비밀번호</label> <input id="input"
					name="member_pwd" type="password" required="required"
					maxlength="12" /></li>
				<li><label for="pwd2">비밀번호확인</label> <input id="input"
					name="pwd2" type="password" required="required" maxlength="12" /></li>
				<li><label>이름</label><input type="text" name="member_name"
					id="input" required="required"></li>
				<li><label>성별</label> <input type="radio" name="member_sex"
					id="member_sex-0" value="남자">남자 <input type="radio"
					name="member_sex" id="member_sex-1" value="여자">여자</li>
				<li><label>주소</label><input type="text" id="sample3_postcode"
					placeholder="우편번호"> <input type="button"
					onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>

					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img
							src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div> <input type="text" id="sample3_address" class="d_form large"
					placeholder="주소" name="member_addr"></li>
			</ol>
			<legend>추가 입력정보</legend>
			<ol>
				<li><label>전화번호</label> <select name="tel1">
						<option value="010">010</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select>- <input type="text" name="tel2" id="tel2" maxlength="4" />- <input
					type="text" name="tel3" id="tel3" maxlength="4" /></li>
					
				<li><label>생년월일</label> <input type="text" name="member_birth"
					id="datepicker" placeholder="클릭하세요" /></li>
					
				<li><label>이메일</label> <input type="text" name="email1"
					value="이메일" onfocus="this.value='';"> @ <input type="text"
					name="email2" value="" disabled> <select name="email"
					onchange="email_change()">
						<option value="0">선택하세요</option>
						<option value="9">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="outlook.com">outlook.com</option>
						
				</select></li>
				
				<li><label>신장</label> <input type="text" name="member_tall"
					maxlength="3" max="3" placeholder="숫자만 입력하세요" id="onlyNumber"/>kg</li>
					
				<li><label>체중</label> <input type="number" name="member_weight"
					maxlength="3" placeholder="숫자만 입력하세요" />cm</li>
					
			</ol>
		</fieldset>

		<div>
			<input type="submit" id="button" value="가입"><input
				type="reset" id="button" value="다시작성"> <input type="button"
				id="button" onclick="location.href='index.do'" value="메인화면">
		</div>

	</form>

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