<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <script type="text/javascript" src="https://apis.daum.net/maps/maps3.js?apikey=95b97b04d035d60f73995902d8ae2cd0&libraries=services"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="shortcut icon" href="resources/images/n-1x-170x128.jpg" type="image/x-icon">
<title>Insert title here</title>
<style>
*{
margin: 0px;
padding : 0px;
}
html, body{
height:100%;
}
#margining{
margin-top:100px;
}
#centerListResult{
overflow-y:auto;
}
#center_list_coName_class{
font-size:12px;
}
#centerInfo_list_coClass{
}
#matched {
  background: #00bff0;
  color: #fff;
  padding: 0 2px;
  border-radius: 3px;
}
#map_part{
height:100%;
}
#map{
width: 100%; 
height:100%;
}
#container{
height:100%;
}
#container_row{
height:100%;
}

/*
 div{
border:1px solid black;
} 
 */
 #search-div{
padding: 0 0 0 0;
height:28px;
}
#search-div #search-btn{
width:100%;
height:100%;
margin: 0 0 0 0;
}
#search-div #search_input{
width:100%;
height:100%;
margin: 0 0 0 0;
height:28px;
}
#centerInfo_list_div{
font-size:12px;
}
#centerInfo_list_table{
padding:0 0 0 0;
}
#list-table{
margin:0 0 0 0;
font-size:12px;
} 
#infowindow{
z-index:500;
}
/*업체 백업 테이블*/
 #center_list{
display:none; 
} 
/*업체 서비스 백업 테이블*/
 #content_list{
 display:none;
} 
#centerInfo_list .hiddenCnt{
display:none;
}
#centerInfo{
display:none; 
}
#centerInfo #centerInfo_panel{
position:fixed;
right:15px;
bottom:0px;
z-index:300;
width:320px;
height:0px;
border-radius:8px;
background: #fff;
box-shadow: 1px 5px 10px rgba(0,0,0,.5);
border-top: 10px solid #505256;
padding: 20px;
overflow-y: auto;
max-height: 389px; 
display: block;
}
#centerInfo #centerInfo_panel #close{
display:block;
position:absolute;
right:5px;
top:5px;
width:24px;
height:24px;
text-indent:0;
}
#centerInfo #centerInfo_panel #close #close_icon{
position:absolute;
top:5px;
right:5px;
}

#centerInfo #centerInfo_panel #centerInfo_body #coBtn{
/*
display:none;
*/
margin-top:20px;
}
#centerInfo #centerInfo_panel #centerInfo_body #coAddr{
padding-left: 5px;
margin-top:10px;
}
#centerInfo #centerInfo_panel #centerInfo_body_sub{
overflow-y:auto; 
height:280px;
font-size:12px;
}
#avail_photo{
height:34px;
width:34px;
}
#centerInfo #centerInfo_panel #centerInfo_head #centerInfo_coname{
text-align:center;
}
#wait{
	position:absolute;
	width:100%;
	height:100%;
	padding: 2px;
	z-index:500;
	border:1px solid black;
	display:none;
}
#wait img{
	position:absolute;
	top: 50%;
	left: 50%;
	width:64px;
	height:64px;
}
#infowindows{
max-width:250px;font-size:12px;
}
#infowindows_close{position: absolute;top: 5px;right: 10px;color: #f9022b;width: 17px;height: 17px;
cursor: pointer; font-size:12px;}
#map_zoom{
position:absolute;
bottom:10px;
right:10px;
z-index:500;
width:89%;
text-align:right;
}
#navi-title{
position:absolute;
top:65px;
left:40%;
z-index:1;
text-align:left;
}
#sample4_postcode{
height:50px;
}
#sample4_postcode_btn{
height:50px;
}
#sample4_postcode_input{
height:50px;
}
#user_info{
display:block;
}

/*tracking*/
.node {
    position: absolute;
    background-image: url(resources/images/circlemark1.png);
    cursor: pointer;
    width: 64px;
    height: 64px;
}

.tooltip {
    background-color: #fff;
    position: absolute;
    border: 2px solid #333;
    font-size: 25px;
    font-weight: bold;
    padding: 3px 5px 0;
    left: 65px;
    top: 14px;
    border-radius: 5px;
    white-space: nowrap;
    display: block;
}

.tracker {
    position: absolute;
    margin: -35px 0 0 -30px;
    display: none;
    cursor: pointer;
    z-index: 600;    
}

.icon {
    position: absolute;
    left: 6px;
    top: 9px;
    width: 80px;
    height: 80px;
    z-index:600;
}

