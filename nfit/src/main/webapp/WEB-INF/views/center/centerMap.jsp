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
<style>
div {
	border: 1px solid black
}
</style>
</head>
<body>
	33.450701, 126.570667
	<div class="container-fluid">
		<div class="row">
			<h3>menu bar</h3>
		</div>
		<div class="row">
			<div class="col-sm-4">
			<h3>search area</h3>
			<c:set var="centerList" value="${list}"/>
			<table class="table table-bordered">
			<thead>
			<tr>
			<th>co_idx</th>
			<th>co_name</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${empty centerList}">
			<tr>
			<td colspan="2" align="center">no data</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${centerList}">
			<c:url var="centerListUrl" value="centerDetail.do">
			<c:param name="co_idx">${dto.co_idx}</c:param>
			</c:url>
			<tr>
			<td>${dto.co_idx }</td>
			<td><a href="${centerListUrl}">${dto.co_name}</a></td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
			</div>
			<div class="col-sm-8">
				<h3>map area</h3>
				<div id="map" style="width: 100%; height:800px;"></div>
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