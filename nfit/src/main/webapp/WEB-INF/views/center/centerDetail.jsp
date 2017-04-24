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
<title>Insert title here</title>
<script>
$(document).ready(function(){
	feedbacklist();
		$('#btninsert').click(function(){
			var co_idx=$('#co_idx').val();
			//내용
			var feedback_content = $('#feedback_content').val();	
			feedback_content  = feedback_content.replace('\r\n','<br>');
			//별점
			var feedback_score =$('#feedback_score').val();
			if(feedback_content=='' || feedback_content==null){
				alert('댓글을입력해주세요');
				return;
			}
			var param='feedback_content='+feedback_content+'&feedback_score='+feedback_score+'&co_idx='+co_idx;
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
		image = 'image'+i;
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
		image='image'+i;
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
</head>
<style>
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
	top:30%; /* 위아래 50 */
	left: 70%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 10; /* 레이어   */
	visibility: hidden; /* 버튼클릭시 보이기하기위함 */
}
</style>
<body>
<c:set var="co_idx" value="${co_idx}"/>
<input type="hidden" value="${co_idx}" id="co_idx">
<%@include file="../header.jsp" %>
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
				<li class="list-group-item">
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
							<div id="map" style="width: 100%; height: 600px;"></div>
				</div>
				 <!-- 후기 댓글 공간 -->
				 <table>
					<tr>
						<td>
							<span>
								<img id="image1" src="resources/images/img/star0.png" width="20" onmouseover="show(1)"onclick="mark(1)" onmouseout="noshow(1)"/>
								<img id="image2" src="resources/images/img/star0.png" width="20" onmouseover="show(2)"onclick="mark(2)" onmouseout="noshow(2)"/>
								<img id="image3" src="resources/images/img/star0.png" width="20" onmouseover="show(3)"onclick="mark(3)" onmouseout="noshow(3)"/>
								<img id="image4" src="resources/images/img/star0.png" width="20" onmouseover="show(4)"onclick="mark(4)" onmouseout="noshow(4)"/>
								<img id="image5" src="resources/images/img/star0.png" width="20" onmouseover="show(5)"onclick="mark(5)" onmouseout="noshow(5)"/>
							</span>
							<br><span id="startext">평가하기</span>
							<input type="hidden" id="feedback_score">
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="7" cols="55" id="feedback_content"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<button id="btninsert" type="button">댓글작성</button>
						</td>
					</tr>
				</table>
			<!-- 댓글목록나올란 -->
			<div id="ListFeedback"></div>
			<div id="modifyFeedback"></div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>