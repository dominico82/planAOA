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
	  <link rel="shortcut icon" href="resources/images/n-1x-170x128.jpg" type="image/x-icon">
<title>Insert title here</title>
<style>
#infowindow{
z-index:500;
}
#map_part{
z-index:100;
}
#center_list{
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
apis.daum.net/maps/maps3.js?apikey=edd938c4fc341b07f90ed69064de3f92&libraries=services<br>
edd938c4fc341b07f90ed69064de3f92<br>
95b97b04d035d60f73995902d8ae2cd0<br>
	<div class="container-fluid">
<!-- 메뉴 바 부분 -->
		<div class="row">
			<h3>menu bar</h3>
		</div>
<!-- 업체 리스트 부분 -->
		<div class="row">
			<div class="col-sm-4">
			<h3>map search</h3>
		<table class="table table-bordered">
		<thead>
		<tr>
		<th>co_idx</th>
		<th>co_name</th>
		</tr>
		</thead>
		<tbody id="centerInfo_list">
		<tr>
		<td><span id="centerInfo_list_coIdx"></span></td>
		<td><a id="centerInfo_list_coName" href=""></a></td>
		</tr>
		</tbody>
		</table>
		</div>
		
<!-- 맵 부분 -->
			<div class="col-sm-8" id="map_part">
				<h3>map area</h3>
				<div id="map" style="width: 100%; height:500px;"></div>
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
			<td><span id="co_idx_idx_${status.index}">${dto.co_idx }</span><span id="centerUrl_${status.index}" style="display:none;">${centerListUrl}</span></td>
			<td>
			<a href="javascript:show(${dto.co_idx}, '${centerListUrl}')" id="co_name_${status.index}" class="coName">${dto.co_name}</a>
			<input type="hidden" id="co_address_${status.index}" value="${dto.co_address}">
			</td>
			</tr>
				<%cnt++;%>
			</c:forEach>
			</tbody>
			</table>
			<input type="hidden" value="<%=cnt%>" id="count">
			</div>
		</div>

<!-- 더보기 테스트 -->
		<hr>
		<div class="row">
		<div class="col-sm-12" id="test1">
		<table class="table">
		<thead>
		<tr>
		<th>co_idx</th>
		<th>co_name</th>
		</tr>
		</thead>
		<tbody id="tbodyTest">
		<c:set var="testCenter" value="${list}"/>
		<c:if test="${empty testCenter}">
		<tr><td colspan="2">No Result</td></tr>
		</c:if>
		<c:forEach var="testList" items="${testCenter}" begin="0" step="1" end="2" varStatus="status">
		<tr>
		<td>${testList.co_idx}<span id="idxTest" style="display:none;">${status.index}</span></td>
		<td>${testList.co_name}</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
			<div class="col-sm-4" id="viewMoreBtn">
			<a href="javascript:test1()" class="btn btn-default">더보기 test1</a>
			</div>
			<hr>
		</div>
	</div>
	<script type="text/javascript">
	var count;
	var startCheck=false;
	var co_idx =0;
	var test2 = 0;
	count = $("#tbodyTest > tr").length;
	function test1(){
		co_idx = $("#tbodyTest > tr > td > #idxTest").length;
		if(startCheck==false){
			co_idx++;
			startCheck==true;
		}
		var totalCnt = $("#count").val();
		for(var i=0; i<5; i++){
			setTimeout(appendHtml(co_idx),200);
			console.log("co_idx=",co_idx);
			co_idx++;
		}
			if(co_idx==totalCnt){
				$("#viewMoreBtn").empty();
			} //이 위 if문 totalCnt end
		 //for문 end
		}//function test1문 end
		
		function appendHtml(co_idx){
			$.ajax({
				url:'centerCompany.do',
				type:'GET',
				data: {"co_idx": co_idx},
				success: function(data){
					$("#ajax").remove();
					var dataObj = JSON.parse(data)
					if(!data){ 
						alert("ajax fail");
						return false;
					}else{
						console.log("dataObj.co_idx=",dataObj.co_idx);
						append(dataObj.co_idx, dataObj.co_name);
						return dataObj;
					}//if문 !data end
				}//ajax문 success end
			});//ajax문 end	
		}//appendHtml 문 end
		function append(co_idx, co_name){
			var htmlTest  ='';
			htmlTest = '<tr><td>'+co_idx+'<span id="idxTest" style="display:none;">${status.index}</span></td><td>'+co_name+'</td></tr>';
			$("#tbodyTest").append(htmlTest);
		}
	</script>
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
<p id="centerInfo_coin">coin</p>
</div>
<div class="col-sm-12">
<a class="col-sm-12 btn btn-default" href="#" id="coBtn_button">자세히보기</a>
</div>
<div class="col-sm-12">
<hr>
<p id="centerInfo_usecount">총 이용 횟수 : 10회</p>
<hr>
</div>
</div>
<div class="row well" id="centerInfo_body_sub">
<div id="coTime_table">
<p style="font-weight:bold">이용시간</p>
<table class="table">
<thead>
<tr>
<th>요일</th>
<th>시간</th>
</tr>
</thead>
<tbody id="centerInfo_time">
<tr>
<td><span id="">월요일</span></td>
<td><span id="">10시</span></td>
</tr>
</tbody>
</table>
</div>
<hr>
<div id="coAvail">
<p style="font-weight:bold;">이용가능</p>
<ul class="list-inline" id="centerInfo_avail">
<li></li>
</ul>
</div>
<hr>
<div id="coRegul">
<p>이용규정</p>
<div id="centerInfo_regul"></div>
</div>
<hr>
<div id="coExtra">
<p>부가서비스</p>
<div id="centerInfo_extra"></div>
</div>
</div>
</div>
</div>
</div>
<hr>
<%@include file="../footer.jsp" %>
<script type="text/javascript">
/*geolocation 구현*/
var mapContainer = document.getElementById('map');
var mapOption = {
	center : new daum.maps.LatLng(37.566535, 126.97796919999999),
	level : 3
};
var map = new daum.maps.Map(mapContainer, mapOption);

