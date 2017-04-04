<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<header>
		<%@include file="../header.jsp"%>
	</header>
	<form class="form-horizontal">
		<fieldset>

			<!-- Form Name -->
			<legend>회원가입</legend>

			<!-- Select Multiple -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="selectmultiple">Select
					Multiple</label>
				<div class="col-md-4">
					<select id="selectmultiple" name="selectmultiple"
						class="form-control" multiple="multiple">
						<option value="1">Option one</option>
						<option value="2">Option two</option>
					</select>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_id">ID</label>
				<div class="col-md-4">
					<input id="member_id" name="member_id" type="text"
						placeholder="아이디를 입력해주세요" class="form-control input-md">

				</div>
			</div>

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_pwd">비밀번호</label>
				<div class="col-md-4">
					<input id="member_pwd" name="member_pwd" type="password"
						placeholder="비밀번호를 입력해주세요" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_name">이름</label>
				<div class="col-md-4">
					<input id="member_name" name="member_name" type="text"
						placeholder="이름을 입력하세요" class="form-control input-md">

				</div>
			</div>

			<!-- Multiple Radios (inline) -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_sex">성별</label>
				<div class="col-md-4">
					<label class="radio-inline" for="member_sex-0"> <input
						type="radio" name="member_sex" id="member_sex-0" value="남"
						checked="checked"> 남
					</label> <label class="radio-inline" for="member_sex-1"> <input
						type="radio" name="member_sex" id="member_sex-1" value="여">
						여
					</label>
				</div>
			</div>

			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_birth">생년월일</label>
				<div class="col-md-2">
					<select id="member_birth" name="member_birth" class="form-control">
						<option value="1">Option one</option>
						<option value="2">Option two</option>
					</select>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="member_email">E-mail</label>
				<div class="col-md-2">
					<input id="member_email" name="member_email" type="text"
						placeholder="이메일을 입력하세요" class="form-control input-md">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Text
					Input</label>
				<div class="col-md-4">
					<input id="textinput" name="textinput" type="text"
						placeholder="placeholder" class="form-control input-md"> <span
						class="help-block">help</span>
				</div>
			</div>

			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="selectbasic">Select
					Basic</label>
				<div class="col-md-4">
					<select id="selectbasic" name="selectbasic" class="form-control">
						<option value="1">Option one</option>
						<option value="2">Option two</option>
					</select>
				</div>
			</div>

			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="selectbasic">Select
					Basic</label>
				<div class="col-md-4">
					<select id="selectbasic" name="selectbasic" class="form-control">
						<option value="1">Option one</option>
						<option value="2">Option two</option>
					</select>
				</div>
			</div>

			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-4 control-label" for=""></label>
				<div class="col-md-4">
					<select id="" name="" class="form-control">
						<option value="1">Option one</option>
						<option value="2">Option two</option>
					</select>
				</div>
			</div>

		</fieldset>
	</form>
	<footer>
		<%@include file="../footer.jsp"%>
	</footer>
</body>
</html>