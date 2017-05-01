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

div{
border:1px solid black;
} 

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
position:absolute;bottom:10px;right:10px;z-index:1;
width:89%;
text-align:right;
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
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<!-- 업체 리스트 부분 -->
<div class="container-fluid" id="container">
<div class="row" id="container_row">
		<div class="col-sm-6" id="centerListResult">
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
			<div class="col-sm-6" id="map_part">
				<div id="map"></div>
				<div id="map_zoom">
				<div>
					<button data-toggle="modal" data-target="#myModal1" onclick="" type="button" class="btn btn-danger btn-sm" ><span class="glyphicon glyphicon-map-marker"></span></button>				
					<button data-toggle="modal" data-target="#myModal2" onclick="" type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-screenshot"></span></button>				
					<button onclick="javascript:zoomIn()" type="button" class="btn btn-basic btn-sm"><span class="glyphicon glyphicon-plus"></span></button>				
					<button onclick="javascript:zoomOut()" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-minus"></span></button>				
				</div>
				</div>
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
			<th>co_class</th>
			<th>co_phone</th>
			<th>co_lat</th>
			<th>co_lng</th>
			</tr>
			</thead>
			<tbody id="center_list_tbody">
			<c:if test="${empty centerList}">
			<tr>
			<td colspan="4" align="center">no data</td>
			</tr>
			</c:if>
			<% int cnt=1; %>
			<c:forEach var="dto" items="${centerList}" begin="0"  step="1" varStatus="status">
			<c:url var="centerListUrl" value="centerDetail.do">
			<c:param name="co_idx">${dto.co_idx}</c:param>
			</c:url>
			<tr>
			<td><span id="co_idx_idx_${status.index}">${dto.co_idx }</span><span id="centerUrl_${status.index}" style="display:none;">${centerListUrl}</span></td>
			<td>
			<a href="javascript:show(${dto.co_idx}, '${centerListUrl}')" id="co_name_${status.index}" class="coName">${dto.co_name}</a>
			<input type="hidden" id="co_address_${status.index}" value="${dto.co_address}">
			</td>
			<td><span id="coClass_${status.index}">${dto.co_class}</span></td>
			<td><span id="centerImg_${status.index}">${dto.co_view}</span></td>
			<td><span id="centerLat_${status.index}">${dto.co_lat}</span></td>
			<td><span id="centerLng_${status.index}">${dto.co_lng}</span></td>
			</tr>
				<%cnt++;%>
			</c:forEach>
			</tbody>
			</table>
			<input type="hidden" value="<%=cnt%>" id="count">
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
	<input type="text" value="${sessionScope.saveid}" id="userid">
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

/*맵 추적 기능*/
var newMarker=[];
var newInfowindow=[];
function getAddr(){
	var addr = $("#sample4_roadAddress").val();
	console.log(addr);
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.addr2coord(addr, function (status, result){
		if(status==daum.maps.services.Status.OK){
			var imageSrc = 'resources/images/map-marker-icon.png'; // 마커이미지의 주소입니다    
		    var imageSize = new daum.maps.Size(64, 69); // 마커이미지의 크기입니다
		    var imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
			var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
			var marker = new daum.maps.Marker({
				map:map,
				position:coords,
				image:markerImage,
		        draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
		        clickable:true,
		        title: '오른쪽 클릭시 제거'
			});
			newMarker.push(marker);
			
			var infowindow = new daum.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:10px;"><span class="bg-warning">주소<span>: '+addr+'</div>',
				removable:true
			});
			newInfowindow.push(infowindow);
			infowindow.open(map, marker);
			map.setCenter(coords);
		}//if(status==daum.maps.services.Status.OK){
		daum.maps.event.addListener(marker, 'rightclick', function(mouseEvent){
			marker.setMap(null);
		});//daum.maps.event.addListener(newMarker, 'rightclick', function(mouseEvent){
	});//geocoder.addr2coord(addr, function (status, result){
}//function getAddr(){


/*즐겨찾기 기능*/
var user_id = $("#userid").val();
console.log("user_id="+user_id);


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