var markers=[];
searchMark();

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

/*이름과 주소 가져오기*/
var count = $("#count").val();
console.log("count", count)
var coName =[];
var addr=[];
var co_idx=[];
var centerListUrl=[];
for(var i=0; i<count;i++){
	coName[i]=document.getElementById('co_name_'+i).innerHTML;
	addr[i]=document.getElementById('co_address_'+i).value;
	co_idx[i]=document.getElementById('co_idx_idx_'+i).innerHTML;
	centerListUrl[i]=document.getElementById('centerUrl_'+i).innerHTML;
	getMarker(addr[i], coName[i], co_idx[i], centerListUrl[i]);
}

/*지도 확대 축소 컨트롤러*/
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMLEFT);

/*지도 움직일 때 마크 및 리스트 생성*/

daum.maps.event.addListener(map, 'idle', searchMark);
function searchMark(){
	listRemove();
	if(markers!=null||markers!=''){
	removeMarker();
	var proj = map.getProjection();
	var bounds=map.getBounds();
	var coList_html='';
	var $coList_name='';
	var $coList_idx='';
	var coList_url='';
	var num=1;
	for(var i=0; i<markers.length; i++){
		if(bounds.contain(markers[i].getPosition())){
			markers[i].setMap(map);
			$coList_name=$("#co_name_"+i).text();
			$coList_idx=$("#co_idx_idx_"+i).text();
			coList_url='"';
			coList_url+=document.getElementById("centerUrl_"+i).innerHTML;
			coList_url+='"';
			coList_html="<tr><td><span id='centerInfo_list_coIdx_"+i+"'>"+$coList_idx+"</span></td><td><a href='javascript:show("+$coList_idx+","+coList_url+")' id='centerInfo_list_coName_"+i+"'>"+$coList_name+"</a></td><tr>";
			$("#centerInfo_list").append(coList_html);
		}else{
			markers[i].setMap(null);
		}
	}
	}
}
function listRemove(){
		$("#centerInfo_list").empty();
}


/*마커 생성 및 클릭 이벤트*/
var infoWindows=[];
function getMarker(addr, name, co_idx, centerListUrl){
	var geocoder = new daum.maps.services.Geocoder();
	var marker;
	var infowindow;
	geocoder.addr2coord(addr, function(status, result) {
	     if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        marker = new daum.maps.Marker({
	            map: map,
	        	position: coords,
	            clickable: true
	        });
	        markers.push(marker);
	        infowindow = new daum.maps.InfoWindow({
	            content: '<div id="infowindow">'+name+'</div>'
	        });
	        infoWindows.push(infowindow);
	        daum.maps.event.addListener(marker,'click', makeClickListener(map, marker, infowindow, co_idx, centerListUrl));
	    }
	});
	function makeClickListener(){
		return function(){
				closeAllMarkInfo();
				infowindow.open(map, marker);
				show(co_idx, centerListUrl);
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
	}
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
	
	function centerDetail(centerListUrl){
		window.location.href=centerListUrl;
	}

		
		function closeAllMarkInfo(){
			for(var i=0; i<infoWindows.length; i++){
				infoWindows[i].close();
			}
		}
		function removeMarker(){
			if(markers==null){
			return;
			}else{
			for(var i=0; i<markers.length; i++){
				markers[i].setMap(null);
			}
			}
		}
	/*주소 불러오기*/
	</script>

</body>
</html>