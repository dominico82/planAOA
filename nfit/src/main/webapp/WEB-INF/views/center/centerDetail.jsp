<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=edd938c4fc341b07f90ed69064de3f92"></script>
<title>Insert title here</title>
</head>
<style>
div {
	border: 1px solid black;
}
</style>

<body>
	<div class="container-fluid">
	<div class="row" id="menu_bar">
	<h2>menu bar</h2>
	</div>
		<c:set var="dtos" value="${dto}" />
		<div class="row">
			<h2>center title</h2>
			<table class="table table-bordered">
			<tr><td>${dtos.co_name}</td></tr>
			<tr><td>${dtos.co_address}</td></tr>
			<tr><td>${dtos.co_phone}</td></tr>
			<tr><td>지금까지 이용: ${dtos.co_usecount}</td></tr>
			</table>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<h2>center detail</h2>
				<div id="content">
				<c:set var="contentlist_set" value="${contentlist}"></c:set>
				<table class="table">
				<caption>이용상품</caption>
				<c:if test="${empty contentlist_set }">
				<tr><td>이용상품 없음</td></tr>
				</c:if>
				<c:forEach var="con" items="${contentlist_set}">
				<tr>
				<td>${con.content_coin}</td>
				<td>${con.content1}</td>
				<td>${con.content2}</td>
				<td>${con.content3}</td>
				<td>${con.content4}</td>
				<td>${con.content5}</td>
				<td>${con.content6}</td>
				</tr>
				</c:forEach>
				</table>
				<hr>
				</div>
				<div id="co_avail">
				<table class="table">
				<caption>이용가능</caption>
				<tr><td>${dtos.co_avail }</td></tr>
				</table>
				<hr>
				</div>
				<div id="usetime_and_extra">
				<c:set var="list" value="${timelist}"/>
				<table class="table">
				<caption>이용시간</caption>
				<c:if test="${empty list }">
				<tr><td>없음</td></tr>
				</c:if>
				<c:forEach var="usetime" items="${list}">
				<tr>
				<th>${usetime.usetime_day}</th>
				<td>${usetime.usetime_time}</td>
				</tr>
				</c:forEach>
				</table>
				<table class="table">
				<caption>부가서비스</caption>
				<tr><td>${dtos.co_extra}</td></tr>
				</table>
				<hr>
				</div>
				<div id="phone_and_address">
				<table class="table">
				<caption>주소, 전화번호</caption>
				<tr><td>${dtos.co_address }</td></tr>
				<tr><td>${dtos.co_phone }</td></tr>
				</table>
				</div>
			</div>
			<div class="col-sm-6">
				<h2>center photo</h2>
				<div id="photos">
				<span>photos</span>
				</div>
				<div id="mapping">
							<div id="map" style="width: 100%; height: 600px;"></div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667),
		level : 3
	};
	var map = new daum.maps.Map(mapContainer, mapOption);
</script>
</body>
</html>