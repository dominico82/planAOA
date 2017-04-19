<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>만족스러운 피트니스 Nfit</title>
		<%@include file="../header.jsp" %>
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		
		
	    <!---strat-slider---->
	    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
	    <!-----768px-menu----->
		
		<link type="text/css" rel="stylesheet" href="resources/css/coin.css" />

		<!-----//768px-menu----->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript" src="resources/js/pwstabs.js"></script>
<script type="text/javascript" src="resources/js/coin.js"></script>
<script>
var userId="${dto.member_id}";
var userName="${dto.member_name}";
var userEmail="${dto.member_email}";
var userTel="${dto.member_tel}";
var userAddr="${dto.member_addr}";
</script>
	</head>
	<body>
	<br><br><br><br><br>
	
	<section>
		<article>
		<div style="margin-top:100px;">결제를 하시면 좋아요 !! 굿굿</div>
		</article>
	</section>
			<%@include file="../footer.jsp" %>
			<!----//End-content--->
		<!---//End-wrap---->
	</body>
</body>
</html>