/*content 내용 불러오기*/
//var content_list 세팅

 var contents=[];
 var content1;
 var content2;
 var content3;
 var content4;
 var content5;
 var content6;
 var contentCnt = $("#content_list_tbody > tr").length;
 var contentLists=[];
 var contentIdx=[];
 
//var------------------------
var markers=[];
var count = $("#center_list_tbody > tr").length;
var coName =[];
var addr=[];
var co_idx=[];
var centerListUrl=[];
var coClass=[];
var coImgs=[];
var cLatArr=[];
var cLngArr=[];
var cName;
var cIdx;
var cAddr;
var cUrl;
var cClass;
var cImg;
var cLat;
var cLng;
var infoWindows=[]; //인포윈도우
var moreN; //더보기 눌렀을 때 보여질 리스트 수
var startCheck=false;
var mapOn=false; //리스트 생성 여부 : 맵 움직을때만 
var searchOn = false;
var infoContent;
//-------------------------------------
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

window.onload=mapStart();

/*이름과 주소 가져오기*/
function mapStart(){
	searchOn = false;
	closeAllMarkInfo();
	removeMarker();
	removeMore();
	contents=[];
	contentLists=[];
	$("#search_initialization").empty();
	/*content_list 세팅*/
	var finalCnt = $(".content_idx_cnt:last").text();
	for(var i=1; i<=contentCnt; i++){//content_list 정보
		var idxCnt=$("#content_list_co_idx_"+i+":last").text();
		content1 = $("#content_list_content1_"+i).text();
		content2 = $("#content_list_content2_"+i).text();
		content3 = $("#content_list_content3_"+i).text();
		content4 = $("#content_list_content4_"+i).text();
		content5 = $("#content_list_content5_"+i).text();
		content6 = $("#content_list_content6_"+i).text();
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
		for(var j=1; j<=finalCnt; j++){
			if(j==idxCnt){
				if(contents[j]==null){
				contents[j]="";
				}
				contents[j]+=(content1
						+content2
						+content3
						+content4
						+content5
						+content6);
			}//if null handling ends

		}// for contents[j] ends
	}//for content list ends
for(var i=0; i<count;i++){ //center_list 정보
	cName=document.getElementById('co_name_'+i).innerHTML;
	cAddr=document.getElementById('co_address_'+i).value;
	cIdx=document.getElementById('co_idx_idx_'+i).innerHTML;
	cUrl=document.getElementById('centerUrl_'+i).innerHTML;
	cClass=document.getElementById('coClass_'+i).innerHTML;
	cImg=document.getElementById('centerImg_'+i).innerHTML;
	cLat=document.getElementById('centerLat_'+i).innerHTML;
	cLng=document.getElementById('centerLng_'+i).innerHTML;
	getMarker(cAddr, cName, cIdx, cUrl, cClass, cImg, cLat, cLng, i);
}//for center list ends
searchMark();
}//mapStart() ends

/*지도 확대 축소 컨트롤러*/
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMLEFT);
setTimeout(searchMark, 500);

