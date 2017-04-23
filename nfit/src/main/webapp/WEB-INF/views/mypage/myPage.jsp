<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족스러운 피트니스 Nfit 회원정보 보기</title>
<jsp:include page="../header.jsp"/>
<link rel="stylesheet" type="text/css" href="resources/css/mypage1.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/progressBar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<script>
$(document).ready(function(){ //DOM이 준비되고
    $('#bmiCheck').click(function(){ // ID가 toggleButton인 요소를 클릭하면
        var state = $('#bmiResult').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
        if(state == 'none'){ // state가 none 상태일경우
            $('#bmiResult').show();
        }else{ // 그 외에는
            $('#bmiResult').hide();       
        }
    });
});
</script>
</head>
<body>
<div class="wrap">
	<div class="container">
		<div class="mypageWrap">
			<div class="row">
				<aside class="col-lg-2 col-md-3 col-sm-4 mypageMenuAside">
					<div class="userInfo">
						<span class="userCircleImgWrap">
							<span class="userCircleImg">
							<c:forEach var="pics" items="${pic}"><img class="imgsize" src="resources/upload_images/${pics}"></c:forEach>
							</span>
						</span>
						<form name="upload" action="fileUpload.do" method="post" enctype="multipart/form-data"> <!-- 파일 업로드를 구현하는 폼 -->
							사진선택:<input type="file" name="files" id="files" accept="image/*" modelAttribute="uploadForm"><!-- input type="file" 업로드할 파일을 선택하는 속성 -->
							<input type="hidden" value="${dto.member_id}" name="id">
							<input type="hidden" value="${dto.member_idx}" name="idx">
							<input type="submit" value="파일올리기">
						</form>
						<h6>
							${dto.member_name}<small>님</small>
							<br>
							${dto.member_id}(${dto.member_email})
						</h6>
						<div class="userPicComment upcOK">
							<p class="text-anc">와~ 멋진 사진이네요!</p>
							<p><a class="btn btn-default btn-xs btn-editProfile" href="memberInfo.do">회원정보 수정</a></p>
						</div>
					</div>
					<div class="mypageMenuWrap">
						<div class="mypageMenu">
							<ul>
								<li>
									<a href="" id="a_index" class="current">
										<i class="fa fa-clone"></i>"내 멤버십"
									</a>
								</li>
								<li>
									<a href="" id="a_favorite_center" class="current">
										<i class="fa fa-heart-o"></i>"가보고 싶은 센터"
									</a>
								</li>
							</ul>
						</div>
					</div>
				</aside>
				<div class="col-lg-10 col-md-9 col-sm-8 mypagePanel" id="inner_top">
					<section class="myMembership">
						<div id="bmi">
							<a onclick="info();" class="membershipApply" id="bmiCheck">"비만도 체크하기"</a><br>
							<div id="bmiResult">
								<c:set var="bmi" value="${bmi}"/>
								<c:choose>
									<c:when test="${bmi < '18'}">
									<div class="progress">
										<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2}%">
									    ${bmi}
										</div>
									</div>
										<span>'체중미달' 너무 마르셨어요~ 규칙적인 식사와 꾸준한 운동을 합시다~</span>
									</c:when>
									<c:when test="${bmi >= '18' && bmi < '23'}">
									<div class="progress">
										<div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2}%">
									    ${bmi}
										</div>
									</div>
										<span>체질량 지수는 '보통'! 그럼 근육량을 늘리러 운동할까요?</span>
									</c:when>
									<c:when test="${bmi >= '23' && bmi < '25'}">
									<div class="progress">
										<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.3}%">
									    ${bmi}
										</div>
									</div>
										<span>조금 높은 '과체중' 이시네요 이제부터 운동하면 좋아지실거에요~</span>
									</c:when>
									<c:otherwise>
									<div class="progress">
										<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.7}%">
									    ${bmi}
										</div>
									</div>
										<span>헉!! '비만' 이시네요 함께 열심히 운동해볼까요?</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="myheadPC_myCoin">
				            <ul>
				                <li class="mP_coin" id="mP_coin">${dto.member_coin}</li>
				                <li class="mP_ctxt">COIN</li>
				            </ul>
				        </div>
						<c:choose>
							<c:when test="${empty dto.member_coin}">
			                    <h3><i class="fa fa-clone"></i>"내 멤버십"</h3>
								<div class="notYetMembership">
									<h4>필요한 만큼 결제하세요!</h4>
									<p>
										<a href="coin.do" class="membershipApply">
											<i class="fa fa-clone"></i>"멤버십 신청하기"
										</a>
									</p>
								</div>
		                    </c:when>
							<c:when test="${!empty dto.member_coin}">
				                <div class="notYetMembership">
				                	<div class="mypayInfo" id="mypayInfom">
					                    <table>
					                    	<thead>
						                    	<tr>
						                    		<td>결제일</td>
						                    		<td>결제방법</td>
						                    		<td>구매가격</td>
						                    		<td>구매코인</td>
						                    	</tr>
					                    	</thead>
					                    	<tbody>
					                    	
					                    	<c:forEach var="dta" items="${dta}">
					                    		<tr class="info">
					                    			<td>${dta.pay_date}</td>
					                    			<td>${dta.pay_method}</td>
					                    			<td>${dta.pay_price}</td>
					                    			<td>${dta.pay_coin}</td>
					                    		</tr>
					                    	</c:forEach>
					                    	
					                    	</tbody>
					                    </table>
									</div>
			                    	<h4>필요한 만큼 결제하세요!</h4>
									<p>
										<a href="coin.do" class="membershipApply">
											<i class="fa fa-clone"></i>"멤버십 신청하기"
										</a>
									</p>
								</div>
							</c:when>
	                    </c:choose>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>






















