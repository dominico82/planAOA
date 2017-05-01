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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="resources/js/jquery.raty.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	feedbacklist();
	/* modify버튼 드래그가능 */
	$('#modifyFeedback').draggable({
		handle:'#detail_feedback_index'
	});
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
	console.log("co_idx:"+co_idx);
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

$(document).ready(function(){
	
	$("#con0").click(			
			function(){
				if($("li.choose0").length>0){	
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeAttr("style");
						$("#con"+j+"").removeClass("choose0");
					}	
					coin_price='';
				}else{
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeClass("choose"+j);
					}	
					$("#con0").attr("style", "background-color: #c7ddef;");
					$("#con0").addClass("choose0");
					$("#con1").removeAttr("style");
					$("#con2").removeAttr("style");
					$("#con3").removeAttr("style");
					$("#con4").removeAttr("style");
					$("#con5").removeAttr("style");	
					coin_price=$("#coin_num_0").contents().text();
				}
				console.log(coin_price);
	});
	$("#con1").click(
			function(){
				if($("li.choose1").length>0){	
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeAttr("style");
						$("#con"+j+"").removeClass("choose1");
					}	
					coin_price='';
				}else{
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeClass("choose"+j);
					}	
					$("#con0").removeAttr("style");
					$("#con1").attr("style", "background-color: #c7ddef;");
					$("#con1").addClass("choose1");
					$("#con2").removeAttr("style");
					$("#con3").removeAttr("style");
					$("#con4").removeAttr("style");
					$("#con5").removeAttr("style");	
					coin_price=$("#coin_num_1").contents().text();
				}
				console.log(coin_price);
	});
	$("#con2").click(
			function(){
				if($("li.choose2").length>0){	
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeAttr("style");
						$("#con"+j+"").removeClass("choose2");
					}	
					coin_price='';
				}else{
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeClass("choose"+j);
					}	
					$("#con0").removeAttr("style");
					$("#con1").removeAttr("style");
					$("#con2").attr("style", "background-color: #c7ddef;");
					$("#con2").addClass("choose2");
					$("#con3").removeAttr("style");
					$("#con4").removeAttr("style");
					$("#con5").removeAttr("style");	
					coin_price=$("#coin_num_2").contents().text();
				}
				console.log(coin_price);
	});
	$("#con3").click(
			function(){
				if($("li.choose3").length>0){	
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeAttr("style");
						$("#con"+j+"").removeClass("choose3");
					}	
					coin_price='';
				}else{
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeClass("choose"+j);
					}	
					$("#con0").removeAttr("style");
					$("#con1").removeAttr("style");
					$("#con2").removeAttr("style");
					$("#con3").attr("style", "background-color: #c7ddef;");
					$("#con3").addClass("choose3");
					$("#con4").removeAttr("style");
					$("#con5").removeAttr("style");	
					coin_price=$("#coin_num_3").contents().text();
				}
				console.log(coin_price);
	});
	$("#con4").click(
			function(){
				if($("li.choose4").length>0){	
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeAttr("style");
						$("#con"+j+"").removeClass("choose4");
					}	
					coin_price='';
				}else{
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeClass("choose"+j);
					}	
					$("#con0").removeAttr("style");
					$("#con1").removeAttr("style");
					$("#con2").removeAttr("style");
					$("#con3").removeAttr("style");
					$("#con4").attr("style", "background-color: #c7ddef;");
					$("#con4").addClass("choose4");
					$("#con5").removeAttr("style");	
					coin_price=$("#coin_num_4").contents().text();
				}
				console.log(coin_price);
	});
	$("#con5").click(
			function(){
				if($("li.choose5").length>0){	
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeAttr("style");
						$("#con"+j+"").removeClass("choose5");
					}	
					coin_price='';
				}else{
					for(var j=0;j<6;j++){
						$("#con"+j+"").removeClass("choose"+j);
					}	
					$("#con0").removeAttr("style");
					$("#con1").removeAttr("style");
					$("#con2").removeAttr("style");
					$("#con3").removeAttr("style");
					$("#con4").removeAttr("style");
					$("#con5").attr("style", "background-color: #c7ddef;");	
					$("#con5").addClass("choose5");				
					coin_price=$("#coin_num_5").contents().text();
				}
				console.log(coin_price);
	});
});