/*지도 움직일 때 마크 및 백업 리스트 생성*/
if(searchOn==true){
}else if(searchOn==false){
daum.maps.event.addListener(map, 'zoom_changed', searchMark);
daum.maps.event.addListener(map, 'dragend', searchMark);
}
function searchMark(){
	if(searchOn==true){
		return false;
	}//if searchOn true ends
	if(markers!=null||markers!=''){
	if(startCheck==false){//첫 접속일 경우 마크 생성 후 리스트만 제거
	startCheck=true;
	listRemove();
	}else if(startCheck==true){//지도 움직일 경우 리스트와 마크 제거
	if(mapOn==false){//맵 마우스로 움직일 때만 전체 삭제
		listRemove();
 		removeMarker();
	}//if mapOn ends
	}
	var bounds=map.getBounds();
	var n=1; // 현재 맵에 뿌려진 리스트 수
	var hiddenN=0; //감춰진 list
	//↓보여질 리스트 행 수
	var appendN = (Math.round(markers.length/2)); 
	//↓ 더보기로 보여질 행 수
	moreN = (Math.ceil(appendN/2));
	var numDiv=0;
	if(mapOn==false){ //맵 마우스로 움직일 경우만 마크 생성
	var selectoHtml;
	removeMore();
	/*마커에 따른리스트 생성*/
	for(var i=0; i<markers.length; i++){
		if(bounds.contain(markers[i].getPosition())){
			markers[i].setMap(map);
			/*table append 부분*/
			selectoHtml='';
			if(n>4){
			selectoHtml+='<div class="col-sm-6 panel panel-default hiddenCnt" id="centerInfo_list_div">';
			selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
			selectoHtml+='<a href="javascript:show('+co_idx[i]+',';
			selectoHtml+="'";
			selectoHtml+=centerListUrl[i];
			selectoHtml+="'";
			selectoHtml+=')">';
			selectoHtml+='<img src="resources/centerImage/'+coImgs[i]+'/'+coImgs[i]+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
			selectoHtml+='</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
			selectoHtml+='<div class="panel-group" id="list-table">';
			selectoHtml+='<div class="panel panel-default">';
			selectoHtml+='<div class="panel-heading">';
			selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coName[i]+'<span class="bg-info" id="center_list_coName_class">('+coClass[i]+')</span></h6>';
			selectoHtml+='</div>'; //panel-heading
			selectoHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
			selectoHtml+='<ul class="list-group">';
			selectoHtml+='<li class="list-group-item">'+addr[i]+'</li>';
			selectoHtml+='</ul>';
			selectoHtml+='</div>'; //colapse panel1
			selectoHtml+='<div class="panel-body">';
			selectoHtml+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
			selectoHtml+='</div>'; //colapse panel open1
			selectoHtml+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
			selectoHtml+='<ul class="list-group">';
			selectoHtml+='<li class="list-group-item"><b>'+coClass[i]+'</b>-'+contentLists[i]+'</li>';
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
			selectoHtml+='<a href="javascript:show('+co_idx[i]+',';
			selectoHtml+="'";
			selectoHtml+=centerListUrl[i];
			selectoHtml+="'";
			selectoHtml+=')">';
			selectoHtml+='<img src="resources/centerImage/'+coImgs[i]+'/'+coImgs[i]+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
			selectoHtml+='</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
			selectoHtml+='<div class="panel-group" id="list-table">';
			selectoHtml+='<div class="panel panel-default">';
			selectoHtml+='<div class="panel-heading">';
			selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coName[i]+'<span class="bg-info" id="center_list_coName_class">('+coClass[i]+')</span></h6>';
			selectoHtml+='</div>';
			selectoHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
			selectoHtml+='<ul class="list-group">';
			selectoHtml+='<li class="list-group-item">'+addr[i]+'</li>';
			selectoHtml+='</ul>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body">';
			selectoHtml+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
			selectoHtml+='<ul class="list-group">';
			selectoHtml+='<li class="list-group-item"><b>'+coClass[i]+'</b>-'+contentLists[i]+'</li>';
			selectoHtml+='</ul>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body">';
			selectoHtml+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			$("#centerInfo_list").append(selectoHtml);
			removeMore();
			}
			n++;
			if(numDiv%1==0 && numDiv%2!=0){
				selectoHtml='<div class="col-sm-12"></div>';
				$("#centerInfo_list").append(selectoHtml);
			}
		numDiv++;
		}else{
			markers[i].setMap(null);
		}//if bound contain method ends
		
	}// for method ends
	}else{}//if mapOn check method ends list 생성문 마우스로 움직일때만 리스트 형성
	}else{}//if markers 있는지 없는지 check method ends
	mapOn=false;
}//searchMark문 end

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
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

/*지도 확대*/
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

