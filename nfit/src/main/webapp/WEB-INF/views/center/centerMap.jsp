<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("utf-8"); %>
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
	  		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=55702a1d09804903d4550080da539868&libraries=services"></script>
	  <link rel="shortcut icon" href="resources/images/n-1x-170x128.jpg" type="image/x-icon">
<title>Insert title here</title>
<style>
/* 
div{
border:1px solid black;
} 
*/
#centerInfo_list_div{
font-size:12px;
}

/* 
#centerInfo_list_div #list-div-img{
max-height:200px;
}

#centerInfo_list_div #list-div-table{
max-height:100px;
}

#centerInfo_list_div #list-div-img img{
max-height:170px;
}

*/
#centerInfo-list-table{
padding:0 0 0 0;
}
#list-table{
margin:0 0 0 0;
font-size:12px;
} 

#center-addr-btn{
/* 
min-height: 20px;
min-width: 40px; 
*/
}
#infowindow{
z-index:500;
}
#map_part{
z-index:100;
}
#center_list{
/*업체 백업 테이블*/
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
border-top: 10px solid #16f98f;
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
}
#avail_photo{
height:34px;
width:34px;
}
#centerInfo #centerInfo_panel #centerInfo_head #centerInfo_coname{
text-align:center;
}

</style>
</head>
<body>
<%@include file="../header.jsp" %>
33.450701, 126.570667<br>
edd938c4fc341b07f90ed69064de3f92<br>
95b97b04d035d60f73995902d8ae2cd0<br>
3564ccb62994635b131231fb19ae3e7d<br>
55702a1d09804903d4550080da539868<br>
<div class="container-fluid">
<!-- 업체 리스트 부분 -->
		<div class="row">
		<!-- 검색하기 -->
		<div class="col-sm-6">
		<div class="col-sm-12">
		<form>
    	<div class="input-group">
      		<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
      		<input id="search" type="text" class="form-control" name="search" placeholder="검색어 입력">
    	</div>
    	</form>
		<hr>
		</div>
		<div class="col-sm-12">
			<div id="centerInfo_list">
			<!--  -->

			<!--  -->
			</div>
			<div id="moreBtn">
			</div>
		</div>
	</div>
		
<!-- 맵 부분 -->
			<div class="col-sm-6"></div>
			<div class="col-sm-6" id="map_part">
				<div id="map" style="width: 100%; height:360px;"></div>
			</div>
		</div>
		
<!--  업체 백업 부분 -->
		<div class="row">
		<div class="col-sm-12" id="center_list">
			<h3>search area</h3>
			<c:set var="centerList" value="${list}"/>
			<table class="table table-bordered" id="table">
			<thead>
			<tr>
			<th>co_idx</th>
			<th>co_name</th>
			</tr>
			</thead>
			<tbody id="center_list_tbody">
			<c:if test="${empty centerList}">
			<tr>
			<td colspan="2" align="center">no data</td>
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
			</tr>
				<%cnt++;%>
			</c:forEach>
			</tbody>
			</table>
			<input type="hidden" value="<%=cnt%>" id="count">
			</div>
		</div>
	</div>
	
<!-- 제휴업체 패널 부분 -->
<div class="container" id="centerInfo">
<div class="panel panel-default" id="centerInfo_panel">
<a class="btn" id="close" role="button">
<span class="glyphicon glyphicon-remove" id="close_icon"></span>
</a>
<div class="panel-heading" id="centerInfo_head">
<h3 id="centerInfo_coname">Company Name</h3>
</div>
<div class="panel-body" id="centerInfo_body">
<div class="row" id="coImg">
<img alt="center" src="resources/images/K-010.jpg" class="img-rounded img-responsive" id="centerInfo_img">
</div>
<div class="row" id="coAddr">
<div class="col-sm-12">
<p class="glyphicon glyphicon-flag" id="centerInfo_address"></p>
</div>
<div class="col-sm-12">
<p class="glyphicon glyphicon-phone-alt" id="centerInfo_phone"></p>
</div>
<div class="col-sm-12">
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
<td><span id="">시</span></td>
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
<hr>
<%@include file="../footer.jsp" %>
<script type="text/javascript">
//var------------------------
var markers=[];
var count = $("#center_list_tbody > tr").length;
var coName =[];
var addr=[];
var co_idx=[];
var centerListUrl=[];
var coClass=[];
var coImgs=[];
var cName;
var cIdx;
var cAddr;
var cUrl;
var cClass;
var cImg;
var infoWindows=[]; //인포윈도우
var moreN; //더보기 눌렀을 때 보여질 리스트 수
//-------------------------------------
console.log("count="+count);

