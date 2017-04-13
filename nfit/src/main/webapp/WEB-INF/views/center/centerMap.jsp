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
	  <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=edd938c4fc341b07f90ed69064de3f92&libraries=services"></script>
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
			<table class="table table-bordered" id="table">
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
			<% int cnt=0; %>
			<c:forEach var="dto" items="${centerList}" begin="0"  step="1" varStatus="status">
			<c:url var="centerListUrl" value="centerDetail.do">
			<c:param name="co_idx">${dto.co_idx}</c:param>
			</c:url>
			<tr>
			<td>${dto.co_idx }</td>
			<td>
			<a href="${centerListUrl}" id="co_name_${status.index}">${dto.co_name}</a>
			<input type="hidden" id="co_address_${status.index}" value="${dto.co_address}">
			</td>
			</tr>
			<%cnt++;%>
			</c:forEach>
			</tbody>
			</table>
			<input type="hidden" value="<%=cnt%>" id="count">
			</div>
			<div class="col-sm-8">
				<h3>map area</h3>
				<div id="map" style="width: 100%; height:800px;"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	/*test*/
	var count = $("#count").val();
	var coName =[];
	var addr=[];
	for(var i=0; i<count;i++){
		coName[i]=document.getElementById('co_name_'+i).innerHTML;
		addr[i]=document.getElementById('co_address_'+i).value;
		console.log(coName[i]);
		console.log(addr[i]);
		getMarker(addr[i], name[i]);
	}
	/*geolocation 구현*/
			var mapContainer = document.getElementById('map');
			var mapOption = {
				center : new daum.maps.LatLng(37.566535, 126.97796919999999),
				level : 3
			};
			var map = new daum.maps.Map(mapContainer, mapOption);
			
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				var lat = position.coords.latitude;
				var lon = position.coords.longitude;
				var locPosition = new daum.maps.LatLng(lat, lon);
				window.alert('현재위치로 이동합니다.');
				goCenter(locPosition)
			});
		}else{
			var locPosition = new daum.maps.LatLng(33.450701, 126.570667);
			window.alert('현재 위치를 찾을 수 없습니다.');
		}
		function goCenter(locPosition){
			map.setCenter(locPosition);
		}
		function getMaker(addr, name){
			var geocoder = new daum.maps.services.Geocoder();
			geocoder.addr2coord(addr, function(status, result) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div>'+name+'</div>'
			        });
			        infowindow.open(map, marker);
			    } 
			});    
		}
		
	/*주소 불러오기*/
	</script>
</body>
</html>