.balloon {
    position: absolute;
    width: 90px;
    height: 90px;
    -ms-transform-origin: 50% 34px;
    -webkit-transform-origin: 50% 34px;
    transform-origin: 50% 34px;
    z-index:600;
}
div.navbar-brand{
	width: 128px;
	height: 90px;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<!-- 업체 리스트 부분 -->
<div class="container-fluid" id="container">
<div class="row" id="container_row">
		<div class="col-sm-4" id="centerListResult">
		<div class="col-sm-12" id="margining"></div>

		<div id="wait""><img src='resources/images/pageloader.gif'/><br>Loading..</div>
		<!-- 검색하기 -->
		<div class="col-sm-12">
   <form action="javascript:keywordSearch()" id="search_form">
    <div class="input-group" id="search-div">
      <input type="text" class="form-control" id="search_input" placeholder="지역/이름/종목을 검색하세요(예: 강남 헬스)">
      <div class="input-group-btn">
        <button class="btn btn-primary" type="submit" id="search-btn"><i class="glyphicon glyphicon-search"></i></button>
      </div>
    </div>
  </form>
  <div class="col-sm-12" id="search_initialization">
  </div>
		<hr>
		</div>
		<!-- 리스트 -->
		<div class="col-sm-12">
			<div id="centerInfo_list">
			<!--  -->

			<!--  -->
			</div>

		</div>
					<div class="col-sm-12" id="moreBtn">
			</div>
			</div>	
<!-- 맵 부분 -->
			<div class="col-sm-8" id="map_part">
				<div id="map"></div>
				<div id="map_zoom">
				<div>
					<button data-toggle="modal" data-target="#myModal1" onclick="" type="button" class="btn btn-danger btn-sm" ><span class="glyphicon glyphicon-map-marker"></span></button>				
					<button onclick="javascript:tracker()" type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-screenshot"></span></button>				
					<button onclick="javascript:zoomSetIn()" type="button" class="btn btn-basic btn-sm"><span class="glyphicon glyphicon-plus"></span></button>				
					<button onclick="javascript:zoomSetOut()" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span></button>				
				</div>
				</div>
				<div id="navi-title"></div>
				<!-- Modal1 -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">주소를 입력하세요</h4>
        </div>
        <div class="modal-body">
          <form>
          	<div class="form-group">
          	<div class="input-group" id="sample4_postcode_input">
     			 <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
     			 <span class="input-group-btn">
					<input type="button" class="btn btn-secondary"  onclick="sample4_execDaumPostcode()" id="sample4_postcode_btn" value="우편번호 찾기">
			      </span>
          	</div>
          	<div class="input-group">
				<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" class="form-control"  id="sample4_jibunAddress" placeholder="지번주소">
          	</div>
				<span id="guide" style="color:#999"></span>
          	<div class="form-group" style="text-align:right;">
          	<button onclick="javascript:getAddr()" type="button" class="btn btn-warning" data-dismiss="modal">Submit</button><button type="reset" class="btn btn-basic">Reset</button>
          	</div>
  			 </div>
          </form>
          	</div>
        </div>
      </div>
    </div>
  </div>
			</div>
			</div>
	
	
	<!--  업체 백업 부분 -->
		<div class="col-sm-12" id="center_list">
			<h3>업체 백업</h3>
			<c:set var="centerList" value="${list}"/>
			<table class="table table-bordered" id="table">
			<thead>
			<tr>
			<th>co_idx</th>
			<th>co_name</th>
			<th>co_phone</th>
			<th>co_address</th>
			<th>co_class</th>
			<th>co_view</th>
			<th>co_lat</th>
			<th>co_lng</th>
			<th>co_usecount</th>
			<th>co_url</th>
			</tr>
			</thead>
			<tbody id="center_list_tbody">
			<c:if test="${empty centerList}">
			<tr>
			<td colspan="4" align="center">no data</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${centerList}" begin="0"  step="1" varStatus="status">
			<c:url var="centerListUrl" value="centerDetail.do">
			<c:param name="co_idx">${dto.co_idx}</c:param>
			</c:url>
			<tr>
			<td>	<span class="centeridx" id="coIdx_${status.count}">${dto.co_idx }</span></td>
			<td>	<span id="coName_${status.count}">${dto.co_name}</span></td>
			<td>	<span id="coPhone_${status.count}">${dto.co_phone}</span></td>
			<td>	<span id="coAddr_${status.count}">${dto.co_address}</span></td>
			<td><span id="coClass_${status.count}">${dto.co_class}</span></td>
			<td><span id="coView_${status.count}">${dto.co_view}</span></td>
			<td><span id="coLat_${status.count}">${dto.co_lat}</span></td>
			<td><span id="coLng_${status.count}">${dto.co_lng}</span></td>
			<td><span id="coUsecount_${status.count}">${dto.co_usecount}</span></td>
			<td><span id="coUrl_${status.count}">${centerListUrl}</span></td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
			</div>
		
<!-- 서비스 백업 부분 -->
		<div class="col-sm-12" id="content_list">
		<h3>서비스 백업</h3>
		<c:set var="content_list" value="${clist}"/>
		<table class="table table-bordered">
		<thead>
		<tr>
		<th>content_idx</th>
		<th>co_idx</th>
		<th>content_coin</th>
		<th>content1</th>
		<th>content2</th>
		<th>content3</th>
		<th>content4</th>
		<th>content5</th>
		<th>content6</th>
		</tr>
		</thead>
		<tbody id="content_list_tbody">
		<c:if test="${empty content_list}">
		<tr>
		<td colspan="9">No result</td>
		</tr>
		</c:if>
		<c:forEach var="contentDTO" items="${content_list}" begin="0" step="1" varStatus="status">
		<tr>
		<td><span id="content_list_content_idx_${status.count}">${contentDTO.content_idx}</span></td>
		<td><span class="content_idx_cnt" id="content_list_co_idx_${status.count}">${contentDTO.co_idx}</span></td>
		<td><span id="content_list_content_coin_${status.count}">${contentDTO.content_coin}</span></td>
		<td><span id="content_list_content1_${status.count}">${contentDTO.content1}</span></td>
		<td><span id="content_list_content2_${status.count}">${contentDTO.content2}</span></td>
		<td><span id="content_list_content3_${status.count}">${contentDTO.content3}</span></td>
		<td><span id="content_list_content4_${status.count}">${contentDTO.content4}</span></td>
		<td><span id="content_list_content5_${status.count}">${contentDTO.content5}</span></td>
		<td><span id="content_list_content6_${status.count}">${contentDTO.content6}</span></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
	
<!-- 사용자 정보 백업부분-->	
	<div class="col-sm-12" id="user_info">
	<input class="form-control" type="hidden" value="${sessionScope.saveid}" id="userid">
	</div>
	
<p style="display:none;" id="mapapi">
33.450701, 126.570667<br>
edd938c4fc341b07f90ed69064de3f92<br>
95b97b04d035d60f73995902d8ae2cd0<br>
3564ccb62994635b131231fb19ae3e7d<br>
55702a1d09804903d4550080da539868<br>
</p>

  
	
	
<!-- 제휴업체 패널 부분 -->
<div class="col-sm-12" id="centerInfo">
<div class="panel panel-default" id="centerInfo_panel">
<a class="btn" id="close" role="button">
<span class="glyphicon glyphicon-remove" id="close_icon"></span>
</a>
<div class="panel-heading" id="centerInfo_head">
<h3 id="centerInfo_coname">Company Name</h3>
</div>
<div class="panel-body" id="centerInfo_body">
<div class="col-sm-12" id="coImg">
<img alt="center" src="resources/images/center_default.jpg" class="img-rounded img-responsive" id="centerInfo_img">
</div>
<div class="col-sm-12" id="coAddr">
<div class="col-sm-12">
<p class="glyphicon glyphicon-flag" id="centerInfo_address"></p>
</div>
<div class="col-sm-12">
<p class="glyphicon glyphicon-phone-alt" id="centerInfo_phone"></p>
</div>
<div class="col-sm-12" id="centerInfo_coin_div">
<p id="centerInfo_coin"></p>
</div>
<div class="col-sm-12">
<a class="col-sm-12 btn btn-default" href="#" id="coBtn_button"></a>
</div>
<div class="col-sm-12">
<hr>
<p id="centerInfo_usecount"></p>
<hr>
</div>
</div>
<div class="row well" id="centerInfo_body_sub">
<div id="coTime_table">
<p style="font-weight:bold"></p>
<table class="table table-condensed table-hover">
<thead>
<tr>
<th></th>
<th></th>
</tr>
</thead>
<tbody id="centerInfo_time">
<tr>
<td><span id=""></span></td>
<td><span id=""></span></td>
</tr>
</tbody>
</table>
</div>
<hr>
<div id="coAvail">
<p style="font-weight:bold;"></p>
<ul class="list-inline" id="centerInfo_avail">
<li></li>
</ul>
</div>
<hr>
<div id="coRegul">
<p></p>
<div id="centerInfo_regul"></div>
</div>
<hr>
<div id="coExtra">
<p></p>
<div id="centerInfo_extra"></div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
/*우편번호 찾기*/
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }

/*마커 표시 기능*/
function getAddr(){
var newMarker=[];
var newInfowindow=[];
	var addr = $("#sample4_roadAddress").val();
	console.log(addr);
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addr2coord(addr, function (status, result){
		if(status==daum.maps.services.Status.OK){
			var imageSrc1 = 'resources/images/map-marker-icon.png';   
		    var imageSize1 = new daum.maps.Size(64, 69); 
		    var imageOption1 = {offset: new daum.maps.Point(27, 69)}; 
		      
		var markerImage1 = new daum.maps.MarkerImage(imageSrc1, imageSize1);
			var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
			var marker = new daum.maps.Marker({
				map:map,
				position:coords,
				image:markerImage1,
		        draggable: true, 
		        clickable:true,
		        title: '오른쪽 클릭시 제거, 왼쪽 클릭시 주소창 생성'
			});
			newMarker.push(marker);
			
			var infowindow = new daum.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:10px;"><span class="bg-info">주소</span>: '+addr+'</div>',
				removable:true,
				zIndex:4
			});
			newInfowindow.push(infowindow);
			infowindow.open(map, marker);
			map.setCenter(coords);
		}//if(status==daum.maps.services.Status.OK){
		daum.maps.event.addListener(marker, 'rightclick', function(mouseEvent){
			marker.setMap(null);
			for(var i=0; i<newInfowindow.length; i++){
				newInfowindow[i].close();
			}//for(var i=0; i<newInfowindow.length; i++){
		});//daum.maps.event.addListener(newMarker, 'rightclick', function(mouseEvent){
		daum.maps.event.addListener(marker, 'dragend', function(){       
			for(var i=0; i<newInfowindow.length; i++){
				if(i==(newInfowindow.length-1)){
				newInfowindow[i].close();
				}//if(i==(newInfowindow.length-1)){
			}//for(var i=0; i<newInfowindow.length; i++){
			var latlng = marker.getPosition();
			var geocoder2 = new daum.maps.services.Geocoder();
			geocoder2.coord2detailaddr(latlng, function(status2, result2){
				if(status2==daum.maps.services.Status.OK){
					var addr2 = result2[0].roadAddress.name;
					var addrJibun = result2[0].jibunAddress.name;
					var infowindow2 = new daum.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:10px;"><span class="bg-info">주소</span>: '+addr2+"<br>"+addrJibun+'</div>',
						removable:true,
						zIndex:4
					});//infowindow = new daum.maps.InfoWindow({
						infowindow2.open(map, marker);
						newInfowindow.push(infowindow2);
				}//if(status==daum.maps.services.Status.OK){
			});//goecoder.coord2detailaddr(latlng, function(status, result){
		});//daum.maps.event.addListener(marker, 'dragend', function(){
	});//geocoder.addr2coord(addr, function (status, result){
	setTimeout(searchMark, 100);
}//function getAddr(){


