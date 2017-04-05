<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사거리</title>
<!-- Bootstrap -->
<link href="../resources/js/bootstrap.js" rel="stylesheet"
	type="text/css" />
<link href="/resources/image/icon/HalfLife.ico" rel="shortcuticon">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="/resources/bootstrap/js/respond.js"></script>

</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<form name="memberJoin" action="memberJoin.do" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>회원가입</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_id">ID</label>
				<div class="col-md-4">
					<input id="member_id" name="member_id" type="text"
						placeholder="아이디를 입력하세요" class="form-control input-md">

				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_pwd">Password</label>
				<div class="col-md-4">
					<input id="member_pwd" name="member_pwd" type="password"
						placeholder="비밀번호를 입력하세요" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_name">이름</label>
				<div class="col-md-4">
					<input id="member_name" name="member_name" type="text"
						placeholder="이름을 입력해주세요" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_addr">주소</label>
				<div class="col-md-4">
					<input id="member_addr" name="member_addr" type="text"
						placeholder="주소입력" class="form-control input-md">

				</div>
			</div>

			<!-- Multiple Radios (inline) -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_sex">성별</label>
				<div class="col-md-4">
					<label class="radio-inline" for="member_sex-0"> <input
						type="radio" name="member_sex" id="member_sex-0" value="남"
						checked="checked"> 남자
					</label> <label class="radio-inline" for="member_sex-1"> <input
						type="radio" name="member_sex" id="member_sex-1" value="여">
						여자
					</label>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_birth">생년월일</label>
				<div class="col-md-4">
					<input type="text" name="member_birth">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_email">E-mail</label>
				<div class="col-md-4">
					<input id="member_email" name="member_email" type="text"
						placeholder="이메일 항목생성 필요" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_tel">연락처</label>
			<input type="text" name="member_tel">
			
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_weight">체중</label>
				<div class="col-md-4">
					<input id="member_weight" name="member_weight" type="text"
						placeholder="varchar2 타입 number형식으로 변환"
						class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_tall">키</label>
				<div class="col-md-4">
					<input id="member_tall" name="member_tall" type="text"
						placeholder="키 입력(varchar2 타입 number형식으로변환)"
						class="form-control input-md">

				</div>
			</div>

				<div class="col-md-8">
					<input type="submit" value="가입">
					<input type="reset" value="다시작성">
				</div>
		

		</fieldset>
	</form>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>