/*geolocation 구현*/
var mapContainer = document.getElementById('map');
var mapOption = {
	center : new daum.maps.LatLng(37.566535, 126.97796919999999),
	level : 8
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

/*이름과 주소 가져오기 및 */
window.onload=function (){
	console.log("i reached here~ start");
for(var i=0; i<count;i++){
	cName=document.getElementById('co_name_'+i).innerHTML;
	cAddr=document.getElementById('co_address_'+i).value;
	cIdx=document.getElementById('co_idx_idx_'+i).innerHTML;
	cUrl=document.getElementById('centerUrl_'+i).innerHTML;
	cClass=document.getElementById('coClass_'+i).innerHTML;
	cImg=document.getElementById('centerImg_'+i).innerHTML;
	getMarker(cAddr, cName, cIdx, cUrl, cClass, cImg, i);
}
searchMark();
}

/*지도 확대 축소 컨트롤러*/
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMLEFT);

/*지도 움직일 때 마크 및 백업 리스트 생성*/
daum.maps.event.addListener(map, 'zoom_changed', searchMark);
daum.maps.event.addListener(map, 'dragend', searchMark);
function searchMark(){
	console.log("searchMark");
	listRemove();
	if(markers!=null||markers!=''){
	removeMarker();
	var bounds=map.getBounds();
	var n=1; // 현재 맵에 뿌려진 리스트 수
	var hiddenN=0; //감춰진 list
	//↓보여질 리스트 행 수
	var appendN = (Math.round(markers.length/2)); 
	//↓ 더보기로 보여질 행 수
	moreN = (Math.ceil(appendN/2)); 
	for(var i=0; i<markers.length; i++){
	console.log("n="+n);
		if(bounds.contain(markers[i].getPosition())){
			markers[i].setMap(map);
			console.log("centerListUrl[i]="+centerListUrl[i]);
			/*table append 부분*/
			var selectoHtml='';
			if(n>4){
			selectoHtml+='<div class="col-sm-6 panel panel-primary hiddenCnt" id="centerInfo_list_div">';
			selectoHtml+='<div class="panel-body col-sm-12">';
			selectoHtml+='<a href="javascript:show('+co_idx[i]+',';
			selectoHtml+="'";
			selectoHtml+=centerListUrl[i];
			selectoHtml+="'";
			selectoHtml+=')">';
			selectoHtml+='<img src="resources/centerImage/'+coImgs[i]+'/'+coImgs[i]+'_1.jpg" id="list-img" alt="center"  style="width:100%" class="img-responsive">';
			selectoHtml+='</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo-list-table">';
			selectoHtml+='<div class="panel-group" id="list-table">';
			selectoHtml+='<div class="panel panel-default">';
			selectoHtml+='<div class="panel-heading">';
			selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coName[i]+'</h6>';
			selectoHtml+='</div>';
			selectoHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
			selectoHtml+='<ul class="list-group">';
			selectoHtml+='<li class="list-group-item">'+addr[i]+'</li>';
			selectoHtml+='</ul>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body">';
			selectoHtml+='<a class="btn btn-primary btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-heading">';
			selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coClass[i]+'</h6>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			$("#centerInfo_list").append(selectoHtml);
			moreButton();
			}else{
			selectoHtml+='<div class="col-sm-6 panel panel-primary" id="centerInfo_list_div">';
			selectoHtml+='<div class="panel-body col-sm-12">';
			selectoHtml+='<a href="javascript:show('+co_idx[i]+',';
			selectoHtml+="'";
			selectoHtml+=centerListUrl[i];
			selectoHtml+="'";
			selectoHtml+=')">';
			selectoHtml+='<img src="resources/centerImage/'+coImgs[i]+'/'+coImgs[i]+'_1.jpg" id="list-img" alt="center"  style="width:100%" class="img-responsive">';
			selectoHtml+='</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body col-sm-12" id="centerInfo-list-table">';
			selectoHtml+='<div class="panel-group" id="list-table">';
			selectoHtml+='<div class="panel panel-default">';
			selectoHtml+='<div class="panel-heading">';
			selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coName[i]+'</h6>';
			selectoHtml+='</div>';
			selectoHtml+='<div id="centerInfo_list_coAddr_'+i+'" class="panel-collapse collapse">';
			selectoHtml+='<ul class="list-group">';
			selectoHtml+='<li class="list-group-item">'+addr[i]+'</li>';
			selectoHtml+='</ul>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-body">';
			selectoHtml+='<a class="btn btn-primary btn-block btn-xs" id="center-addr-btn" data-toggle="collapse" href="#centerInfo_list_coAddr_'+i+'">주소보기</a>';
			selectoHtml+='</div>';
			selectoHtml+='<div class="panel-heading">';
			selectoHtml+='<h6 class="panel-title" id="centerInfo_list_coName">'+coClass[i]+'</h6>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			selectoHtml+='</div>';
			$("#centerInfo_list").append(selectoHtml);
			}
			n++;
		}else{
			markers[i].setMap(null);
		}//if method ends
	}// for method ends
	}//if markers check method ends
}//searchMark문 end