$(document).ready(function(){
	$(".list-group-item").hover(
			function(){
				$(this).addClass("on");	
			},
			function(){
				$(this).removeClass("on");	
			}
	);
	
});

</script>
</head>
<style>
.list-group-item.on{
background-color: #c7ddef;
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
top:-5%; /* 위아래 50 */
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
/*jsd css작업****************************************************************************************/
#mapping{
height:100%;
}
#map{
width:100%;
height:340px;
}
#infowindows_close{
position:absolute;
right:10px;
top:10px;
cursor:pointer;
}
#infowindows {
	position: relative;
	bottom: 100px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size:12px;
}

#mapping span{
cursor:pointer;
margin: 5px 5px 5px 5px;
}
#mapping span:hover{
color:#999a9b;
}
#center_main_con{
padding-top:90px;
}
/* #center_main_img{
width:100%;
height:100%;
margin: 0 0 0 0;
z-index:-1;
-webkit--filter:brightness(50%) blur(5px);
filter:brightness(50%) blur(5px);
} */
#center_main_col{
height:500px;
background-color:#888;
background-attachment:fixed;
background-repeat: no-repeat;
background-position: center center;
background-size: cover;
-webkit--filter:brightness(50%);
filter:brightness(50%);
z-index:-1;
margin:0 0 0 0;
}
#center_main_info{
position:absolute;
top:30%;
left:10%;
color:white;
z-index:1;
}
/* #center_main_row{
z-index:1;
padding: -1 -1 -1 -1;
} 
*/
#center_content{
margin-top:20px;
}
.collapse_span{
position:absolute;
right:30px;
top:12px;
}
#map_zoom{
z-index:1;
position:absolute;
top:20px;
right:15px;
}
/*//ends jsd css작업************************************************************************/
</style>
<body>
<!-- 업체idx 값 -->
<c:set var="co_idx" value="${co_idx}"/>
<input type="hidden" value="${co_idx}">
<!-- 세션에저장된 id -->
<c:set var="userid" value="${sessionScope.saveid}"/>
<c:set var="adminid" value="${sessionScope.adminid}"/>
<!-- 세션에 저장되 유저아이디값 히든에 담기 -->
<input type="hidden" value="${userid}" id="userid">
<input type="hidden" value="${adminid}" id="adminid">
<%@include file="../header.jsp" %>
<!-- jsd center mainㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="container-fluid" id="center_main_con">
		<c:set var="dtos" value="${dto}" />
		<div class="row" id="center_main_row">
			<div class="col-sm-12" id="center_main_col">
			</div>
			<div id="center_main_info">
			<h1>${dtos.co_name}</h1><br>
			<p>${dtos.co_address}<br>${dtos.co_phone}</p>
			<p class="text-muted"><span class="glyphicon glyphicon-stats"></span>&nbsp;지금까지 이용: <span class="bg-info">${dtos.co_usecount}회</span></p>
			<form name="mark" action="markJoin.do">
					<input type="hidden" value="${dtos.co_idx}" name="co_idx" id="co_idx">
					<input type="hidden" value="${dtos.co_name}" name="co_name">
					<input type="hidden" value="${userid}" name="member_id">
					<input class="btn btn-info" type="submit" value="즐겨찾기">
				</form>
			<input type="hidden" value="${dtos.co_view}" id="co_view">
			</div>
		</div>
<!-- //ends jsd center mainㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="row" id="center_content">
			<div class="col-sm-6">