/*마커 생성 및 클릭 이벤트*/
function getMarker(cAddr, cName, cIdx, cUrl, cClass, cImg, cLat, cLng, i){
	var marker;
	var infowindow;
	var coords;
	var latlngData;
	if(cLat!=0 && cLng!=0){ // 위도 경도가 DB에 등록된 경우
		coords = new daum.maps.LatLng(cLat, cLng);
		
		/*마커생성*/
		marker = new daum.maps.Marker({
        	map:map,
        	position: coords,
        	image: markerImage,
            clickable: true
        }); //마커 생성
        coName[i]=cName;
        addr[i]=cAddr;
        co_idx[i]=cIdx;
        centerListUrl[i]=cUrl;
        coClass[i]=cClass;
        coImgs[i]=cImg;
        markers[i]=marker;
        contentLists[i]=contents[cIdx];
        cLatArr[i]=cLat;
        cLngArr[i]=cLng;
        infoContent='<table id="infowindows" class="table table-condensed">'+
        '<thead><tr><th>'+cName+'<div id="infowindows_close" onclick="javascript:closeAllMarkInfo()"><span class="glyphicon glyphicon-remove-circle"></span></div></th></tr></thead>'+
        '<tbody><tr><td>'+cAddr+'</td></tr></tbody>'+
        '</table>';
        infowindow = new daum.maps.InfoWindow({
        content: infoContent
        }); //infowindow 생성
        infoWindows[i]=(infowindow);


//makingMarkers ends
daum.maps.event.addListener(marker,'click', makeClickListener(map, marker, infowindow, cIdx, cUrl));
	}else{ //위도 경도가 DB에 등록되지 않는 경우
		var geocoder = new daum.maps.services.Geocoder();
	geocoder.addr2coord(cAddr, function(status, result) {
	     if (status === daum.maps.services.Status.OK) {
		    coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
		    
		    /*마커생성*/
		    marker = new daum.maps.Marker({
	        	map:map,
	        	position: coords,
	        	image: markerImage,
	            clickable: true
	        }); //마커생성
	        coName[i]=cName;
	        addr[i]=cAddr;
	        co_idx[i]=cIdx;
	        centerListUrl[i]=cUrl;
	        coClass[i]=cClass;
	        coImgs[i]=cImg;
	        markers[i]=marker;
	        contentLists[i]=contents[cIdx];
	        cLat = result.addr[0].lat;
	        cLng = result.addr[0].lng;
	        cLatArr[i]=cLat;
	        cLngArr[i]=cLng;
	        infoContent='<table id="infowindows" class="table table-condensed">'+
	        '<thead><tr><th>'+cName+'<div id="infowindows_close" onclick="javascript:closeAllMarkInfo()"><span class="glyphicon glyphicon-remove-circle"></span></div></th></tr></thead>'+
	        '<tbody><tr><td>'+cAddr+'</td></tr></tbody>'+
	        '</table>';
	        infowindow = new daum.maps.InfoWindow({
	        content: infoContent
	        }); ///infowindow 생성
	        infoWindows[i]=(infowindow);
			latlngData = cIdx+"/"+ cLat+"/"+cLng;
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
				},//ajax success function
				error: function(data){
					alert("ajax fail=");
					return false;
				}// ajax error function
			}); //ajax lat lng ends
	//makingMarkers ends
    daum.maps.event.addListener(marker,'click', makeClickListener(map, marker, infowindow, cIdx, cUrl));
	     }//if status ok ends
	}); //geocoder addr2coord ends
	}//cLnt cLng if check ends
	        
	function makeClickListener(){
		return function(){
				var setMapGo=false;
				closeAllMarkInfo();
				infowindow.open(map, marker);
				show(cIdx, cUrl, setMapGo);
		}
	}//makeClickListener ends
}//getMark ends


	/*업체 상세 aside 떠오르기*/
