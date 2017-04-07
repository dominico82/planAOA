<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=edd938c4fc341b07f90ed69064de3f92"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
33.450701, 126.570667
<div id="map" style="width:100%;height:350px;"></div>
<script type="text/javascript">
var mapContainer = document.getElementById('map');
var mapOption = {center: new daum.maps.LatLng(33.450701, 126.570667),level:3};
var map = new daum.maps.Map(mapContainer, mapOption);

</script>
<h2>center map</h2>
</div>
</body>
</html>