/*맵 추척 기능*/
var trackCheck=true;
function tracker(){
		var user_id = $("#userid").val();
		console.log("user_id="+user_id)
		if(user_id==null || user_id==""){
			window.alert("로그인이 필요합니다.")
			return false;
		}//if(user_id==null || user_id=="")
			$.ajax({
				url:"centerTrack.do",
				type:"GET",
				data:{"user_id":user_id},
				success:function(data){
					$("#ajax").remove();
					var strData= data;
					var objData = eval('('+strData+')');
					var bookmark = objData.bookmark;
					if(!data){
						alert("ajax fail");
						return false;
					}else{
						searchMark();
						if(trackCheck==true){
						//2. tooltip 말풍선 생성*******************
						function TooltipMarker(position, tooltipText){
							console.log("this="+this);
							this.position=position
							console.log("this.position="+this.position);
							var node = this.node = document.createElement('div');
						    node.className = 'node';

						    var tooltip = document.createElement('div');
						    tooltip.className = 'tooltip',

						    tooltip.appendChild(document.createTextNode(tooltipText));
						    node.appendChild(tooltip);
						    
						    // 툴팁 엘리먼트에 마우스 인터렉션에 따라 보임/숨김 기능을 하도록 이벤트를 등록합니다.
						    node.onmouseover = function() {
						    	tooltip.style.display = 'block';
						        $(this).append().html("<div class='col-sm-2'><span class='label label-danger' style='font-size:14px;position:absolute;top:60px;'>"+tooltipText+"</span></div>");
						    };//node.onmouseover = function()
						    node.onmouseout = function() {
						        tooltip.style.display = 'none';
						        $(this).append().html("");
						    };//node.onmouseout = function()
						}//function TooltipMarker(position, tooltipText){
						
						// 10. 2번에서 만든 말풍선 abstractoverlay로 사용자 재정의 오버레이 생성 구현 1******************* 
						TooltipMarker.prototype = new daum.maps.AbstractOverlay;

						TooltipMarker.prototype.onAdd = function() {
						    var panel = this.getPanels().overlayLayer;
						    panel.appendChild(this.node);
						};//TooltipMarker.prototype.onAdd = function() {

						TooltipMarker.prototype.onRemove = function() {
						    this.node.parentNode.removeChild(this.node);
						};//TooltipMarker.prototype.onRemove = function() {

						TooltipMarker.prototype.draw = function() {
						    // 화면 좌표와 지도의 좌표를 매핑시켜주는 projection객체
						    var projection = this.getProjection();
						    
						    // overlayLayer는 지도와 함께 움직이는 layer이므로
						    // 지도 내부의 위치를 반영해주는 pointFromCoords를 사용합니다.
						    var point = projection.pointFromCoords(this.position);

						    // 내부 엘리먼트의 크기를 얻어서
						    var width = this.node.offsetWidth;
						    var height = this.node.offsetHeight;

						    // 해당 위치의 정중앙에 위치하도록 top, left를 지정합니다.
						    this.node.style.left = (point.x - width/2) + "px";
						    this.node.style.top = (point.y - height/2) + "px";
						};//TooltipMarker.prototype.draw = function() {

						TooltipMarker.prototype.getPosition = function() {
						    return this.position;
						};//TooltipMarker.prototype.getPosition = function() {
						
						// 3. 마커 추적 객채 생성 ('tracker')*******************
						function MarkerTracker(map, target, name){
							var OUTCODE={
									INSIDE:0,
									TOP: 8,
									RIGHT: 2,
									BOTTOM:4,
									LEFT: 1
							};
							var BOUNDS_BUFFER = 30;
							var CLIP_BUFFER = 40;
							var tracker = document.createElement('div');
							tracker.className = 'tracker';
							var icon = document.createElement('div');
							icon.className = 'icon';
							var balloon = document.createElement('div');
							balloon.className = 'balloon';
							
							icon.onmouseover=function(){
								console.log("name="+name);
								$("#navi-title").html("<div class='col-sm-2' id='navi-tag'><span class='label label-danger' style='font-size:14px;position:absolute;top:60px;'>즐겨찾기이동: "+name+"</span></div>");
							}
							
							icon.onmouseout=function(){
								console.log("nameout="+name);
								$("div").remove("#navi-tag");
							}
							
							tracker.appendChild(balloon);
							tracker.appendChild(icon);
							
							map.getNode().appendChild(tracker);
							
							tracker.onclick = function(){
								map.setCenter(target.getPosition());
								setVisible(false);
								searchMark();
							};//tracker.onclick = function(){
							// 4. 마커를 추적하는 함수
							function tracking(){
								var proj = map.getProjection();
								var bounds = map.getBounds();
								// 5. 지도영역 기준 확장 영역 구하기 
								var extBounds = extendBounds(bounds, proj);
								// 6. 지도 영역에 있는지 없는지 확인하기
								if(extBounds.contain(target.getPosition())){
									setVisible(false);
								}else{
									//7. 지도 밖일 경우 아이콘이 변하게 되는 지도 bounds선 만들기 (개별 마커 중심으로)
									var pos = proj.containerPointFromCoords(target.getPosition());
									var center = proj.containerPointFromCoords(map.getCenter());
									var sw = proj.containerPointFromCoords(bounds.getSouthWest());
									var ne = proj.containerPointFromCoords(bounds.getNorthEast());
									var top = ne.y + (CLIP_BUFFER*3);
									var right = ne.x - CLIP_BUFFER;
									var bottom = sw.y-CLIP_BUFFER;
									var left = sw.x + CLIP_BUFFER;
									//8. Cohen–Sutherland clipping algorithm 을 이용하여 맵 밖의 포지션 추적하기
									var clipPosition = getClipPosition(top, right, bottom, left, center, pos);
									tracker.style.top = clipPosition.y + 'px';
									tracker.style.left = clipPosition.x + 'px';
									//9. 추적 말풍선 돌리게 하는 기능 및 각도 계산
									var angle = getAngle(center, pos);
									balloon.style.cssText +=
										'-ms-transform: rotate('+angle+'deg);'+
										'-webkit-transform: rotate('+angle+'deg);'+
										'transform: rotate('+angle+'deg)';
									setVisible(true);
								}//if(extBounds.contain(target.getPosition())){
							}//function tracking(){
							// 5. 지도영역 기준 확장 영역 구하기 
							function extendBounds(bounds, proj){
								var sw = proj.pointFromCoords(bounds.getSouthWest());
								var ne = proj.pointFromCoords(bounds.getNorthEast());
								sw.x -= BOUNDS_BUFFER;
								sw.y += BOUNDS_BUFFER;
								ne.x += BOUNDS_BUFFER;
								ne.y -= BOUNDS_BUFFER;
								
								return new daum.maps.LatLngBounds(proj.coordsFromPoint(sw), proj.coordsFromPoint(ne));
							}
							//8. Cohen–Sutherland clipping algorithm
							function getClipPosition(top, right, bottom, left, inner, outer){
								function calcOutcode(x,y){
									var outcode = OUTCODE.INSIDE;
									
									if(x<left){
										outcode |= OUTCODE.LEFT;
									}else if (x > right){
										outcode |= OUTCODE.RIGHT;
									}//if(x<left)
									if(y<top){
										outcode |= OUTCODE.TOP;
									}else if(y>bottom){
										outcode |= OUTCODE.BOTTOM;
									}//if(y<top)
									return outcode;
								}//function calcOutcode(x,y)
								var ix = inner.x;
								var iy = inner.y;
								var ox = outer.x;
								var oy = outer.y;
								
								var code = calcOutcode(ox, oy);
								
								while(true){
									if(!code){
										break;
									}//if(!code){
									if(code&OUTCODE.TOP){
										ox = ox + (ix-ox) / (iy-oy) * (top - oy);
										oy = top;
									} else if (code & OUTCODE.RIGHT){
										oy = oy + (iy - oy) / (ix - ox) * (right - ox);
										ox = right;
									}else if (code & OUTCODE.BOTTOM){
										ox = ox + (ix - ox) / (iy - oy) * (bottom-oy);
										oy = bottom;
									}else if(code & OUTCODE.LEFT){
										oy = oy + (iy - oy) / (ix - ox) * (left - ox);
										ox = left;
									}//if(code&OUTCODE.TOP)
									code = calcOutcode(ox, oy);
								}//while(true)
								return {x: ox, y: oy};
							}//function getClipPosition(top, right, bottom, left, inner, outer)
							//9. 추적 말풍선 돌리게 하는 기능 및 각도 계산
							function getAngle(center, target){
								var dx = target.x - center.x;
								var dy = center.y - target.y;
								var deg = Math.atan2(dy,dx)*180/Math.PI;
								return ((-deg + 360)%360|0)+90;
							}//function getAngle(center, target)
							function setVisible(visible){
								tracker.style.display = visible ? 'block' : 'none';
							}//function setVisible(visible)
							function hideTracker(){
								setVisible(false);
							}//function hideTracker()
							this.run = function(){
								daum.maps.event.addListener(map, 'zoom_start', hideTracker);
								daum.maps.event.addListener(map, 'zoom_changed', tracking);
								daum.maps.event.addListener(map, 'center_changed', tracking);
								tracking();
							}///this.run = function(){
							this.stop = function(){
								daum.maps.event.removeListener(map, 'zoom_start', hideTracker);
								daum.maps.event.removeListener(map, 'zoom_changed', tracking);
								daum.maps.event.removeListener(map, 'center_changed', tracking);
								setVisible(false);
							};//this.stop = function(){
						}//function MarkerTracker(map, target){
							
						// 1. 변수생성*******************
						var dkpos=[];
						var markerTrack=[];
						var Tracking=[];
						for(var i=0; i<bookmark.length; i++){
							var bookmarkOne = bookmark[i];
							dkpos[i] = new daum.maps.LatLng(bookmarkOne.co_lat, bookmarkOne.co_lng);
							markerTrack[i] = new TooltipMarker(dkpos[i], bookmarkOne.co_name);
							markerTrack[i].setMap(map);
							Tracking[i]=new MarkerTracker(map, markerTrack[i], bookmarkOne.co_name);
							Tracking[i].run();
						}//for(var i=0; i<bookmark.length; i++){
						$(".balloon").html("<img src='resources/images/navigation1.png' class='img-responsive'>");
						
						trackCheck=false;
					}else if(trackCheck==false){
						$(".node").hide();
						$(".icon").hide();
						$(".balloon").hide();
						$(".tracker").hide();
						trackCheck=true;
					}//if(trackCheck==false)
					}//if(!data){
				}//success:function(data){
			});//$.ajax({
	

}//function tracker()


