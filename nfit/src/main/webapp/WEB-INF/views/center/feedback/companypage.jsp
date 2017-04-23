<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script>
$(document).ready(function(){
	feedbacklist();
		$('#btninsert').click(function(){
			//내용
			var feedback_content = $('#feedback_content').val();	
			feedback_content  = feedback_content.replace('\r\n','<br>');
			//별점
			var feedback_score =$('#feedback_score').val();
			if(feedback_content=='' || feedback_content==null){
				alert('댓글을입력해주세요');
				return;
			}
			var param='feedback_content='+feedback_content+'&feedback_score='+feedback_score;
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
	$.ajax({
		type:'get',
		url:'feedbacklist.do?co_idx=5',
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
<style>
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
</head>
<body>
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
</body>
</html>