function show(co_idx, centerListUrl, setMapGo){
	mapOn=true;
	if(infoWindows.length>0){
		closeAllMarkInfo();
	}
	
	$("#centerInfo_panel").animate({
			opacity:1,
			height:'389px'
		},600);
		$("#centerInfo").css({display:"block"});
		$.ajax({
			url : "centerCompany.do",
			type : "GET",
			data : {"co_idx": co_idx},
			success : function(data){
				$("#ajax").remove();
				var dataObj = JSON.parse(data);
				if(!data){
					alert("ajax fail");
					return false;
				}else{
				/*co_idx and button*/
				var btn_html = '';
				btn_html += "<a class='col-sm-12 btn btn-info' href='"+centerListUrl+"' id='coBtn_button'>자세히보기</a>";
				$("#centerInfo_body > #coBtn").css({display:"block"});
				$("#coBtn_button").replaceWith(btn_html);

				/*co_name*/
				var coName_html = '';
				coName_html = "<h4 id='centerInfo_coname'>"+dataObj.co_name+"</h4>";
				$("#centerInfo_coname").replaceWith(coName_html)

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

			if(searchOn==true){
				if(setMapGo==false){//마커를 클릭할 경우
					infoWindows[co_idx].open(map, markers[co_idx]);
					}else{//리스트를 클릭할 경우
					infoWindows[co_idx].open(map, markers[co_idx]);
					var movePosition;
					if(cLatArr[co_idx] != 0 && cLngArr[co_idx] != 0){//db값에 lat lng가 입력된 경우
						movePosition = new daum.maps.LatLng(cLatArr[co_idx], cLngArr[co_idx]);
						map.setCenter(movePosition);
						map.setLevel(4);
					}else{ //db값에 lat lng가 입력되지 않은 경우
						var geocoder = new daum.maps.services.Geocoder();
						geocoder.addr2coord(dataObj.co_address,function(status,result){
							movePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
							infoWindows[co_idx].open(map, markers[co_idx]);
							map.setCenter(movePosition);
							map.setLevel(4);
						});
					}//lat lng 데이터 배이스 여부 확인 후 geo 호출 결정 if 문
					}//if setMapGo ends 지도 움직이기
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			}else if(searchOn==false){
				if(setMapGo==false){//마커를 클릭할 경우
				co_idx-=1;
				infoWindows[co_idx].open(map, markers[co_idx])
				}else{//리스트를 클릭할 경우
				co_idx-=1;
				var movePosition
				if(cLatArr[co_idx] != 0 && cLngArr[co_idx] != 0){//db값에 lat lng가 입력된 경우
				movePosition = new daum.maps.LatLng(cLatArr[co_idx], cLngArr[co_idx]);
				infoWindows[co_idx].open(map, markers[co_idx]);
				map.setCenter(movePosition);
				map.setLevel(4);
				}else{ //db값에 lat lng가 입력되지 않은 경우
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addr2coord(dataObj.co_address,function(status,result){
					movePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
					infoWindows[co_idx].open(map, markers[co_idx]);
					map.setCenter(movePosition);
					map.setLevel(4);
				});
				}//lat lng 데이터 배이스 여부 확인 후 geo 호출 결정 if 문
				}//if setMapGo ends 지도 움직이기
			}//if searchOn false ends
				co_idx+=1;
				}//ajax의 data !=null 경우의 if문 
			} //ajax success function
		});//패널 센터정보 떠오르기 ajax ends
		$.ajax({
			url: "centerUsetime.do",
			type: "GET",
			data: {"co_idx":co_idx},
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
							}
					} 
					useTime_html+="</tbody>";
					$("#centerInfo_time").replaceWith(useTime_html);
				}
			}
		});
		$.ajax({
			url : "centerContent.do",
			type:"GET",
			data: {"co_idx":co_idx},
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
						}//if(contentCoin<=5 ){
						}//for(var i=0; i<content.length; i++){
					$("#centerInfo_coin_div").html(content_html);
						}//if(!data)
				}//	success:function(data){
		});//ajax content list ends
	}//show 끝
	
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

/*인포 전부 끄기*/
function closeAllMarkInfo(){
			for(var i=0; i<infoWindows.length; i++){
				infoWindows[i].close();
			}
		}
/*마크 전부 끄기*/
function removeMarker(){
			if(markers==null){
			return;
			}else{
			for(var i=0; i<markers.length; i++){
				markers[i].setMap(null);
			}
	}
}

/*검색 초기화 */
function searchReset(searchNum){
	$("#search_initialization").empty();
	$("#search_initialization").html('<a href="javascript:mapStart()" class="btn btn-primary btn-block">검색초기화<span class="badge">'+searchNum+'</span></a>');
}