/*ajax loading*/
$(document).ready(function(){
	var $listHeight;
	$listHeight = $("#map_part").height();
	$("#centerListResult").css({"height":$listHeight});
	$(window).resize(function(){
		$listHeight = $("#map_part").height();
		$("#centerListResult").css({"height":$listHeight});
	});
})

$(document).ready(function(){
	$(document).ajaxStart(function(){
		$("#wait").css("display","block");
		$("#centerListResult").css({"background-color":"black", "opacity":"0.5"});
	});
	$(document).ajaxComplete(function() {
		$("#wait").css("display", "none");
		$("#centerListResult").css({"background-color":"", "opacity":"1"});
	});
});


//var content_list 세팅
 var content1;
 var content2;
 var content3;
 var content4;
 var content5;
 var content6;
 var contents=[];
 var contentCnt = $("#content_list_tbody > tr").length;//content 리스트 수
 var finalindex=0;
 var coidx=0;
var contentLists=[];
 //var company list세팅------------------------
var finalcenteridx =$(".centeridx:last").text();
var centerCnt = 0;
var coIdxs=[];
var coNames=[];
var coPhones=[];
var coAddrs=[];
var coClasses=[];
var coViews=[];
var coLats=[];
var coLngs=[];
var coUsecounts=[];
var coUrls=[];
var coIdx;
var coName;
var coPhone;
var coAddr;
var coClass;
var coView;
var coLat;
var coLng;
var coUsecount;
var coUrl;
//var 마커 및 인포윈도우 세팅--------------------------------------------------
var markers=[]; //마커
var infoWindows=[]; //인포윈도우
var infoContent; //윈포윈도우 컨텐츠
var startCheck=false; //첫 접속false일 경우, 다음 움직임 부터 true -> 리스트 와 마커 제거
var mapOn=false; //리스트 생성 여부 : 맵 움직을때만 
var searchOn = false; //검색일 경우, 마커와 인포가 고정으로 생성됨 맵을 움직여도 마커 및 인포 변하지 않음 

//--------------마카 이미지 생성
var imgSrc='resources/images/marker.png';
var imgSize=new daum.maps.Size(54,59);
var markerImage = new daum.maps.MarkerImage(imgSrc, imgSize);
//----------ends 마카 이미지 생성


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

/*시작*/
window.onload=mapStart();

/*지도 확대 축소 컨트롤러*/
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMLEFT);
//setTimeout(searchMark, 500);


/*리스트 전부 끄기*/
function listRemove(){
		$("#centerInfo_list").empty();
}

/*더 보기 버튼 생성*/
function moreButton(){
	$("#moreBtn").empty();
	var $button ='<a href="javascript:more()" class="col-sm-12 btn btn-info">더보기 more()</a>';
	if((".hiddenBtn").length>0){
		$("#moreBtn").html($button);
	}
}
/*더보기 버튼 삭제*/
function removeMore(){
	$("#moreBtn").empty();
}
/*더보기 메소드*/
function more(){
	$("#centerInfo_list > .hiddenCnt").css({display:""});
	$("div").removeClass("hiddenCnt");
	checkHidden();
	function checkHidden(){
		var hiddenLength = $(".hiddenCnt").length;
		if(hiddenLength==0){
			$("#moreBtn").empty();
		}
	}
}

/*지도 축소*/
function zoomSetIn() {
    map.setLevel(map.getLevel() - 1);
}

/*지도 확대*/
function zoomSetOut() {
    map.setLevel(map.getLevel() + 1);
}

/*상세 aside 닫기*/
$(function(){
		$close=$("#close");
		$close.on("click", function(e){
			e.preventDefault();
			$(this).parents("#centerInfo_panel").animate({
				opacity:'0',
				height:'0px'
			}, 500);
		})
	})

/*센터 상세보기 열기*/
function centerDetail(centerListUrl){
		window.location.href=centerListUrl;
	}


/*마크 전부 끄기*/
function removeMarker(){
			if(markers==null){
			return;
			}else{
				for(var i=0; i<markers.length; i++){
				if(markers[i]==null || markers[i]=="undefined"){
				}else{
				markers[i].setMap(null);
				}//if(markers[i]==null || markers[i]=="undefined"){
			}//for(var i=0; i<markers.length; i++){
	}//if(markers==null){
}

/*검색 초기화 */
function searchReset(searchNum){
	$("#search_initialization").empty();
	$("#search_initialization").html('<a href="javascript:mapStart()" class="btn btn-primary btn-block">검색초기화<span class="badge">'+searchNum+'</span></a>');
}

/*인포 전부 끄기*/
function closeAllMarkInfo(){
	for(var j=1; j<=infoWindows.length; j++){
		if(infoWindows[j]==null||infoWindows[j]=="undefined"){
		}else{	
			infoWindows[j].close();
		}//if(infoWindows[j]==null||infoWindows[j]=="undefined"){
	}//for(var j=1; j<=infoWindows.length; j++){
}

