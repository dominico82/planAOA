<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	var form=document.authenform;
	var authNum=${authNum};
	if(!form.authnum.value){
		alert("인증번호를 입력하세요");
		return false;
	}
	if(form.authnum.value!=authNum){
		alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요");
		return false;
	}
	if(form.authnum.value==authNum){
		alert("인증완료");
		opener.document.userinput.mailCheck.value="인증완료";
		self.close();
	}
}
</script>
</head>
<body>
	<h3>인증번호 7자리를 입력하세요</h3>
	<div>
		<form method="post" name="authenform" onsubmit="return check();">
			<input type="text" name="authnum"><br/>
			<input type="submit" value="인증">
		</form>
	</div>
</body>
</html>