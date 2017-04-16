<%@ page language="java" contentType="text/html; charset=utf-8 "
	pageEncoding="UTF-8"%>
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
 <script type="text/javascript" src=""></script>
<title>Insert title here</title>
<style>
#map_part{
z-index:100;
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
	33.450701, 126.570667
	//apis.daum.net/maps/maps3.js?apikey=edd938c4fc341b07f90ed69064de3f92&libraries=services
	<div class="container-fluid">
<!-- 메뉴 바 부분 -->
		<div class="row">
			<h3>menu bar</h3>
		</div>
<!-- 업체 리스트 부분 -->
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
			<td><span id="co_idx_idx">${dto.co_idx }</span></td>
			<td>
			<a href="javascript:show(${dto.co_idx}, '${centerListUrl}')" id="co_name_${status.index}" class="coName"><span >${dto.co_name}</span></a>
			<input type="hidden" id="co_address_${status.index}" value="${dto.co_address}">
			</td>
			</tr>
				<%cnt++;%>
			</c:forEach>
			</tbody>
			</table>
			<input type="hidden" value="<%=cnt%>" id="count">
			</div>
<!-- 맵 부분 -->
			<div class="col-sm-8" id="map_part">
				<h3>map area</h3>
				<div id="map" style="width: 100%; height:800px;"></div>
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
<img alt="center" src="resources/images/K-010.jpg" class="img-rounded img-responsive">
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
<div class="btn-group btn-group-justified">
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
<a href="" class="btn btn-default">자세히보기1</a><br>
<input type="button" class="btn btn-success" value="자세히보기2">
	<script type="text/javascript">
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
				btn_html += "<a class='col-sm-12 btn btn-default' href='"+centerListUrl+"' id='coBtn_button'>자세히보기</a>"
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
						useTime_html += "<tr><td>"+usetimeSet.usetime_day+"</td><td>"+usetimeSet.usetime_time+"</td></tr>";
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
							content_html+='<span>'+contentSet.content2+'</span></p>';
						}else if(contentSet.content4==null||contentSet.content4=='null'){
							content_html+='<span>'+contentSet.content2+'</span>';
							content_html+='<span>'+contentSet.content3+'</span></p>';
						}else if(contentSet.content5==null||contentSet.content5=='null'){
							content_html+='<span>'+contentSet.content2+'</span>';
							content_html+='<span>'+contentSet.content3+'</span>';
							content_html+='<span>'+contentSet.content4+'</span></p>';
						}else if(contentSet.content6==null||contentSet.content6=='null'){
							content_html+='<span>'+contentSet.content2+'</span>';
							content_html+='<span>'+contentSet.content3+'</span>';
							content_html+='<span>'+contentSet.content4+'</span>';
							content_html+='<span>'+contentSet.content5+'</span></p>';
						}else{
							content_html+='<span>'+contentSet.content2+'</span>';
							content_html+='<span>'+contentSet.content3+'</span>';
							content_html+='<span>'+contentSet.content4+'</span>';
							content_html+='<span>'+contentSet.content5+'</span>';
							content_html+='<span>'+contentSet.content6+'</span></p>';
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

	/*이름과 주소 가져오기*/
	var count = $("#count").val();
	console.log("count", count)
	var coName =[];
	var addr=[];
	for(var i=0; i<count;i++){
		coName[i]=document.getElementById('co_name_'+i).innerHTML;
		addr[i]=document.getElementById('co_address_'+i).value;
		console.log("=========for the mark========");
		console.log("coName", coName[i]);
		console.log("addr", addr[i]);
		getMarker(addr[i], coName[i]);
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
		
		/*마커 생성 및 클릭 이벤트*/
		var infoWindows=[];
		function getMarker(addr, name){
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
			        infowindow = new daum.maps.InfoWindow({
			            content: '<div>'+name+'</div>'
			        });
			        infoWindows.push(infowindow);
			        daum.maps.event.addListener(marker,'click', makeClickListener(map, marker, infowindow));
			    }
			});
			function makeClickListener(){
				return function(){
						closeAllMarkInfo();
						infowindow.open(map, marker);
					}
			}
		}
		function closeAllMarkInfo(){
			for(var i=0; i<infoWindows.length; i++){
				infoWindows[i].close();
			}
		}
		
	/*주소 불러오기*/
	</script>

</body>
</html>