/*이름과 주소 가져오기*/
function mapStart(){
	searchOn = false;
	closeAllMarkInfo();
	removeMarker();
	removeMore();
	contents=[];
	$("#search_initialization").empty();
	/*contents 생성*/
	finalindex=$(".content_idx_cnt:last").text(); //전체 idx중 마지막
	contentCnt = $("#content_list_tbody > tr").length;//content 리스트 수 
	for(var i=0; i<=finalcenteridx; i++){ 
		contents[i]="";
	}//for(var i=0; i<finalindex; i++){
	for(var i=1; i<=contentCnt; i++){//content_list 정보
		content1 = $("#content_list_content1_"+i).text();
		content2 = $("#content_list_content2_"+i).text();
		content3 = $("#content_list_content3_"+i).text();
		content4 = $("#content_list_content4_"+i).text();
		content5 = $("#content_list_content5_"+i).text();
		content6 = $("#content_list_content6_"+i).text();
		coidx = $("#content_list_co_idx_"+i).text();//현재 idx
		if(content2!=" " && content2 !=""){
			content1+=", ";
		}
		if(content3!=" " && content3 !=""){
			content2+=", ";
		}
		if(content4!=" " && content4 !=""){
			content3+=", ";
		}
		if(content5!=" " && content5 !=""){
			content4+=", ";
		}
		if(content6!=" " && content6 !=""){
			content5+=", ";
		}
		if(content1!=" "&& content1 !=""){
			content6+=", ";
		}
		contents[coidx]+=(content1+content2+content3+content4+content5+content6);
	}//for content list ends
	
	/*company 생성*/
	finalcenteridx = $(".centeridx:last").text(); //center 마지막 idx 추출
	centerCnt = $("#center_list_tbody > tr").length; //center list개수 추출 
	console.log("finalcenteridx="+finalcenteridx);
	console.log("centerCnt="+centerCnt);
	for(var i=1; i<=centerCnt; i++){
		coIdx = $("#coIdx_"+i).text();
		coIdxs[coIdx]=coIdx;
		coName = $("#coName_"+i).text();
		coNames[coIdx]=coName;
		coPhone = $("#coPhone_"+i).text();
		coPhones[coIdx]=coPhone;
		coAddr = $("#coAddr_"+i).text();
		coAddrs[coIdx]=coAddr;
		coClass = $("#coClass_"+i).text();
		coClasses[coIdx]=coClass;
		coView = $("#coView_"+i).text();
		coViews[coIdx]=coView;
		coLat = $("#coLat_"+i).text();
		coLats[coIdx]=coLat;
		coLng = $("#coLng_"+i).text();
		coLngs[coIdx]=coLng;
		coUsecount = $("#coUsecount_"+i).text();
		coUsecounts[coIdx]=coUsecount;
		coUrl = $("#coUrl_"+i).text();
		coUrls[coIdx]=coUrl;
		getMarker(coIdx, coName, coPhone, coAddr, coClass, coView, coLat, coLng, coUsecount, coUrl);
	}//for(var i=1; i<=centerCnt; i++){
		console.log("markers.length="+markers.length);
setTimeout(searchMark, 100);
}//mapStart() ends

console.log("=======================================")
for(var i=1; i<=finalcenteridx; i++){
	if(coIdxs[i]==null){}else{
console.log("---------------------------------------")
	console.log("i="+i+", coIdxs[i]="+coIdxs[i]);
	console.log("i="+i+", coNames[i]="+coNames[i]);
	console.log("i="+i+", coPhones[i]="+coPhones[i]);
	console.log("i="+i+", coAddrs[i]="+coAddrs[i]);
	console.log("i="+i+", coClasses[i]="+coClasses[i]);
	console.log("i="+i+", coViews[i]="+coViews[i]);
	console.log("i="+i+", coLats[i]="+coLats[i]);
	console.log("i="+i+", coLngs[i]="+coLngs[i]);
	console.log("i="+i+", coUsecounts[i]="+coUsecounts[i]);
	console.log("i="+i+", coUrls[i]="+coUrls[i]);
console.log("---------------------------------------")
	console.log("i="+i+", contents[i]="+contents[i]);
	}
}
console.log("=======================================")

/*마커 및 인포윈도우 생성*/
function getMarker(coIdx, coName, coPhone, coAddr, coClass, coView, coLat, coLng, coUsecount, coUrl){
var coords; //위도경도
var markerMain; //마커
var infowindowMain //인포윈도우
var latlngData; //위도 경도 없을 시 DB에 입력하기 위한 값
if(coLat!=0 && coLng!=0){//DB에 위도 경도 있눈 경우
	coords = new daum.maps.LatLng(coLat, coLng);
	markerMain = new daum.maps.Marker({
		position:coords,
		image:markerImage,
		clickable:true
	});//markerMain = new daum.maps.Marker({
	markers[coIdx]=markerMain;
	infoContent='<table id="infowindows" class="table table-condensed">'+
    '<thead><tr><th>'+coName+'<div id="infowindows_close" onclick="javascript:closeAllMarkInfo()"><span class="glyphicon glyphicon-remove-circle"></span></div></th></tr></thead>'+
    '<tbody><tr><td>'+coAddr+'</td></tr></tbody>'+
    '</table>';
 	infowindowMain=new daum.maps.InfoWindow({ 
		content: infoContent,
		zIndex:3
 	});//infowindowMain=new daum.maps.infoWindow({
 	infoWindows[coIdx]=infowindowMain;
 	daum.maps.event.addListener(markerMain, 'click', makeAddListener(map, markerMain, infowindowMain, coIdx, coUrl));
}else{//DB에 위도 경도 값이 없는 경우
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addr2coord(coAddr, function(status, result){
			if(status==daum.maps.services.Status.OK){
				coords=new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
				markerMain = new daum.maps.Marker({
					position:coords,
					image:markerImage,
					clickable:true
				});//marker = new daum.maps.Marker({
				markers[coIdx]=markerMain;
				infoContent='<table id="infowindows" class="table table-condensed">'+
			        '<thead><tr><th>'+coName+'<div id="infowindows_close" onclick="javascript:closeAllMarkInfo()"><span class="glyphicon glyphicon-remove-circle"></span></div></th></tr></thead>'+
			        '<tbody><tr><td>'+coAddr+'</td></tr></tbody>'+
			        '</table>';
			     infowindowMain=new daum.maps.InfoWindow({ 
					content: infoContent,
					zIndex:3
			     });//infowindowMain=new daum.maps.infoWindow({
			   	infoWindows[coIdx]=infowindowMain;
			   	coLat=result.addr[0].lat;
			   	coLng=result.addr[0].lng;
			   	latlngData =  coIdx+"/"+ coLat+"/"+coLng;
			   	$.ajax({ 
			   		url:"centerLatLng.do",
					type:"GET",
					data:{"latlngData":latlngData},
					success:function(data){
						$("#ajax").remove();
						if(!data){
							alert("ajax fail");
							return false;
						}else{
						}//ajax !data
					},//success:function(data){
					error: function(data){
						alert("ajax fail=");
						return false;
					}// ajax error function
				});//$ajax({
		daum.maps.event.addListener(markerMain, 'click', makeAddListener(map, markerMain, infowindowMain, coIdx, coUrl));
			}//if(status==daum.maps.services.Status.OK){
		});//geocoder,addr2coord(coAddr, function(){	
	}///if(coLat!=0 && coLng!=0)
		function makeAddListener(){
			return function(){
				var setMapGo=false;
				closeAllMarkInfo();
				infowindowMain.open(map, markerMain);
				show(coIdx, coUrl, setMapGo);
			}//return function(){
		}//function makeAddListener(){
			console.log("markers[coIdx="+coIdx+"]="+markers[coIdx]);
}//function getMarker(coIdx, coName, coPhone, coAddr, coClass, coView, coLat, coLng, coUsecount, coUrl){