<!-- jsd content_service작업 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
				<div id="content_div">
				<c:set var="contentlist_set" value="${contentlist}"></c:set>
				<c:set var="coins" value="${coinlist}"></c:set>
				<div class="panel panel-default">
				<div class="panel-heading"><span class="glyphicon glyphicon-heart"></span>서비스
				</div>
				<div class="panel-body">
				<c:if test="${empty contentlist_set }">
				<tr><td>이용상품 없음</td></tr>
				</c:if>
				<% int cnt = 0; %>
				<ul class="list-group">
				<c:forEach var="con" items="${contentlist_set}" begin="0" step="1" varStatus="status">
				<c:choose>
					<c:when test="${con.content_coin<5 }">
				<li class="list-group-item list-group-item-success" id="con<%=cnt%>">
				<ul class="list-inline" id="content_list">
					<c:forEach var="coin" items="${coins}" begin="0" step="1" varStatus="status1">
						<c:if test="${status1.index==status.index}">
						<li><div class="coin_num"><span id="coin_num_<%=cnt%>" class="label label-success glyphicon glyphicon-usd">${coin}</span></div></li>
						</c:if>
					</c:forEach>
				<c:if test="${!empty con.content1}">
				<li><span id="coin_cont" class="label label-success">${con.content1}</span></li>
				</c:if>
				<c:if test="${!empty con.content2}">
				<li><span id="coin_cont" class="label label-success">${con.content2}</span></li>
				</c:if>
				<c:if test="${!empty con.content3}">
				<li><span id="coin_cont" class="label label-success">${con.content3}</span></li>
				</c:if>
				<c:if test="${!empty con.content4}">
				<li><span id="coin_cont" class="label label-success">${con.content4}</span></li>
				</c:if>
				<c:if test="${!empty con.content5}">
				<li><span id="coin_cont" class="label label-success">${con.content5}</span></li>
				</c:if>
				<c:if test="${!empty con.content6}">
				<li><span id="coin_cont" class="label label-success">${con.content6}</span></li>
				</c:if>
				</ul>
				</li>
					</c:when>
					<c:when test="${con.content_coin>=5&&con.content_coin<10 }">
									<li class="list-group-item list-group-item-info" id="con<%=cnt%>">
				<ul class="list-inline" id="content_list">
					<c:forEach var="coin" items="${coins}" begin="0" step="1" varStatus="status1">
						<c:if test="${status1.index==status.index}">
						<li><div class="coin_num" id="coin_num_<%=cnt%>"><span class="label label-primary glyphicon glyphicon-usd">${coin}</span></div></li>
						</c:if>
					</c:forEach>
				<c:if test="${!empty con.content1}">
				<li><span id="coin_cont" class="label label-primary">${con.content1}</span></li>
				</c:if>
				<c:if test="${!empty con.content2}">
				<li><span id="coin_cont" class="label label-primary">${con.content2}</span></li>
				</c:if>
				<c:if test="${!empty con.content3}">
				<li><span id="coin_cont" class="label label-primary">${con.content3}</span></li>
				</c:if>
				<c:if test="${!empty con.content4}">
				<li><span id="coin_cont" class="label label-primary">${con.content4}</span></li>
				</c:if>
				<c:if test="${!empty con.content5}">
				<li><span id="coin_cont" class="label label-primary">${con.content5}</span></li>
				</c:if>
				<c:if test="${!empty con.content6}">
				<li><span id="coin_cont" class="label label-primary">${con.content6}</span></li>
				</c:if>
				</ul>
				</li>
					</c:when>
					<c:when test="${con.content_coin>=10 }">
									<li class="list-group-item list-group-item-danger" id="con<%=cnt%>">
				<ul class="list-inline" id="content_list">
					<c:forEach var="coin" items="${coins}" begin="0" step="1" varStatus="status1">
						<c:if test="${status1.index==status.index}">
						<li><div class="coin_num" id="coin_num_<%=cnt%>"><span class="label label-danger glyphicon glyphicon-usd">${coin}</span></div></li>
						</c:if>
					</c:forEach>
				<c:if test="${!empty con.content1}">
				<li><span id="coin_cont" class="label label-danger">${con.content1}</span></li>
				</c:if>
				<c:if test="${!empty con.content2}">
				<li><span id="coin_cont" class="label label-danger">${con.content2}</span></li>
				</c:if>
				<c:if test="${!empty con.content3}">
				<li><span id="coin_cont" class="label label-danger">${con.content3}</span></li>
				</c:if>
				<c:if test="${!empty con.content4}">
				<li><span id="coin_cont" class="label label-danger">${con.content4}</span></li>
				</c:if>
				<c:if test="${!empty con.content5}">
				<li><span id="coin_cont" class="label label-danger">${con.content5}</span></li>
				</c:if>
				<c:if test="${!empty con.content6}">
				<li><span id="coin_cont" class="label label-danger">${con.content6}</span></li>
				</c:if>
				</ul>
				</li>
					</c:when>
				</c:choose>
				<%cnt++; %>
				</c:forEach>
				</ul>
				</div>
				</div>
				<hr>
				</div>