/*검색하기*/
function keywordSearch(){

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
			}
			/*초기세팅 및 전부 삭제*/
			searchOn = true;
			closeAllMarkInfo();
			removeMarker();
			listRemove();
			searchReset(company.length);
			var numDiv1=0;
			var n1=0;
			var points=[];
			var bounds = new daum.maps.LatLngBounds(); //맵 바운드
			var marker;
			var infowindow;
	
			/***************************************************idx 체크 후 content 대입**********************************************************************/
			contents=[];
			contentLists=[];
			var contentidx=[];
			var contentarr=[];
			for(var i=0; i<company.length; i++){
				var contentSet=company[i];
				contentidx[i]=contentSet.co_idx;
			}
			var cnt;
			for(var i=0; i<company.length; i++){
				contentLists[i]='';
				for(var j=0; j<contentCnt; j++){
					contentarr[j]=$("#content_list_co_idx_"+(j+1)).text();
					if(contentidx[i]==contentarr[j]){
						content1 = $("#content_list_content1_"+(j+1)).text();
						content2 = $("#content_list_content2_"+(j+1)).text();
						content3 = $("#content_list_content3_"+(j+1)).text();
						content4 = $("#content_list_content4_"+(j+1)).text();
						content5 = $("#content_list_content5_"+(j+1)).text();
						content6 = $("#content_list_content6_"+(j+1)).text();
						var comma=", ";
						if(content2!=""&&content2!=" "&&content2!="null"){
							content1+=", ";
						}
						if(content3!=""&&content3!=" "&&content3!="null"){
							content2+=", ";
						}
						if(content4!=""&&content4!=" "&&content4!="null"){
							content3+=", ";
						}
						if(content5!=""&&content5!=" "&&content5!="null"){
							content4+=", ";
						}
						if(content6!=""&&content6!=" "&&content6!="null"){
							content5+=", ";
						}
						if(content1!=""&&content1!=" "&&content1!="null"){
							content6+=", ";
						}
						contentLists[i]+=content1
						+content2
						+content3
						+content4
						+content5
						+content6;	
					
					}//if(contentidx[i]==contentarr[j]
				}//for(var j=0; j<contentCnt; j++){
			}//for(var i=0; i<contentidx.length; i++){
			/***************************************************end: idx 체크 후 content 대입**********************************************************************/
			
			/*검색 후 리스트의 주소값 저장 후 맵 바운드 설정*/
			for(var i=0; i<company.length; i++){
			var companySet = company[i];
			point= new daum.maps.LatLng(companySet.co_lat, companySet.co_lng);
			points[i]=point;
			bounds.extend(points[i]);

			/*주소값으로 마커 및 인포윈도우 생성*/
			marker=new daum.maps.Marker({
				position:points[i],
				image:markerImage,
			 	clickable:true
			});//마커 생성
			markers[companySet.co_idx]=marker;
			marker.setMap(map);
			infoContent='<table id="infowindows" class="table table-condensed">'+
	        '<thead><tr><th>'+companySet.co_name+'<div id="infowindows_close" onclick="javascript:closeAllMarkInfo()"><span class="glyphicon glyphicon-remove-circle"></span></div></th></tr></thead>'+
	        '<tbody><tr><td>'+companySet.co_address+'</td></tr></tbody>'+
	        '</table>';
			infowindow = new daum.maps.InfoWindow({
				content:infoContent
			});//인포 윈도우 생성
			infoWindows[companySet.co_idx]=infowindow;
			cLatArr[companySet.co_idx]=companySet.co_lat;
			cLngArr[companySet.co_idx]=companySet.co_lng;
			var curl='centerDetail.do?co_idx='+companySet.co_idx;
			clickEventSearch(map, marker, infowindow, companySet.co_idx, curl);
			}//for 맵 바운드 ends
			function clickEventSearch(map, marker, infowindow, co_idx, curl){
				daum.maps.event.addListener(marker, 'click', searchClick(map, marker, infowindow, co_idx, curl));
				function searchClick(){
					return function(){
						var setMapGo=false;
						infowindow.open(map, marker);
						show(co_idx, curl, setMapGo);
					}//return function ends
				}//searchClick function ends
			}//clickEventSearch ends

			/*맵 이동*/
			map.setBounds(bounds);
			
			/*리스트 생성*/
			listRemove();
			for(var i=0; i<company.length; i++){
				var companySet = company[i];
				var company_html='';
				var point;
				if(n1>3){
					company_html+='<div class="col-sm-6 panel panel-default hiddenCnt" id="centerInfo_list_div">';
					company_html+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
					company_html+='<a href="javascript:show('+companySet.co_idx+',';
					company_html+="'";
					company_html+="centerDetail.do?co_idx="+companySet.co_idx;
					company_html+="'";
					company_html+=')">';
					company_html+='<img src="resources/centerImage/'+companySet.co_view+'/'+companySet.co_view+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
					company_html+='</a>';
					company_html+='</div>';
					company_html+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
					company_html+='<div class="panel-group" id="list-table">';
					company_html+='<div class="panel panel-default">';
					company_html+='<div class="panel-heading">';
					company_html+='<h6 class="panel-title" id="centerInfo_list_coName">'+companySet.co_name+'<span class="bg-info" id="center_list_coName_class">('+companySet.co_class+')</span></h6>';
					company_html+='</div>'; //panel-heading
					company_html+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
					company_html+='<ul class="list-group">';
					company_html+='<li class="list-group-item">'+companySet.co_address+'</li>';
					company_html+='</ul>';
					company_html+='</div>'; //colapse panel1
					company_html+='<div class="panel-body">';
					company_html+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
					company_html+='</div>'; //colapse panel open1
					company_html+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
					company_html+='<ul class="list-group">';
					company_html+='<li class="list-group-item"><b>'+companySet.co_class+'</b>-'+contentLists[i]+'</li>';
					company_html+='</ul>';
					company_html+='</div>'; //collapse panel2
					company_html+='<div class="panel-body">';
					company_html+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
					company_html+='</div>'; //collapse panel open 2
					company_html+='</div>';//panel default
					company_html+='</div>'; //panel group
					company_html+='</div>'; //panel final
					company_html+='</div>'; //panel final
					$("#centerInfo_list").append(company_html);	
				}else{
					company_html+='<div class="col-sm-6 panel panel-default" id="centerInfo_list_div">';
					company_html+='<div class="panel-body col-sm-12" id="centerInfo_list_img">';
					company_html+='<a href="javascript:show('+companySet.co_idx+',';
					company_html+="'";
					company_html+="centerDetail.do?co_idx="+companySet.co_idx;
					company_html+="'";
					company_html+=')">';
					company_html+='<img src="resources/centerImage/'+companySet.co_view+'/'+companySet.co_view+'_0.jpg" id="list_img" alt="center"  class="img-responsive">';
					company_html+='</a>';
					company_html+='</div>';
					company_html+='<div class="panel-body col-sm-12" id="centerInfo_list_table">';
					company_html+='<div class="panel-group" id="list-table">';
					company_html+='<div class="panel panel-default">';
					company_html+='<div class="panel-heading">';
					company_html+='<h6 class="panel-title" id="centerInfo_list_coName">'+companySet.co_name+'<span class="bg-info" id="center_list_coName_class">('+companySet.co_class+')</span></h6>';
					company_html+='</div>'; //panel-heading
					company_html+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
					company_html+='<ul class="list-group">';
					company_html+='<li class="list-group-item">'+companySet.co_address+'</li>';
					company_html+='</ul>';
					company_html+='</div>'; //colapse panel1
					company_html+='<div class="panel-body">';
					company_html+='<a class="btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
					company_html+='</div>'; //colapse panel open1
					company_html+='<div id="centerInfo_list_content_'+i+'" class="panel-collapse collapse">';
					company_html+='<ul class="list-group">';
					company_html+='<li class="list-group-item"><b>'+companySet.co_class+'</b>-'+contentLists[i]+'</li>';
					company_html+='</ul>';
					company_html+='</div>'; //collapse panel2
					company_html+='<div class="panel-body">';
					company_html+='<a class="btn-xs" id="centerInfo_list_coClass" data-toggle="collapse" href="#centerInfo_list_content_'+i+'">제공서비스보기</a>';
					company_html+='</div>'; //collapse panel open 2
					company_html+='</div>';//panel default
					company_html+='</div>'; //panel group
					company_html+='</div>'; //panel final
					company_html+='</div>'; //panel final
					$("#centerInfo_list").append(company_html);
				}//i>4 if 문
				n1++;
				if(numDiv1%1==0&&numDiv1%2!=0){
					company_html='<div class="col-sm-12" id="line"></div>';
					$("#centerInfo_list").append(company_html);
				}//div line 붙이기 if 문
				numDiv1++;
			}//for문 센터 리스트 end
			mapOn=false;
		}//ajax success function ends
	})//ajax end
}//keywordSearch() ends

</script>
</body>
</html>