/*마커 및 인포윈도우 생성*/
if(searchOn==true){}else if(searchOn==false){
daum.maps.event.addListener(map, 'zoom_changed', searchMark);
daum.maps.event.addListener(map, 'dragend', searchMark);
}//if(searchOn==true){}else if(searchOn==false)
function searchMark(){
	if(searchOn==true){
		return false;
	}else{
	if(markers!=null||markers!=''){
		if(startCheck==false){//첫 접속일 경우 마커 생성 후 리스트만 제거
			listRemove();
			startCheck=true;
		}else if(startCheck==true){//첫 접속 이후 맵 움직일 시에
			if(mapOn==false){//맵 움직일 경우
				listRemove();
				removeMarker();
			}//if(mapOn==false){
		}//if(startCheck==false){
	var bounds = map.getBounds();
	var n=1; //리스트 카운트
	var numDiv=0; //경계선
	var selectoHtml;
	if(mapOn==false){//맵 마우스로 움직일 경우만 생성
		removeMore();
		for(var i=0; i<markers.length; i++){
			if(markers[i]==null||markers[i]=="undefined"){	}else{
				if(bounds.contain(markers[i].getPosition())){
					console.log("i reached here3~~~~~@!!@"+markers[i]+", i="+i);
					markers[i].setMap(map);
					selectoHtml='';
					if(n>4){
						selectoHtml+='<div class="col-sm-6 panel panel-default hiddenCnt" id="centerInfo_list_div">';
						selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
						selectoHtml+='<a href="javascript:show('+coIdxs[i]+',';
						selectoHtml+="'";
						selectoHtml+=coUrls[i];
						selectoHtml+="'";
						selectoHtml+=')">';
						selectoHtml+='<img src="resources/centerImage/'+coViews[i]+'/'+coViews[i]+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
						selectoHtml+='</a>';
						selectoHtml+='</div>';
						selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
						selectoHtml+='<div class="panel-group" id="list-table">';
						selectoHtml+='<div class="panel panel-default">';
						selectoHtml+='<div class="panel-heading">';
						selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coNames[i]+'<span class="bg-info" id="center_list_coName_class">'+coClasses[i]+'</span></h6>';
						selectoHtml+='</div>'; //panel-heading
						selectoHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
						selectoHtml+='<ul class="list-group">';
						selectoHtml+='<li class="list-group-item">'+coAddrs[i]+'</li>';
						selectoHtml+='</ul>';
						selectoHtml+='</div>'; //colapse panel1
						selectoHtml+='<div class="panel-body">';
						selectoHtml+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
						selectoHtml+='</div>'; //colapse panel open1
						selectoHtml+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
						selectoHtml+='<ul class="list-group">';
						selectoHtml+='<li class="list-group-item"><b>'+coClasses[i]+'</b>-'+contents[i]+'</li>';
						selectoHtml+='</ul>';
						selectoHtml+='</div>'; //collapse panel2
						selectoHtml+='<div class="panel-body">';
						selectoHtml+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
						selectoHtml+='</div>'; //collapse panel open 2
						selectoHtml+='</div>';//panel default
						selectoHtml+='</div>'; //panel group
						selectoHtml+='</div>'; //panel final
						selectoHtml+='</div>'; //panel final
						$("#centerInfo_list").append(selectoHtml);
						moreButton();
					}else{
						selectoHtml+='<div class="col-sm-6 panel panel-default" id="centerInfo_list_div">';
						selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
						selectoHtml+='<a href="javascript:show('+coIdxs[i]+',';
						selectoHtml+="'";
						selectoHtml+=coUrls[i];
						selectoHtml+="'";
						selectoHtml+=')">';
						selectoHtml+='<img src="resources/centerImage/'+coViews[i]+'/'+coViews[i]+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
						selectoHtml+='</a>';
						selectoHtml+='</div>';
						selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
						selectoHtml+='<div class="panel-group" id="list-table">';
						selectoHtml+='<div class="panel panel-default">';
						selectoHtml+='<div class="panel-heading">';
						selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coNames[i]+'<span class="bg-info" id="center_list_coName_class">'+coClasses[i]+'</span></h6>';
						selectoHtml+='</div>'; //panel-heading
						selectoHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
						selectoHtml+='<ul class="list-group">';
						selectoHtml+='<li class="list-group-item">'+coAddrs[i]+'</li>';
						selectoHtml+='</ul>';
						selectoHtml+='</div>'; //colapse panel1
						selectoHtml+='<div class="panel-body">';
						selectoHtml+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
						selectoHtml+='</div>'; //colapse panel open1
						selectoHtml+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
						selectoHtml+='<ul class="list-group">';
						selectoHtml+='<li class="list-group-item"><b>'+coClasses[i]+'</b>-'+contents[i]+'</li>';
						selectoHtml+='</ul>';
						selectoHtml+='</div>'; //collapse panel2
						selectoHtml+='<div class="panel-body">';
						selectoHtml+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
						selectoHtml+='</div>'; //collapse panel open 2
						selectoHtml+='</div>';//panel default
						selectoHtml+='</div>'; //panel group
						selectoHtml+='</div>'; //panel final
						selectoHtml+='</div>'; //panel final
						$("#centerInfo_list").append(selectoHtml);
						removeMore();
					}//if(n>4){
						n++;
						if(numDiv%1==0 && numDiv%2!=0){
							selectoHtml='<div class="col-sm-12"></div>';
							$("#centerInfo_list").append(selectoHtml);
						}
					numDiv++;
				}else{
					markers[i].setMap(null);
				}//if(bounds.contain(markers[i].getPosition())){
			}//if(markers[i]==null||markers[i]=="undefined"){	}else{
		}//for(var i=0; i<markers.length; i++){
	}else{}//if(mapOn==false){
}else{}//if(markers!=null||markers!=''){
}//if(searchOn==true){
	mapOn=false;
}//function searchMark(){


