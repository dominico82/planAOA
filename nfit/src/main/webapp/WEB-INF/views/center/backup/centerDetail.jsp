<%@page import="java.io.PrintWriter"%>
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
	  <link rel="shortcut icon" href="resources/images/n-1x-170x128.jpg" type="image/x-icon">
	  <script type="text/javascript" src="https://apis.daum.net/maps/maps3.js?apikey=edd938c4fc341b07f90ed69064de3f92&libraries=services"></script>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css"/>
<script type="text/javascript" src="resources/js/jquery.raty.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	feedbacklist();
		$('#btninsert').click(function(){
			//업체 idx
			var co_idx=$('#co_idx').val();
			console.log('실행co_idx::'+co_idx);
			
			//세션에 저장된 id값
			var userid=$('#userid').val();
			//내용
			var feedback_content = $('#feedback_content').val();	
			feedback_content  = feedback_content.replace('\r\n','<br>');
			//별점
			var feedback_score =$('#starRating').val();
			 if(feedback_content=='' || feedback_content==null){
				alert('댓글을입력해주세요');
				return;
			}
			var param='feedback_content='+feedback_content+'&feedback_score='+feedback_score+'&co_idx='+co_idx+'&member_id='+userid;
			console.log('param:::'+param);
			$.ajax({
				type:'post',
				url:'feedbackinsert.do',
				data:param,
				success : function(e){
					alert('댓글 등록완료!');
					feedbacklist();
				}
			});
			/* content영역 내용삭제 */
		$('#feedback_content').val('');
	});
});
//댓글목록
function feedbacklist(){
	var co_idx=$('#co_idx').val();
	$.ajax({
		type:'get',
		url:'feedbacklist.do?co_idx='+co_idx,
		success : function(result){
			$('#ListFeedback').html(result);
		}		
	});
}
</script>
<script>
var locked=0;
function show(star){
	if(locked)
		return;
	var i;
	var image;
	var el;
	var e = document.getElementById('startext');
	var stateMsg;
	for( i=1;i<=star;i++){
		image = 'images'+i;
		el = document.getElementById(image);
		el.src='resources/images/img/star1.png';
	}
}
function noshow(star){
	if(locked)
		return;
	var i;
	var image;
	var el;
	for(i=1;i<=star;i++){
		image='images'+i;
		el= document.getElementById(image);
		el.src='resources/images/img/star0.png';
	}
}
function lock(star){
	show(star);
	locked=1;
}
function mark(star){
	lock(star);
	$('#feedback_score').val(star);	
	return;
}
</script>
<script>
	/* 수정버튼클릭시 나오는 화면 */
	function showModify(feedback_index){
		$.ajax({
			type:'get',
			url:'feedbackdetail.do?feedback_index='+feedback_index,
			success : function(result){
				$('#modifyFeedback').html(result);
				$('#modifyFeedback').css('visibility','visible');
			}
		});
	}
</script>
<script>
/*예약 날짜 관련 스크립트*/
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNmaeMin : [ '일', '월', '화', '수', '목', '금', '토', ],
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					yearRange : 'c-99:c+0'
				});
	});
	$(document).ready(function(){
		$('#id').css("ime-mode", "active");
	});
</script>
<script>
/*센터 컨텐츠 선택시 배경색 변경, 예약시 코인값 설정*/
var coin_price;

