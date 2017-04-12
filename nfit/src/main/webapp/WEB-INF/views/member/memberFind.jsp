<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div
		class="col-lg-offset-3 col-lg-6 col-md-offset-1 col-md-10 col-sm-offset-0 col-sm-12 memberBox loginBox">
		<h2>
			<span><b>아이디 찾기</b></span> <span><small>걱정마세요! 잊어버린
					아이디를 찾아드려요.</small></span>
		</h2>

		<form class="memberForm" action="memberIdfind.do" method="post">
			<div class="form-group">
				<label>이름</label>
				<div class="floatlabel-wrapper" style="position: relative">
					<label for="user_name" class="label-floatlabel  "
						style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">가입하신
						분의 이름을 입력하세요</label><input name="member_name" id="user_name" value=""
						type="text" class="form-control" placeholder="가입하신 분의 이름을 입력하세요"
						style="padding-top: 0px; transition: all 0.1s ease-in-out;">
				</div>
			</div>
			<div class="form-group">
				<label>이메일</label>
				<div class="floatlabel-wrapper" style="position: relative">
					<label for="user_email" class="label-floatlabel  "
						style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">이메일
						주소를 입력하세요</label><input name="member_email" id="user_email" value=""
						type="email" class="form-control" placeholder="이메일 주소를 입력하세요"
						style="padding-top: 0px; transition: all 0.1s ease-in-out;">
				</div>
			</div>
			<div class="form-group submitLine">
				<button type="submit" class="btn btn-signup">
					<i class="fa fa-search"></i> 아이디를 찾아주세요!
				</button>
			</div>
		</form>
		<hr>
		<h2>
			<span><b>비밀번호 찾기</b></span> <small>저런.. 비밀번호가 생각나지 않으세요?</small>
		</h2>


		<form class="memberForm findPWForm" action="memberPwfind.do"
			method="post">
			<div class="form-group">
				<label>아이디</label>
				<div class="floatlabel-wrapper" style="position: relative">
					<label for="user_id" class="label-floatlabel  "
						style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">아이디를
						입력하세요</label><input name="member_id" id="user_id" value="" type="text"
						class="form-control" placeholder="아이디를 입력하세요"
						style="padding-top: 0px; transition: all 0.1s ease-in-out;">
				</div>
			</div>
			<div class="form-group">
				<label>이름</label>
				<div class="floatlabel-wrapper" style="position: relative">
					<label for="user_name" class="label-floatlabel  "
						style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">가입하신
						분의 이름을 입력하세요</label><input name="member_name" id="user_name" value=""
						type="text" class="form-control" placeholder="가입하신 분의 이름을 입력하세요"
						style="padding-top: 0px; transition: all 0.1s ease-in-out;">
				</div>
			</div>

			<!-- 이메일, 전화번호로 찾기 선택 탭 -->
			<ul class="nav nav-tabs findPWvia" role="tablist">
				<li role="presentation" class="active"><a
					href="#findPW_via_email" aria-controls="findPW_via_email"
					role="tab" data-toggle="tab" class="btn-sm">이메일로 찾기</a></li>
				<li role="presentation"><a href="#findPW_via_phoneN"
					aria-controls="findPW_via_phoneN" role="tab" data-toggle="tab"
					class="btn-sm">휴대전화번호로 찾기</a></li>
			</ul>

			<div class="tab-content">
				<!-- 이메일로 찾기 -->
				<div role="tabpanel" class="tab-pane fade in active"
					id="findPW_via_email">
					<div class="form-group">
						<label class="sr-only">이메일</label>
						<div class="floatlabel-wrapper" style="position: relative">
							<label for="user_email" class="label-floatlabel  "
								style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">이메일
								주소를 입력하세요</label><input name="member_email" id="user_email" value=""
								type="email" class="form-control" placeholder="이메일 주소를 입력하세요"
								style="padding-top: 0px; transition: all 0.1s ease-in-out;">
						</div>
						<p class="help-block">
							<span class="text-info">가입시 입력하신 이메일 주소를 입력해주세요.<br>
								이메일 주소로 임시 비밀번호를 발송합니다.
							</span>
						</p>
					</div>

				</div>
				<!-- /.tabpanel -->
				<!-- 휴대전화번호로 찾기 -->
				<div role="tabpanel" class="tab-pane" id="findPW_via_phoneN">
					<label class="sr-only">휴대 전화번호</label>
					<div class="floatlabel-wrapper" style="position: relative">
						<label for="phone" class="label-floatlabel  "
							style="position: absolute; top: 0px; left: 0px; display: none; opacity: 0; font-size: 11px; font-weight: 600; color: rgb(153, 153, 153); transition: all 0.1s ease-in-out;">휴대전화번호를
							입력하세요.</label><input name="phone" id="phone" value="" type="tel"
							class="form-control" placeholder="휴대전화번호를 입력하세요."
							style="padding-top: 0px; transition: all 0.1s ease-in-out;">
					</div>
					<p class="help-block">
						<span class="text-info">가입시 입력하신 전화번호를 – (하이픈) 없이 숫자만
							입력해주세요.<br> 입력한 정보가 맞다면 휴대전화 번호로 임시 비밀번호를 발송합니다.
						</span>
					</p>
				</div>

			</div>
			<!-- /.tab-content -->

			<div class="form-group submitLine">
				<button type="submit" class="btn btn-signup">
					<i class="fa fa-search"></i> 비밀번호를 찾아주세요!
				</button>
			</div>
		</form>

	</div>
</body>
</html>