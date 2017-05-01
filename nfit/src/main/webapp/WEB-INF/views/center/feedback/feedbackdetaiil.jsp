
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="resources/js/jquery.raty.js"></script>
<script>
$(document).ready(function(){
	/* 수정버튼클릭시 */
	$('#btnFeedbackUpdate').click(function(){
		/* 다시입력한 별의값 */
		var feedback_score = $('#starRating1').val();
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
	  $('div#star1').raty({
          score: 3
          ,path : "resources/images/star"
          ,width : 200
          ,click: function(score, evt) {
              $("#starRating1").val(score);
              $("#displayStarRating1").html(score);
          }
      });
});
</script>
</head>
<body>
<c:set var="vo" value="${vo}"/>
<div id="detail_feedback_index">댓글번호${vo.feedback_index}<br> <!-- 댓글번호 -->
	<div id="star1" ></div> <!-- 별점나타나는공간 -->
      <div style="padding-top:20px; display:none;">						<!-- 별이찍히면 score가찍힘 -->
          <label for="starRating1">Value1 : </label><input type="hidden" id="starRating1" value="3"/>
      </div>
      <div style="padding-top:20px; display: none;">
          <label for="displayStarRating1">Value2 : </label><span id="displayStarRating1" style="padding-left:20px;">3</span>
      </div>
	<textarea rows="5" cols="47" id="detail_feedback_content" placeholder="내용을 기입해주세요" required="required">${vo.feedback_content}</textarea>
	<br>
	<div style="text-align: center;">
		<button type="button" id="btnFeedbackUpdate" class="button">Update</button>
		<button type="button" id="btnFeedbackDelete" class="button">Del</button>
		<button type="button" id="btnFeedbackClose" class="button">Close</button>
	</div>
</div>
</body>
</html>