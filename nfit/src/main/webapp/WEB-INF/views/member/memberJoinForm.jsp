<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Runkeeper Website Template | Home :: w3layouts</title>
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
	    <!---strat-slider---->
	    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="resources/css/slider-style.css" />
		<script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		<!---start-login-script--->
		<script src="resources/js/login.js"></script>
		<!---//End-login-script--->
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<link type="text/css" rel="stylesheet" href="resources/css/coin.css" />
		<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script type="text/javascript" src="resources/js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>
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