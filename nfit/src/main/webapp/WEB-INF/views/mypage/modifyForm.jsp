<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/modifyForm.css"/>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<script>
function checkPwd(){
	var pw1 = document.getElementById('password').value;
	var pw2 = document.getElementById('password2').value;
	var p1 = document.getElementById('check_pwd');
	  if(pw1 != pw2){
		  p1.innerHTML = '<h4 style = "color:red;">비밀번호를 동일하게 입력해주세요~</h4>';
	  }else if(pw1 == pw2){
		  p1.innerHTML = '<h4 style = "color:blue;">비밀번호가 일치합니다!</h4>'; 
	}
}
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
<script type="text/javascript">
function checkValue() {
	var form=document.join
	if(form.member_pwd.length<6){
		alert("6글자 이상 입력해주세요.");
		return false;
	}
	if(form.idDupliction.value!="idCheck"){
		alert("아이디 중복체크를 해 주세요.");
		return false;
	}
	if (!form.member_sex.value) {
		alert("성별을 선택해 주세요");
		return false;
	}
	if(!isNaN(form.member_name.value)){
		alert("이름은 문자만 입력가능합니다.");
		return false;
	}
}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample2_address').value = fullAddr;
                document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%'
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 460; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</head>
<body>
<div class="wrap">
	<div class="container">
		<div class="mypageWrap">
			<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8" id="inner_top">
					<div class="editMyInfo">
						<h3>회원정보 수정</h3>
						<form class="memberForm" name="modify_form" onsubmit="return checkValue()" action="modifyGo.do" method="post">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="password">비밀번호</label>
										<input type="password" class="form-control" id="password" placeholder="비밀번호" name="member_pwd">
									</div>
									<div class="form-group">
										<label for="password2">비밀번호 다시 입력</label>
										<input type="password" class="form-control" id="password2" placeholder="비밀번호를 한번 더 입력" name="password2" onkeyup="checkPwd()">
										<div id="check_pwd"></div>
									</div>
									<div class="form-group">
										<label for="email">이메일</label>
										<input type="email" class="form-control" id="email" placeholder="이메일" value="${dto.member_email}" name="member_email">
									</div>
									<div class="form-group">
										<label>성별</label>
										&nbsp;&nbsp;&nbsp;
										<label class="radio-inline male">
											<input type="radio" name="member_sex" value=남자 checked>
												<i class="fa fa-mars"></i>
												남자
										</label>
										<label class="radio-inline female">
											<input type="radio" name="member_sex" value=여자 checked>
												<i class="fa fa-venus"></i>
												여자
										</label>
									</div>
									<div class="form-group">
											<label>휴대폰 번호</label>
										<div class="input-group">
											<input type="tel" class="form-control" placeholder="휴대폰 번호를 입력하세요" value="${dto.member_tel}" name="member_tel" style="width: 400px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										</div>
									</div>
									<div class="form-group">
										<label>키, 몸무게</label>
										<div class="input-group">
											<input type="text" class="form-control" value="${dto.member_tall}cm" name="member_tall" style="width: 400px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'><br>
											<input type="text" class="form-control" value="${dto.member_weight}kg" name="member_weight" style="width: 400px;" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>생년월일</label>
										<div class="form-inline birthday">
											<select class="form-control" name="birth_year">
												<option>년도</option>
												<option value="2016">2016 년</option>
												<option value="2015">2015 년</option>
												<option value="2014">2014 년</option>
												<option selected value="2013">2013 년</option>
												<option value="2012">2012 년</option>
												<option value="2011">2011 년</option>
											</select>
											<select class="form-control" name="birth_month">
												<option>월</option>
												<option value="6">6 월</option>
												<option value="5">5 월</option>
												<option value="4">4 월</option>
												<option value="3">3 월</option>
												<option selected value="2">2 월</option>
												<option value="1">1 월</option>
											</select>
											<select class="form-control" name="birth_day">
												<option>일</option>
												<option value="13">13 일</option>
												<option value="12">12 일</option>
												<option value="11">11 일</option>
												<option selected value="10">10 일</option>
												<option value="9">9 일</option>
												<option value="8">8 일</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label>주소</label>
										<div class="input-group postNumber">
											<input type="text" id="sample2_postcode" placeholder="우편번호">
											<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" id="sample2_address" placeholder="한글주소">
											<input type="text" id="sample2_addressEnglish" placeholder="영문주소">
										</div>
										<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
											<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
										</div>
									</div>
									<div class="form-group">
										<label>회사명</label>
										<input type="text" class="form-control" placeholder="회사 이름을 입력하세요" name="company_name">
									</div>
									<div class="panel panel-default">
											<div class="panel-heading">
												<h3 class="panel-title">마케팅 정보 수신동의</h3>
											</div>
											<div class="panel-body">
												<label>중요한 알림 및 각종 혜택 알림을 수신합니다.</label>
												<div>
													<label class="checkbox-inline">
														<input type="checkbox" name="chk_sms" value="y">SMS
													</label>
													<label class="checkbox-inline">
														<input type="checkbox" name="chk_sms" value="y">이메일
													</label>
												</div>
											</div>
										</div>
								</div>
							</div>
							<div class="form-group submitLine forMbileAppFloat">
								<button type="submit" class="btn btn-lg btn-primary btn_mobileAppFloat">
									<i class="fa fa-check"></i>저장하기
								</button>
								<button type="button" class="btn btn-sm btn-link" href="">
									<i class="fa fa-check"></i>탈퇴신청
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>















































