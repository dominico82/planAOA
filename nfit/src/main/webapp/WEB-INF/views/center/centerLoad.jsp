<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="shortcut icon" href="resources/images/n-1x-170x128.jpg" type="image/x-icon">
<title>Insert title here</title>
</head>
<style>
body{
	opacity:0.6;
	left: 0;
	top: 0;
	z-index: 80;
	background-color: black;
}
#wait{
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	z-index:100;
	color:white;
}
</style>
<script>
$(document).ready(function(){
	$(document).ajaxStart(function(){
		$("#wait").css("display","block");
	});

	$.ajax({
		url:"centerPage.do",
		success: function(result){
			window.location.href="centerPage.do";
		}
	});
});
</script>
<body>
<div id="wait""><img src='resources/images/pageloader.gif' width="64" height="64" /><br>Loading..</div>
</body>
</html>