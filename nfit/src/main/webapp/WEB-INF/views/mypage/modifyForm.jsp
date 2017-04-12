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
</head>
<body>
<div class="wrap">
	<div class="container">
		<div class="mypageWrap">
			<div class="row">
				<div class="col-lg-10 col-md-9 col-sm-8" id="inner_top">
					<div class="editMyInfo">
						<h3>회원정보 수정</h3>
						<form class="memberForm" name="modify_form" onsubmit="return checkValue()">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="password">비밀번호</label>
										<input type="password" class="form-control" id="password" placeholder="비밀번호" name="password1">
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
											<input type="radio" name="member_sex" value="M" checked>
												<i class="fa fa-mars"></i>
												"남성" 
										</label>
										<label class="radio-inline female">
											<input type="radio" name="member_sex" value="F" checked>
												<i class="fa fa-venus"></i>
												"여성" 
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
											<input type="text" class="form-control" placeholder="우편번호" readonly name="user_post" id="user_post">
											<span class="input-group-btn">
												<button type="button" class="btn btn-default" onclick="get_post();">
												우편번호 검색</button>
											</span>
											<input type="text" class="form-control" placeholder="주소" readonly name="user_addr1" id="user_addr1">
										</div>
									</div>
									<div>
										<input type="text" class="form-control" placeholder="상세주소를 입력하세요" name="user_addr2" id="user_addr2" value="${dto.member_addr}">
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















