<!-- //ends jsd content_service 작업 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
<!-- jsd center info  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
				<div id="co_avail_div">
				<div class="panel panel-default">
					<div class="panel-heading"><span id="coAv" style="display:none">${dtos.co_avail}</span>
					<span class="glyphicon glyphicon-user"></span>이용가능
					</div>
					<div class="panel-body" >
					<ul class="list-inline" id="result">
					</ul>
					</div>
					</div>
				<hr>
				</div>
				<div id="usetime_div">
				<c:set var="list" value="${timelist}"/>
				<div class="panel panel-default">
				<div class="panel-heading"><span class="glyphicon glyphicon-time">이용시간</div>
				<div class="panel-body">
				<table class="table table-condensed">
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
				</div>
				</div>
				<hr>
				</div>
				<div id="co_extra_div">
				<div class="panel panel-default">
				<div class="panel-heading"><span class="glyphicon glyphicon-info-sign"></span>
				부가서비스 <span id="co_extra" style="display:none">${dtos.co_extra}</span>
				</div>
				<div class="panel-body" id="co_extra_content">
				</div>
				</div>
				<hr>
				</div>
				<div id="co_regul_div">
				<div class="panel panel-default">
				<div class="panel-heading"><span class="glyphicon glyphicon-pushpin"></span>
				이용규정<span id="co_regul" style="display:none">${dtos.co_regul}</span>
				</div>
				<div class="panel-body" id="co_regul_content">
				</div>
				</div>
				<hr>
				</div>
				<div id="phone_and_address">
				<div class="panel panel-default">
				<div class="panel-heading"><span class="glyphicon glyphicon-phone-alt"></span>주소 및 전화번호</div>
				<div class="panel-body">
				<table class="table table-condensed">
				<tr><th>주소: </th><td>${dtos.co_address }</td></tr>
				<tr><th>전화번호: </th><td>${dtos.co_phone }</td></tr>
				</table>
				</div>
				</div>
				</div>
</div>
<!--/ends jsd center info  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
<!-- jsd map작업ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
			<div class="col-sm-6">
			<div class="col-sm-12 well well-lg">
			<c:set var="center" value="${centerlist}"/>
			<c:set var="imglist" value="${filelist}"/>
			<c:set var="first" value="${firstimg}"/>
				<input type="hidden" value="${center.co_address}" id="co_address">
				<input type="hidden" value="${center.co_name}" id="co_name">
				<c:if test="${!empty imglist}">
<div id="carousel">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    	
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    	<c:forEach var="imgSpot" items="${imglist}" begin="1" step="1" varStatus="status">
		      <li data-target="#myCarousel" data-slide-to="${status.index}" class=""></li>
    	</c:forEach>
    
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      
      		<div class="item active">
        		<img src="${first}" style="width:100%;">
      		</div>
      <c:forEach var="img" items="${imglist}" begin="1" step="1" varStatus="status">
      		<div class="item">
        		<img src="${img}" style="width:100%;" alt="img">
      		</div>
      </c:forEach>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</c:if>
				</div>
		<div class="col-sm-12 well well-lg">
				<div id="mapping">
							<div id="map"></div>
							<div id="map_zoom" style="">
							<span style="cursor:pointer" onclick="javascript:zoomIn()" class="glyphicon glyphicon-plus"></span>
							<span style="cursor:pointer" onclick="javascript:zoomOut()" class="glyphicon glyphicon-minus"></span>
							</div>
				</div>
				</div>
