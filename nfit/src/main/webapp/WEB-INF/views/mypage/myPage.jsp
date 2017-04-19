<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"/>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<script>
function info(){
	var tall1 = ${dto.member_tall};
	var tall = tall1*0.01
	var weight = ${dto.member_weight};
	var bmi = weight/(tall*tall);
	var p1 = document.getElementById('bmi');
	  if(bmi <= 18.5){
		  p1.innerHTML = '너무 마르셨네요~ 저체중이세요~ 잘 먹고 운동합시다!';
	  }else if(bmi >= 18.5 && bmi <= 24){
		  p1.innerHTML = '정상이시네요~ 그럼 탄탄한 몸을 위해서 운동해볼까요!'; 
	  }else if(bmi > 25){
		  p1.innerHTML = '운동이 필요하시네요~ 건강한 몸을 위해서 운동해볼까요!';
	  }
}
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
							<span class="userCircleImg"><img src="resources/file/upload/${pic}"></span>
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
								<li>
									<span class="disabledLink">
										<i class="fa fa-bar-chart"></i>"이용 기록"
									</span>
								</li>
							</ul>
						</div>
					</div>
				</aside>
				<div class="col-lg-10 col-md-9 col-sm-8 mypagePanel" id="inner_top">
					<section class="myMembership">
						<div>
							<a onclick="info();" class="membershipApply">"비만도 체크하기"</a><br>
							<span id="bmi"></span>
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
				                    <table>
				                    	<thead>
					                    	<tr>
					                    		<td>결제일</td>
					                    		<td>결제방법</td>
					                    		<td>구매가격</td>
					                    		<td>구매코인</td>
					                    		<td>현재보유코인</td>
					                    	</tr>
				                    	</thead>
				                    	<tbody>
				                    	<c:forEach var="dta" items="${dta}">
				                    		<tr>
				                    			<td>${dta.pay_price}</td>
				                    			<td>${dta.pay_method}</td>
				                    			<td>${dta.pay_price}</td>
				                    			<td>${dta.pay_coin}</td>
				                    			<td>${dto.member_coin}coin</td>
				                    		</tr>
				                    	</c:forEach>
				                    	</tbody>
				                    </table>
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
</body>
</html>






