/*리스트 전부 끄기*/
function listRemove(){
		$("#centerInfo_list").empty();
}

/*더 보기 버튼 생성*/
function moreButton(){
	$("#moreBtn").empty()
	var $button ='<hr><a href="javascript:more()" class="col-sm-12 btn btn-info">더보기 more()</a>';
	if((".hiddenBtn").length>0){
		$("#moreBtn").html($button);
	}
}

/*더보기 메소드*/
function more(){
	console.log("i reached here~")
	$("#centerInfo_list > .hiddenCnt").css({display:""});
	$("div").removeClass("hiddenCnt");
	checkHidden();
	function checkHidden(){
		var hiddenLength = $(".hiddenCnt").length;
		console.log("hiddenLength="+hiddenLength);
		if(hiddenLength==0){
			$("#moreBtn").empty();
		}
	}
}

/*마커 생성 및 클릭 이벤트*/
function getMarker(cAddr, cName, cIdx, cUrl, cClass, cImg, i){
	var geocoder = new daum.maps.services.Geocoder();
	var marker;
	var infowindow;
	geocoder.addr2coord(cAddr, function(status, result) {
	     if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        marker = new daum.maps.Marker({
	        	map:map,
	        	position: coords,
	            clickable: true
	        });
	        coName[i]=cName;
	        addr[i]=cAddr;
	        co_idx[i]=cIdx;
	        centerListUrl[i]=cUrl;
	        coClass[i]=cClass;
	        coImgs[i]=cImg;
	        markers[i]=marker;
	        infowindow = new daum.maps.InfoWindow({
	        content: '<div id="infowindow">'+cIdx+"/"+cName+'</div>'
	        });
	        infoWindows.push(infowindow);
	        daum.maps.event.addListener(marker,'click', makeClickListener(map, marker, infowindow, cIdx, cUrl));
	    }
	});
	function makeClickListener(){
		return function(){
				closeAllMarkInfo();
				infowindow.open(map, marker);
				show(cIdx, cUrl);
			}
	}
}


	/*업체 상세 aside 떠오르기*/
function show(co_idx, centerListUrl){
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
				btn_html += "<a class='col-sm-12 btn btn-default' href='"+centerListUrl+"' id='coBtn_button'>자세히보기</a>";
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
				coView_html='<img alt="center" src="resources/centerImage/'+dataObj.co_view+'/'+dataObj.co_view+'_1.jpg" class="img-rounded img-responsive" id="centerInfo_img">';
				$("#centerInfo_img").replaceWith(coView_html);
				
				/*co_avail*/
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
				
				/*co_regul*/
				$("#centerInfo_avail").replaceWith(coAvail_html);
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
				var geocoder = new daum.maps.services.Geocoder();
				geocoder.addr2coord(dataObj.co_address,function(status,result){
					var movePosition = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
					map.setCenter(movePosition);	
				});
				}
			}
		});
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
							if(usetimeSet.usetime_time==0||usetimeSet.usetime_time=='0'){
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
					var content_html = '';
					for(var i=0; i<content.length; i++){
						var contentSet = content[i];
						content_html = '<p id="centerInfo_coin"><span class="glyphicon glyphicon-play-circle" ></span><span>&nbsp;'+contentSet.content_coin+'&nbsp;'+contentSet.content1+'</span>';
						if(contentSet.content2==null||contentSet.content2=='null'){
							content_html+='</p>';
						}else if(contentSet.content3==null||contentSet.content3=='null'){
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content2+'</span></p>';
						}else if(contentSet.content4==null||contentSet.content4=='null'){
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content2+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content3+'</span></p>';
						}else if(contentSet.content5==null||contentSet.content5=='null'){
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content2+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content3+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content4+'</span></p>';
						}else if(contentSet.content6==null||contentSet.content6=='null'){
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content2+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content3+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content4+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content5+'</span></p>';
						}else{
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content2+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content3+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content4+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content5+'</span>';
							content_html+='<kbd class="glyphicon glyphicon-plus"></kbd><span>'+contentSet.content6+'</span></p>';
						}
						}
					}
				$("#centerInfo_coin").replaceWith(content_html);
				}
		});
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
	
</script>

</body>
</html>