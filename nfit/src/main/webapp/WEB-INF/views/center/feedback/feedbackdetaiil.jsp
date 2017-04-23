
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
	/* 수정버튼클릭시 */
	$('#btnFeedbackUpdate').click(function(){
		/* 다시입력한 별의값 */
		var feedback_score = $('#feedback_score2').val();
		// index 
		var feedback_index= $('#feedback_index').val();
		/* 다시입력한 content의값 */
		var feedback_content = $('#detail_feedback_content').val();
			feedback_content = feedback_content.replace('\r\n','<br>');
		console.log('feedback_content::::'+feedback_content);
		//별점 체크 유효성확인 
		 if(feedback_score=='' || feedback_score ==null){
			alert('별점선택해주세요');
		}
		//var param='feedback_score='+feedback_score+'&feedback_content='+feedback_content+'&feedback_index='+feedback_index;
		$.ajax({
			type:'put',	
			url:'feedbackupdate.do?feedback_index=${vo.feedback_index}',
			headers :{
				'Content-Type':'application/json'
			}, 
			 data : JSON.stringify({
				feedback_score : feedback_score,
				feedback_content : feedback_content 
			}),
			success : function(result){
				if(result == 'success'){
					$('#modifyFeedback').hide();
					alert('수정이되었습니다.');
					feedbacklist();
				}
			}
		});//end ajax
	});//end 수정 이벤트
	//삭제이벤트
	$('#btnFeedbackDelete').click(function(){
		if(confirm('정말삭제하시겠습니까?')==true){
			$.ajax({
				type:'delete',
				url:'feedbackdetail.do?feedback_index=${vo.feedback_index}',
				success : function(result){
					if(result=='success'){
							alert('삭제되었습니다.');
							$('#modifyFeedback').css('visibility','hidden');
							feedbacklist();
						}
					}
				});
		}else{
			alert('취소되었습니다.');
			return;
		}
	});
	//닫기 버튼
	$('#btnFeedbackClose').click(function(){
		$('#modifyFeedback').css('visibility','hidden');
		feedbacklist();
	});
});
</script>
<script>
var locked2=0;
function show1(star){
	if(locked2)
		return;
	var j;
	var image2;
	var el2;
	var e2 = document.getElementById('startext');
	var stateMsg;
	for( j=1;j<=star;j++){
		image2 = 'images'+j;
		el2 = document.getElementById(image2);
		el2.src='resources/images/img/star1.png';
	}
}
function noshow1(star){
	if(locked2)
		return;
	var j;
	var image2;
	var el2;
	for(j=1;j<=star;j++){
		image2='images'+j;
		el2= document.getElementById(image2);
		el2.src='resources/images/img/star0.png';
	}
}
function lock1(star){
	show1(star);
	locked2=1;
}
function mark1(star){
	lock1(star);
	$('#feedback_score2').val(star);	
	return;
}
</script>
<style>
#detail_feedback_index{
	border: 3px solid blue;
}
</style>
</head>
<body>
<c:set var="vo" value="${vo}"/>
<div id="detail_feedback_index">${vo.feedback_index}<br> <!-- 댓글번호 -->
	<span>
		<img id="images1" src="resources/images/img/star0.png" width="20" onmouseover="show1(1)"onclick="mark1(1)" onmouseout="noshow1(1)"/>
		<img id="images2" src="resources/images/img/star0.png" width="20" onmouseover="show1(2)"onclick="mark1(2)" onmouseout="noshow1(2)"/>
		<img id="images3" src="resources/images/img/star0.png" width="20" onmouseover="show1(3)"onclick="mark1(3)" onmouseout="noshow1(3)"/>
		<img id="images4" src="resources/images/img/star0.png" width="20" onmouseover="show1(4)"onclick="mark1(4)" onmouseout="noshow1(4)"/>
		<img id="images5" src="resources/images/img/star0.png" width="20" onmouseover="show1(5)"onclick="mark1(5)" onmouseout="noshow1(5)"/>
	</span>
	<br>
		<input type="hidden" id="feedback_score2">
	<br>
	<textarea rows="5" cols="55" id="detail_feedback_content" placeholder="내용을 기입해주세요" required="required">${vo.feedback_content}</textarea>
	<br>
	<div style="text-align: center;">
		<button type="button" id="btnFeedbackUpdate">수정</button>
		<button type="button" id="btnFeedbackDelete">삭제</button>
		<button type="button" id="btnFeedbackClose">닫기</button>
	</div>
</div>
</body>
</html>