$(function(){
	
	$("#con0").click(
			function(){
				$("#con0").attr("style", "background-color: lightgray;");
				$("#con1").removeAttr("style");
				$("#con2").removeAttr("style");
				$("#con3").removeAttr("style");
				$("#con4").removeAttr("style");
				$("#con5").removeAttr("style");	
				coin_price=$("#coin_num_0").contents().text();
				console.log(coin_price);
	});
	$("#con1").click(
			function(){
				$("#con0").removeAttr("style");
				$("#con1").attr("style", "background-color: lightgray;");
				$("#con2").removeAttr("style");
				$("#con3").removeAttr("style");
				$("#con4").removeAttr("style");
				$("#con5").removeAttr("style");	
				coin_price=$("#coin_num_1").contents().text();
				console.log(coin_price);
	});
	$("#con2").click(
			function(){
				$("#con0").removeAttr("style");
				$("#con1").removeAttr("style");
				$("#con2").attr("style", "background-color: lightgray;");
				$("#con3").removeAttr("style");
				$("#con4").removeAttr("style");
				$("#con5").removeAttr("style");	
				coin_price=$("#coin_num_2").contents().text();
				console.log(coin_price);
	});
	$("#con3").click(
			function(){
				$("#con0").removeAttr("style");
				$("#con1").removeAttr("style");
				$("#con2").removeAttr("style");
				$("#con3").attr("style", "background-color: lightgray;");
				$("#con4").removeAttr("style");
				$("#con5").removeAttr("style");	
				coin_price=$("#coin_num_3").contents().text();
				console.log(coin_price);
	});
	$("#con4").click(
			function(){
				$("#con0").removeAttr("style");
				$("#con1").removeAttr("style");
				$("#con2").removeAttr("style");
				$("#con3").removeAttr("style");
				$("#con4").attr("style", "background-color: lightgray;");
				$("#con5").removeAttr("style");	
				coin_price=$("#coin_num_4").contents().text();
				console.log(coin_price);
	});
	$("#con5").click(
			function(){
				$("#con0").removeAttr("style");
				$("#con1").removeAttr("style");
				$("#con2").removeAttr("style");
				$("#con3").removeAttr("style");
				$("#con4").removeAttr("style");
				$("#con5").attr("style", "background-color: lightgray;");	
				coin_price=$("#coin_num_5").contents().text();
				console.log(coin_price);
	});
});
//
//$(document).ready(function(){
//	$(".list-group-item").hover(
//			function(){
//				$(this).attr("id", "content_list_on");	
//			},
//			function(){
//				$(this).attr("id", "content_list");	
//			}
//	);
//});