<!-- //ends jsd map작업ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ작업 -->			
				<div class="col-sm-12">
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
	console.log("예약 userid:"+bUserid);
	console.log("예약 co_idx:"+bCo_idx);
	console.log("예약 date:"+use_date);
	console.log("예약 coin_price:"+coin_price);
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
				</div>
		<div class="col-sm-12">
				 <!-- 후기 댓글 공간 -->
				 <div class="w3-container w3-card-4 w3-light-grey">
					 <table id="feedback_table">
					 	<c:choose>
					 		<c:when test="${empty userid}">
					 			<tr>
					 				<td rowspan="3" colspan="3">
					 					<textarea rows="4" cols="50" readonly="readonly">업체를 이용하시고 댓글을 남겨보세요~</textarea>
					 				</td>
					 			</tr>
					 		</c:when>
					 		<c:otherwise>
								<tr>
									<td>
										<div id="star" ></div> <!-- 별점나타나는공간 -->
										<br>
									        <div style="padding-top:20px; display: none;">						<!-- 별이찍히면 score가찍힘 -->
									            <label for="starRating">Value : </label><input type="text" id="starRating" value="3"/>
									        </div>
									        <script type="text/javascript">
									        $(function() {
									            $('div#star').raty({
									                score: 3
									                ,path : "resources/images/star"
									                ,width : 200
									                ,click: function(score, evt) {
									                    $("#starRating").val(score);
									                }
									            });
									        });
									        </script>
									</td>
								</tr>
								<tr>
									<td>
										<textarea rows="5" cols="70" id="feedback_content" ></textarea>
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
		</div>
	<script>
	/*****************************************************************************************************************************************승동작업*/
	/*map 생성*/
var co_lat = ${center.co_lat};
var co_lng = ${center.co_lng};
var position = new daum.maps.LatLng(co_lat, co_lng);

var mapContainer = document.getElementById('map');
var mapOption = {
	center: position,
	level:4
	};
var map = new daum.maps.Map(mapContainer, mapOption);

/*줌 컨트롤러 추가*/
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMRIGHT);

//지도에 마커를 표시합니다 
var imgSrc='resources/images/marker.png';
var imgSize=new daum.maps.Size(54,59);
var markerImage = new daum.maps.MarkerImage(imgSrc, imgSize);
var marker = new daum.maps.Marker({
map: map, 
position: position,
image:markerImage
});

var co_name =$("#co_name").val();
var co_address =$("#co_address").val();
//인포 윈도우 표시
infoContent='<div id="infowindows" class="panel panel-default">'+
    '<div class="panel-heading">'+co_name+'<span id="infowindows_close" onclick="javascript:closeOverlay()" class="glyphicon glyphicon-remove-circle"></span></div>'+
        '<div class="panel-body">'+co_address+'</div>'+
     	'</div>';

var infowindow = new daum.maps.CustomOverlay({
content : infoContent,
map: map,
position: marker.getPosition()
});
infowindow.setMap(map);

//인포윈도그 끄기
function closeOverlay(){
infowindow.setMap(null);
}
//인포윈도그 열기
daum.maps.event.addListener(marker, 'click', function() {
  infowindow.setMap(map);  
});

//줌인
function zoomIn(){
map.setLevel(map.getLevel()-1);
}
//줌아웃
function zoomOut(){
map.setLevel(map.getLevel()+1);
}

/*백그라운드 채인지*/
$(document).ready(function(){
 var co_view =$("#co_view").val();
 var $backUrl = "url(resources/centerImage/";
 $backUrl+=co_view;
 $backUrl+="/";
 $backUrl+=co_view;
 $backUrl+="_0.jpg)";
 console.log("co_view="+co_view)
 console.log("$backUrl="+$backUrl)
 $("#center_main_col").css({"background-image":$backUrl});
});

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
/*****************************************************************************************************************************************승동작업*/

	</script>
	<%@include file="../footer.jsp" %>
</body>
</html>