/*업체 정보 떠오르기 생성*/
function show(coIdx, coUrl, setMapGo){
	/*show 초기 세팅*/
	mapOn=true;
	if(infoWindows.length>0){
		closeAllMarkInfo();
	}//if(infoWindows.length>0){
		$("#centerInfo_panel").animate({
			opacity:1,
			height:'389px'
		},600);//$("#centerInfo_panel").animate({
		$("#centerInfo").css({display:"block"});
		
		/*show ajax center 불러오기*/
		$.ajax({
			url:"centerCompany.do",
			type:"GET",
			data:{"co_idx":coIdx},
			success : function(data){
				$("#ajax").remove();
				var dataObj = JSON.parse(data);
				if(!data){
					alert("ajax fail");
					return false;
				}else{
					/*co_idx and button*/
					var btn_html = '';
					btn_html += "<a class='col-sm-12 btn btn-info' href='"+coUrl+"' id='coBtn_button'>자세히보기</a>";
					$("#centerInfo_body > #coBtn").css({display:"block"});
					$("#coBtn_button").replaceWith(btn_html);
				
					/*co_name*/
					var coName_html = '';
					coName_html = "<h4 id='centerInfo_coname'>"+dataObj.co_name+"</h4>";
					$("#centerInfo_coname").replaceWith(coName_html);
					
					/*co_address*/
					var coAddr_html='';
					coAddr_html = "<p class='glyphicon glyphicon-flag' id='centerInfo_address'>"+dataObj.co_address+"</p>";
					$("#centerInfo_address").replaceWith(coAddr_html);
					
					/*co_phone*/
					var coPhone_html='';
					coPhone_html = "<p class='glyphicon glyphicon-phone-alt' id='centerInfo_phone'>"+dataObj.co_phone+"</p>";
					$("#centerInfo_phone").replaceWith(coPhone_html);
					
					/*co_usecount*/
					var coUsecount_html='';
					coUsecount_html = '<p id="centerInfo_usecount"><span class="glyphicon glyphicon-stats"></span>총 이용 횟수 : '+dataObj.co_usecount+'</p>';
					$("#centerInfo_usecount").replaceWith(coUsecount_html);
					
					/*co_view*/
					var coView_html='';
					coView_html='<img alt="center" src="resources/centerImage/'+dataObj.co_view+'/'+dataObj.co_view+'_0.jpg" class="img-rounded img-responsive" id="centerInfo_img">';
					$("#centerInfo_img").replaceWith(coView_html);
					
					/*co_avail*/
					$("#centerInfo_avail").empty();
					var coAvail=dataObj.co_avail;
					var coAvail_split=coAvail.split("|");
					var coAvail_array=[];
					var coAvail_html='<ul class="list-inline">';
					for(var i=0; i<coAvail_split.length; i++){
					coAvail_array[i]=coAvail_split[i];
						switch(coAvail_array[i]){
						case '주차' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/Car_Parking.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						case '타올' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/Towels.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						case '운동복' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/T_Shirts.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						case '일일락커' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/Locker.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						case '샤워실' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/shower.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						case '샤워' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/shower.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						case '탈의실' : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/change_room.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>"; break;
						default : coAvail_html += "<li><span id='coAvail_img'><img id='avail_photo' src='resources/images/causion.png'></span><span id='coAvail_text_"+i+"'>"+coAvail_split[i]+"</span></li>";
						}
					}
					coAvail_html+='</ul>';
					$("#centerInfo_avail").html(coAvail_html);
					
					/*co_regul*/
					var coRegul=dataObj.co_regul;
					var coRegul_split = coRegul.split("|");
					var coRegul_array=[];
					var coRegul_html='<div id="centerInfo_regul">';
					for(var i=0; i<coRegul_split.length; i++){
						coRegul_array[i]=coRegul_split[i];
							if(coRegul_array[i]==null||coRegul_array[i]=="null"){
								coRegul_html +='<p><span class="glyphicon glyphicon-ok-circle"></span>없음</p>';
							}else{
								coRegul_html +='<p><span class="glyphicon glyphicon-ok-circle"></span>'+coRegul_array[i]+'</p>';
							}
						}
					coRegul_html+='</div>';
					$("#centerInfo_regul").replaceWith(coRegul_html);
					
					/*co_extra*/
					var coExtra = dataObj.co_extra;
					var coExtra_split = coExtra.split("|");
					var coExtra_array=[];
					var coExtra_html='<div id="centerInfo_extra">';
					for(var i=0; i<coExtra_split.length; i++){
						coExtra_array[i]=coExtra_split[i];
						if(coExtra_array[i]==null||coExtra_array[i]=='null'){
							coExtra_html='<p><span class="glyphicon glyphicon-ok-circle"></span>없음</p>';
						}else{
							coExtra_html+='<p><span class="glyphicon glyphicon-ok-circle"></span>'+coExtra_array[i]+'</p>';
						}
					}
					coExtra_html+='</div>';
					$("#centerInfo_extra").replaceWith(coExtra_html);
					
					/*클릭 후 이동*/
					if(searchOn==true){//검색일 경우
						if(setMapGo==false){//마커 클릭할 경우
							infoWindows[coIdx].open(map, markers[coIdx]);
						}else{//리스트를 클릭할 경우
							var movePosition;
							if(coLats[coIdx]!=0&&coLng[coIdx]!=0){
								movePosition = new daum.maps.LatLng(coLats[coIdx], coLngs[coIdx]);
								infoWindows[coIdx].open(map, markers[coIdx]);
								map.setCenter(movePosition);
								map.setLevel(4);
							}else{
								var geocoder=new daum.maps.services.Geocoder();
								geocoder.addr2coord(dataObj.co_address, function(status, result){
									movePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
									infoWindows[coIdx].open(map, markers[coIdx]);
									map.setCenter(movePosition);
									map.setLevel(4);
								});//geocoder.addr2coord(dataObj.co_address, function(status, result)
							}//if(coLats[coIdx]!=0&&coLng[coIdx]!=0){
						}//if(setMapGo==false){
					}else if(searchOn==false){//검색이 아닐경우
						if(setMapGo==false){//마커를 클릭할 경우
							infoWindows[coIdx].open(map, markers[coIdx])
						}else{
							if(coLats[coIdx]!=0&&coLng[coIdx]!=0){
								movePosition = new daum.maps.LatLng(coLats[coIdx], coLngs[coIdx]);
								infoWindows[coIdx].open(map, markers[coIdx]);
								map.setCenter(movePosition);
								map.setLevel(4);
							}else{
								var geocoder = new daum.maps.services.Geocoder();
								geocoder.addr2coord(dataObj.co_address,function(status,result){
									movePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
									infoWindows[coIdx].open(map, markers[coIdx]);
									map.setCenter(movePosition);
									map.setLevel(4);
								});//geocoder.addr2coord(dataObj.co_address,function(status,result)
							}//if(coLats[coIdx]!=0&&coLng[coIdx]!=0)
						}//if(setMapGo==false)
					}//if(searchOn==true)
				}//if(!data)
			}//successfunction(data)
		});//ajax ends
		
		/*show ajax usetime 불러오기*/
		$.ajax({
			url: "centerUsetime.do",
			type: "GET",
			data: {"co_idx":coIdx},
			success:function(data){
				$("#ajax").remove();
				var strData= data;
				var objData = eval('('+strData+')');
				var usetime = objData.usetime;
				if(!data){
					alert("ajax fail");
					return false;
				}else{
					var useTime_html="<tbody id='centerInfo_time'>";
					for(var i=0; i<usetime.length; i++){
						var usetimeSet = usetime[i];
							if(usetimeSet.usetime_time==0||usetimeSet.usetime_time=='0' || usetimeSet.usetime_time=="null"){
								useTime_html += "<tr><td>"+usetimeSet.usetime_day+"</td><td></td></tr>";
							}else{
								useTime_html += "<tr><td>"+usetimeSet.usetime_day+"</td><td>"+usetimeSet.usetime_time+"</td></tr>";
							}//if(usetimeSet.usetime_time==0||usetimeSet.usetime_time=='0' || usetimeSet.usetime_time=="null")
					}//for(var i=0; i<usetime.length; i++)
					useTime_html+="</tbody>";
					$("#centerInfo_time").replaceWith(useTime_html);
				}//if(!data)
			}//success:function(data)
		});//$.ajax(
		
				
		/*show ajax 서비스 떠오르기*/
		$.ajax({
			url : "centerContent.do",
			type:"GET",
			data: {"co_idx":coIdx},
			success:function(data){
				$("#ajax").remove();
				var strData = data;
				var objData = eval('('+strData+')');
				var content = objData.content;
				if(!data){
					alert("ajax fail");
					return false;
				}else{
					$("#centerInfo_coin_div").empty();
					var content_html = '';
					for(var i=0; i<content.length; i++){
						var contentSet = content[i];
						var contentCoin = contentSet.content_coin;
						if(contentCoin<=5 ){
							content_html += '<p id="centerInfo_coin"><span class="label label-success">'+contentCoin+'</span>&nbsp;<span class="label label-success">'+contentSet.content1+'</span>&nbsp;';
							if(contentSet.content2==null||contentSet.content2=='null'){
								content_html+='</p>';
							}else if(contentSet.content3==null||contentSet.content3=='null'){
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content2+'</span>';
							}else if(contentSet.content4==null||contentSet.content4=='null'){
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content3+'</span></p>';
							}else if(contentSet.content5==null||contentSet.content5=='null'){
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content4+'</span></p>';
							}else if(contentSet.content6==null||contentSet.content6=='null'){
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content4+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content5+'</span></p>';
							}else{
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content4+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content5+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-success">'+contentSet.content6+'</span></p>';
							}//if(contentSet.content2==null||contentSet.content2=='null'){						
						}else if(contentCoin >5 && contentCoin <=10){
							content_html += '<p id="centerInfo_coin"><span class="label label-primary">'+contentCoin+'</span>&nbsp;<span class="label label-primary">'+contentSet.content1+'</span>&nbsp;';
							if(contentSet.content2==null||contentSet.content2=='null'){
								content_html+='</p>';
							}else if(contentSet.content3==null||contentSet.content3=='null'){
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content2+'</span>&nbsp;';
							}else if(contentSet.content4==null||contentSet.content4=='null'){
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content3+'</span></p>';
							}else if(contentSet.content5==null||contentSet.content5=='null'){
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content4+'</span></p>';
							}else if(contentSet.content6==null||contentSet.content6=='null'){
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content4+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content5+'</span></p>';
							}else{
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content4+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content5+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-primary">'+contentSet.content6+'</span></p>';
							}//if(contentSet.content2==null||contentSet.content2=='null'){	
						}else if(contentCoin > 10){
							content_html += '<p id="centerInfo_coin"><span class="label label-danger">'+contentCoin+'</span>&nbsp;<span class="label label-danger">'+contentSet.content1+'</span>&nbsp;';
							if(contentSet.content2==null||contentSet.content2=='null'){
								content_html+='</p>';
							}else if(contentSet.content3==null||contentSet.content3=='null'){
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content2+'</span>&nbsp;';
							}else if(contentSet.content4==null||contentSet.content4=='null'){
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content3+'</span></p>';
							}else if(contentSet.content5==null||contentSet.content5=='null'){
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content4+'</span></p>';
							}else if(contentSet.content6==null||contentSet.content6=='null'){
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content4+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content5+'</span></p>';
							}else{
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content2+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content3+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content4+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content5+'</span>&nbsp;';
								content_html+='&nbsp;<span class="label label-danger">'+contentSet.content6+'</span></p>';
							}//if(contentSet.content2==null||contentSet.content2=='null'){
						}//if(contentCoin<=5 )
						}//for(var i=0; i<content.length; i++)
					$("#centerInfo_coin_div").html(content_html);
						}//if(!data)
				}//success:function(data)
		});//ajax content list ends
}//function show(){