</script>
</head>
<style>
#content_list_on{
	background-color: lightgray;
}
.coin_num{
width:30px; 
height:30px; 
background-repeat: no-reapeat; background-position: center center;
color:white;
text-align:center;
vertical-align:bottom;
}
.coin_num #coin{

}
.coin_cont_back{
background-size: 100% 100%;
background-repea:no-reapeat; 
background-position: 0% 0%;
padding-top: 15px;
padding-bottom: 15px;
padding-left: 20px;
padding-right: 20px;
}
/* 댓글관련 */
#modifyFeedback{
width: 400px;
height: 100px;
position: absolute;  /*  절대좌표지정없으면 바닥에 깔리게됨  */
top:70%; /* 위아래 50 */
left:75%;
margin-left: -220px;
z-index: 10; /* 레이어   */
visibility: hidden; /* 버튼클릭시 보이기하기위함 */
}
.button {
border: 0px solid #0a3c59;
background: #a5c1d4;
background: -webkit-gradient(linear, left top, left bottom, from(#a8b8c4), to(#a5c1d4));
background: -webkit-linear-gradient(top, #a8b8c4, #a5c1d4);
background: -moz-linear-gradient(top, #a8b8c4, #a5c1d4);
background: -ms-linear-gradient(top, #a8b8c4, #a5c1d4);
background: -o-linear-gradient(top, #a8b8c4, #a5c1d4);
background-image: -ms-linear-gradient(top, #a8b8c4 0%, #a5c1d4 100%);
padding: 4.5px 9px;
-webkit-border-radius: 29px;
-moz-border-radius: 29px;
border-radius: 29px;
-webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
-moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
text-shadow: #422542 0 1px 0;
color: #10171c;
font-size: 11px;
font-family: helvetica, serif;
text-decoration: none;
vertical-align: middle;
}
.button:hover {
border: 0px solid #0a3c59;
text-shadow: #93ccf0 0 1px 0;
background: #bacedb;
background: -webkit-gradient(linear, left top, left bottom, from(#aecee3), to(#bacedb));
background: -webkit-linear-gradient(top, #aecee3, #bacedb);
background: -moz-linear-gradient(top, #aecee3, #bacedb);
background: -ms-linear-gradient(top, #aecee3, #bacedb);
background: -o-linear-gradient(top, #aecee3, #bacedb);
background-image: -ms-linear-gradient(top, #aecee3 0%, #bacedb 100%);
color: #080508;
}
.button:active {
text-shadow: #1e4158 0 1px 0;
border: 0px solid #0a3c59;
background: #65a9d7;
background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#bacedb));
background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
background: -moz-linear-gradient(top, #3e779d, #65a9d7);
background: -ms-linear-gradient(top, #3e779d, #65a9d7);
background: -o-linear-gradient(top, #3e779d, #65a9d7);
background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
color: #fff;
}
</style>
<body>
<!-- 업체idx 값 -->
<c:set var="co_idx" value="${co_idx}"/>
<input type="hidden" value="${co_idx}" id="co_idx">
<!-- 세션에저장된 id -->
<c:set var="userid" value="${sessionScope.saveid}"/>
<c:set var="adminid" value="${sessionScope.adminid}"/>
<!-- 세션에 저장되 유저아이디값 히든에 담기 -->
<input type="hidden" value="${userid}" id="userid">
<input type="hidden" value="${adminid}" id="adminid">
<%@include file="../../header.jsp" %>
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
			<tr><td>지금까지 이용: ${dtos.co_usecount}회</td></tr>
			</table>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<h2>center detail</h2>
				<form name="mark" action="markJoin.do">
					<input type="hidden" value="${dtos.co_idx}" name="co_idx">
					<input type="hidden" value="${dtos.co_name}" name="co_name" id="co_name">
					<input type="hidden" value="${userid}" name="member_id">
					<input type="submit" value="즐겨찾기">
				</form>
				<div id="content">
				<c:set var="contentlist_set" value="${contentlist}"></c:set>
				<div class="panel panel-default">
				<div class="panel-heading">이용시간</div>
				<div class="panel-body">
				<c:if test="${empty contentlist_set }">
				<tr><td>이용상품 없음</td></tr>
				</c:if>
				<% int cnt = 0; %>
				<ul class="list-group">
				<c:forEach var="con" items="${contentlist_set}">
				<li class="list-group-item" id="con<%=cnt%>">
				<ul class="list-inline" id="content_list">
				<li><div class="coin_num" id="coin_num_<%=cnt%>">${con.content_coin}</div></li>
				<c:if test="${!empty con.content1}">
				<li><div class="coin_cont_back contbg_<%=cnt%> conigb_1"><span id="coin_cont_icon" class="glyphicon glyphicon-record"></span><span id="coin_cont">${con.content1}</span></div></li>
				</c:if>
				<c:if test="${!empty con.content2}">
				<li><div class="coin_cont_back contbg_<%=cnt%> conigb_1"><span id="coin_cont_icon" class="glyphicon glyphicon-record"></span><span id="coin_cont">${con.content2}</span></div></li>
				</c:if>
				<c:if test="${!empty con.content3}">
				<li><div class="coin_cont_back contbg_<%=cnt%> conigb_1"><span id="coin_cont_icon" class="glyphicon glyphicon-record"></span><span id="coin_cont">${con.content3}</span></div></li>
				</c:if>
				<c:if test="${!empty con.content4}">
				<li><div class="coin_cont_back contbg_<%=cnt%> conigb_1"><span id="coin_cont_icon" class="glyphicon glyphicon-record"></span><span id="coin_cont">${con.content4}</span></div></li>
				</c:if>
				<c:if test="${!empty con.content5}">
				<li><div class="coin_cont_back contbg_<%=cnt%> conigb_1"><span id="coin_cont_icon" class="glyphicon glyphicon-record"></span><span id="coin_cont">${con.content5}</span></div></li>
				</c:if>
				<c:if test="${!empty con.content6}">
				<li><div class="coin_cont_back contbg_<%=cnt%> conigb_1"><span id="coin_cont_icon" class="glyphicon glyphicon-record"></span><span id="coin_cont">${con.content6}</span></div></li>
				</c:if>
				</ul>
				</li>
				<%cnt++; %>
				</c:forEach>
				</ul>
				</div>
				</div>
				<hr>
				<script type="text/javascript">
				/*이용상품 coin에 따른 coin 색 변경*/
				var count = $("#content_list > li > .coin_num").length;
				console.log();
				var coin=[];
				for(var i=0; i<count; i++){
					coin[i] = document.getElementById("coin_num_"+i).innerHTML;
					console.log("coin[]",coin[i]);
					var num = 0;
					if(coin[i]>=0 && coin[i]<=10){
						num=0;
					}else if(coin[i]>10 && coin[i]<=20){
						num=1;
					}else if(coin[i]>20){
						num=2;
					}
					switch(num){
					case 0 : $("#coin_num_"+i).css("background-image","URL(resources/images/1pass.png)"); $(".contbg_"+i); break;
					case 1 : $("#coin_num_"+i).css("background-image","URL(resources/images/10pass.png)"); $(".contbg_"+i);break;
					case 2 : $("#coin_num_"+i).css("background-image","URL(resources/images/20pass.png)"); $(".contbg_"+i);break;
					}
				}
				</script>
				</div>
				<div id="co_avail">
				<div class="panel panel-default">
					<div class="panel-heading">이용가능<span id="coAv" style="display:none">${dtos.co_avail}</span></div>
					<div class="panel-body" >
					<ul class="list-inline" id="result">
					</ul>
					</div>
				</div>
				<hr>
				<script type="text/javascript">
				/*이용가능 텍슽트에 따른 이미지 연동*/
	var str = document.getElementById('coAv').innerHTML;
	var split=str.split("|");
	var HTML='';
	var cnt = split.length;
	for(var i=0; i<cnt; i++){
		HTML += "<li><span id='image"+i+"'><img id='photo' src=''></span><span id='useAvail"+i+"'>"+split[i]+"</span></li>";
	}
	document.getElementById('result').innerHTML = HTML;
	$(function(){
		var $s = $("#result > li > span:last-child");
		var $img = $("#result > li > img");
		var array=[];
		for(var i=0; i < cnt; i++){
		array[i]=$s[i].innerHTML;
		switch(array[i]){
		case '주차' : $img[i]="<img id='photo' src='resources/images/Car_Parking.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		case '타올' : $img[i]="<img id='photo' src='resources/images/Towels.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		case '운동복' : $img[i]="<img id='photo' src='resources/images/T_Shirts.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		case '일일락커' : $img[i]="<img id='photo' src='resources/images/Locker.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		case '샤워실' : $img[i]="<img id='photo' src='resources/images/shower.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		case '샤워' : $img[i]="<img id='photo' src='resources/images/shower.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		case '탈의실' : $img[i]="<img id='photo' src='resources/images/change_room.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i]; break;
		default: $img[i]="<img id='photo' src='resources/images/causion.png' height='64', width='64'>"; document.getElementById('image'+i).innerHTML = $img[i];
		}
		}
	});
	</script>
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
				<td>
				<c:if test='${usetime.usetime_time=="0"}'></c:if>
				<c:if test="${usetime.usetime_time!='0' }">${usetime.usetime_time}</c:if>
				</td>
				</tr>
				</c:forEach>
				</table>
				<div class="panel panel-default">
				<div class="panel-heading">
				부가서비스 <span id="co_extra" style="display:none">${dtos.co_extra}</span>
				</div>
				<div class="panel-body" id="co_extra_content">
				
				</div>
				</div>
				<div class="panel panel-default">
				<div class="panel-heading">
				이용규정<span id="co_regul" style="display:none">${dtos.co_regul}</span>
				</div>
				<div class="panel-body" id="co_regul_content">
				</div>
				</div>
				<hr>
				<script type="text/javascript">
				/**/
				/*이용규정 StringTokenizer*/
				var coExtra = $("#co_extra").text();
				var splitEx= coExtra.split("|");
				var coExtraSize=splitEx.length;
				var coeStr = [];
				var HTMLex ='';
				for(var i=0; i<coExtraSize; i++){
					coeStr[i]=splitEx[i];
					if(coeStr[i]==''){
					HTMLex += "<p><span class=''>&nbsp;</span>"+coeStr[i]+"</p>";
					}else{
					HTMLex += "<p><span class='glyphicon glyphicon-ok-circle'>&nbsp;</span>"+coeStr[i]+"</p>";
					}
				}
				document.getElementById("co_extra_content").innerHTML = HTMLex;
				
				/*부가서비스 StringTokenizer*/
				var coReg = $("#co_regul").text();
				var splitReg = coReg.split("|");
				var coRegSize = splitReg.length;
				var corStr = [];
				var HTMLre = '';
				for(var i=0; i<coRegSize; i++){
					corStr[i]=splitReg[i];
					console.log("constr",corStr[i]);
					if(corStr[i]==''){
					HTMLre += "<p><span class=''>&nbsp;</span>"+corStr[i]+"</p>";
					}else{
					HTMLre += "<p><span class='glyphicon glyphicon-ok-circle'>&nbsp;</span>"+corStr[i]+"</p>";
					}
				}
				document.getElementById("co_regul_content").innerHTML = HTMLre;
				</script>
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
							<div id="map" style=" width: 100%; height: 600px;"></div>
				</div>
				<!-- 예약 날짜 선택 공간 -->
				<div class="form-group">
					<div><label>예약 날짜 선택</label></div>
					<div class="form-inline booking" style="display: inline-block;">
						<input type="text" class="form-control" name="booking" id="datepicker" placeholder="클릭하세요" value=""
						onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
					</div>
					<div style="display: inline-block;">
						<a role="button" href="#" class="btn btn-sm btn-success" onclick="setBooking()">예약하기</a>
					</div>
<script>
function setBooking(){
	
	var bUserid=$('#userid').val();
	var bCo_idx=$('#co_idx').val();
	var bCo_name=$('#co_name').val();
	var use_date=$('#datepicker').val();
	var useData={"member_id":bUserid, "co_idx":bCo_idx, "co_name":bCo_name, "coin_price":coin_price, "use_date":use_date};

	if(coin_price==null||coin_price==''){
		alert('이용할 컨텐츠를 선택하세요!');
	}else if(use_date==null||use_date==''){
		alert('이용할 날짜를 선택하세요!');
	}else{
				
		$.ajax({
			type:'POST',
			url:'centerBooking.do',
			data: useData,
			success : function(result){
				var msg=result==1?"예약성공!":"예약실패!";
				console.log(msg);
				if(result==0){
					alert('이미같은 날짜로 예약하셨습니다!');
				}else{
					alert('예약되었습니다!');
				}
				
			}
		});	
	}
}
</script>
				</div>
				 <!-- 후기 댓글 공간 -->
				 <div>
					 <table id="feedback_table">
					 	<c:choose>
					 		<c:when test="${empty userid}">
					 			<tr>
					 				<td rowspan="3" colspan="3">
					 					<textarea rows="4" cols="35" readonly="readonly">업체를 이용하시고 댓글을 남겨보세요~</textarea>
					 				</td>
					 			</tr>
					 		</c:when>
					 		<c:otherwise>
								<tr>
									<td>
										<div id="star" ></div> <!-- 별점나타나는공간 -->
											
									        <div style="padding-top:20px;">						<!-- 별이찍히면 score가찍힘 -->
									            <label for="starRating">Value : </label><input type="text" id="starRating" value="3"/>
									        </div>
									        <div style="padding-top:20px; display: none;">
									            <label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span>
									        </div>
									        <script type="text/javascript">
									        $(function() {
									            $('div#star').raty({
									                score: 3
									                ,path : "resources/images/star"
									                ,width : 200
									                ,click: function(score, evt) {
									                    $("#starRating").val(score);
									                    $("#displayStarRating").html(score);
									                }
									            });
									        });
									        </script>
									</td>
								</tr>
								<tr>
									<td>
										<textarea rows="5" cols="70" id="feedback_content"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<button id="btninsert" type="button" class="button">Click!</button>
									</td>
								</tr>
					 		</c:otherwise>
					 	</c:choose>
					</table>
					 
				</div>
			<!-- 댓글목록나올란 -->
			<div id="ListFeedback"></div>
			 <!-- 댓글 수점 div박스 나올공간 -->
			<div id="modifyFeedback"></div>
			</div>
		</div>
	</div>
	<%@include file="../../footer.jsp" %>
</body>
</html>