function keywordSearch(){
	searchOn=true;
	var keyword = $("#search_input").val();
	$("#search_input").val('');
	$.ajax({
		url:"centerSearch.do",
		type:"GET",
		data: {"keyword":keyword},
		success:function(data){
			$("#ajax").remove();
			var strData = data;
			var objData = eval('('+strData+')');
			var company = objData.company_list;
			if(!data){
				window.alert("ajax load fail!");
				return false;
			}else if(company.length==0){
				alert("검색 결과가 없습니다.");
				closeAllMarkInfo();
				removeMarker();
				listRemove();
				searchReset(0);
				removeMore()
				return false;
			}//if(!data){
			/*초기세팅 및 전부 삭제*/
			searchOn = true;
			closeAllMarkInfo();
			removeMarker();
			listRemove();
			searchReset(company.length);
			var points=[];
			var point;
			var bounds = new daum.maps.LatLngBounds(); //맵 바운드
			var companySet;
			var companyIdx;
			var searchCoIdx=[];
			for(var i=0; i<company.length; i++){
				/*검색 후 리스트의 주소값 저장 후 맵 바운드 설정*/
				companySet=company[i];
				companyIdx=companySet.co_idx;
				searchCoIdx[i]=companyIdx;
				point = new daum.maps.LatLng(companySet.co_lat, companySet.co_lng);
				points[i]=point;
				bounds.extend(points[i]);
				markers[companyIdx].setMap(map);
				map.setBounds(bounds);
			}//for(var i=0; i<markers.length; i++)
				
				/*마커에 따른 list 생성*/
				console.log("company.length="+company.length);
				var companySet2;
				var numDiv1=0;
				var n1=1;
				var searchHtml;
				for(var i=0; i<company.length; i++){
					searchHtml='';
					companySet2=company[i];
					if(n1>4){
						searchHtml+='<div class="col-sm-6 panel panel-default hiddenCnt" id="centerInfo_list_div">';
						searchHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
						searchHtml+='<a href="javascript:show('+companySet2.co_idx+',';
						searchHtml+="'";
						searchHtml+="centerDetail.do?co_idx="+companySet2.co_idx;
						searchHtml+="'";
						searchHtml+=')">';
						searchHtml+='<img src="resources/centerImage/'+companySet2.co_view+'/'+companySet2.co_view+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
						searchHtml+='</a>';
						searchHtml+='</div>';
						searchHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
						searchHtml+='<div class="panel-group" id="list-table">';
						searchHtml+='<div class="panel panel-default">';
						searchHtml+='<div class="panel-heading">';
						searchHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+companySet2.co_name+'<span class="bg-info" id="center_list_coName_class">('+companySet2.co_class+')</span></h6>';
						searchHtml+='</div>'; //panel-heading
						searchHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
						searchHtml+='<ul class="list-group">';
						searchHtml+='<li class="list-group-item">'+companySet2.co_address+'</li>';
						searchHtml+='</ul>';
						searchHtml+='</div>'; //colapse panel1
						searchHtml+='<div class="panel-body">';
						searchHtml+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
						searchHtml+='</div>'; //colapse panel open1
						searchHtml+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
						searchHtml+='<ul class="list-group">';
						searchHtml+='<li class="list-group-item"><b>'+companySet2.co_class+'</b>-'+contents[i]+'</li>';
						searchHtml+='</ul>';
						searchHtml+='</div>'; //collapse panel2
						searchHtml+='<div class="panel-body">';
						searchHtml+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
						searchHtml+='</div>'; //collapse panel open 2
						searchHtml+='</div>';//panel default
						searchHtml+='</div>'; //panel group
						searchHtml+='</div>'; //panel final
						searchHtml+='</div>'; //panel final
						$("#centerInfo_list").append(searchHtml);
						moreButton();	
					}else{
						searchHtml+='<div class="col-sm-6 panel panel-default" id="centerInfo_list_div">';
						searchHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
						searchHtml+='<a href="javascript:show('+companySet2.co_idx+',';
						searchHtml+="'";
						searchHtml+="centerDetail.do?co_idx="+companySet2.co_idx;
						searchHtml+="'";
						searchHtml+=')">';
						searchHtml+='<img src="resources/centerImage/'+companySet2.co_view+'/'+companySet2.co_view+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
						searchHtml+='</a>';
						searchHtml+='</div>';
						searchHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
						searchHtml+='<div class="panel-group" id="list-table">';
						searchHtml+='<div class="panel panel-default">';
						searchHtml+='<div class="panel-heading">';
						searchHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+companySet2.co_name+'<span class="bg-info" id="center_list_coName_class">('+companySet2.co_class+')</span></h6>';
						searchHtml+='</div>'; //panel-heading
						searchHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
						searchHtml+='<ul class="list-group">';
						searchHtml+='<li class="list-group-item">'+companySet2.co_address+'</li>';
						searchHtml+='</ul>';
						searchHtml+='</div>'; //colapse panel1
						searchHtml+='<div class="panel-body">';
						searchHtml+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
						searchHtml+='</div>'; //colapse panel open1
						searchHtml+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
						searchHtml+='<ul class="list-group">';
						searchHtml+='<li class="list-group-item"><b>'+companySet2.co_class+'</b>-'+contents[i]+'</li>';
						searchHtml+='</ul>';
						searchHtml+='</div>'; //collapse panel2
						searchHtml+='<div class="panel-body">';
						searchHtml+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
						searchHtml+='</div>'; //collapse panel open 2
						searchHtml+='</div>';//panel default
						searchHtml+='</div>'; //panel group
						searchHtml+='</div>'; //panel final
						searchHtml+='</div>'; //panel final
						$("#centerInfo_list").append(searchHtml);
						removeMore();
					}
					n1++;
					if(numDiv1%1==0&&numDiv1%2!=0){
						var line='<div class="col-sm-12" id="listline"></div>';
						$("#centerInfo_list").append(line);
					}//div line 붙이기 if 문
					numDiv1++;
				}//for(var i=0; i<company.length; i++)
				mapOn=false;
		}//success:function(data)
});//$.ajax
}//function keywordSearch()
</script>
</body>
</html>