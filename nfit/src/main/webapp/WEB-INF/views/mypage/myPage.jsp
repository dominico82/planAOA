<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족스러운 피트니스 Nfit 회원정보 보기</title>
<link rel="stylesheet" type="text/css" href="resources/css/progressBar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/mypage1.css"/>
<jsp:include page="../header.jsp"/>
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
						<form name="upload" action="fileUpload.do" method="post" enctype="multipart/form-data">
							프로필 사진 등록하기
							<input type="file" name="files" id="files" class="filestyle" accept="image/*">
							<input type="submit" value="파일올리기">
							<input type="hidden" value="${dto.member_id}" name="id">
							<input type="hidden" value="${dto.member_idx}" name="idx">
						</form>
						<br>
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
							<div class="bmiCheck">
							<a class="membershipApply" id="bmiCheck">비만도 체크하기</a><br>
							</div>
							<div id="bmiResult">
								<c:set var="bmi" value="${bmi}"/>
								<c:choose>
									<c:when test="${bmi < '18'}">
										<h2>
											<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
										</h2>
											<div class="progress">
												<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2}%">
											    ${bmi}
												</div>
											</div>
										<h6>
											<span>
												<strong>체질량(BMI)지수</strong>
												는<em class="aq">${bmi}</em> 입니다.
											</span>
											<span class="fat">
												현재
												<em>저체중</em> 으로 보입니다.
											</span>
										</h6>
										<div class="reference">
											<ul>
												<li>저체중:18미만</li>
												<li>정상:18~22</li>
												<li>과체중:23~25</li>
												<li>경도비만26~29</li>
												<li>중등도30이상</li>
											</ul>
										</div>
										<p>
											<b>BMI 지수만을 맹신하지 마세요!</b>
										</p>
										<p>
											남성의 경우 체지방률이 25% 이상일때 보통 "마른비만"일 수 있습니다. 
											여성의 경우 체지방률이 30% 이상일때 보통 "마른비만" 일 수 있습니다.
										</p>
										<P>
											<b>허리둘레도 재 보세요!</b>
										</p>
										<p>
											남성의 경우 90cm 이상이면 "복부비만" 입니다.
											여성의 경우 85cm 이상이면 "복부비만" 입니다.
										</P>
										<p><b>꾸준한 운동으로 건강하고 탄탄한 몸매를 만들어보세요!</b></p>
									</c:when>
									<c:when test="${bmi >= '18' && bmi < '23'}">
										<h2>
											<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
										</h2>
											<div class="progress">
												<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2}%">
											    ${bmi}
												</div>
											</div>
										<h6>
											<span>
												<strong>체질량(BMI)지수</strong>
												는<em class="aq">${bmi}</em> 입니다.
											</span>
											<span class="fat">
												현재
												<em>정상</em> 으로 보입니다.
											</span>
										</h6>
										<div class="reference">
											<ul>
												<li>저체중:18미만</li>
												<li>정상:18~22</li>
												<li>과체중:23~25</li>
												<li>경도비만26~29</li>
												<li>중등도30이상</li>
											</ul>
										</div>
										<p>
											<b>BMI 지수만을 맹신하지 마세요!</b>
										</p>
										<p>
											남성의 경우 체지방률이 25% 이상일때 보통 "마른비만"일 수 있습니다. 
											여성의 경우 체지방률이 30% 이상일때 보통 "마른비만" 일 수 있습니다.
										</p>
										<P>
											<b>허리둘레도 재 보세요!</b>
										</p>
										<p>
											남성의 경우 90cm 이상이면 "복부비만" 입니다.
											여성의 경우 85cm 이상이면 "복부비만" 입니다.
										</P>
										<p><b>꾸준한 운동으로 건강하고 탄탄한 몸매를 만들어보세요!</b></p>
									</c:when>
									<c:when test="${bmi >= '23' && bmi < '25'}">
										<h2>
											<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
										</h2>
											<div class="progress">
												<div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.3}%">
											    ${bmi}
												</div>
											</div>
										<h6>
											<span>
												<strong>체질량(BMI)지수</strong>
												는<em class="aq">${bmi}</em> 입니다.
											</span>
											<span class="fat">
												현재
												<em>과체중</em> 으로 보입니다.
											</span>
										</h6>
										<div class="reference">
											<ul>
												<li>저체중:18미만</li>
												<li>정상:18~22</li>
												<li>과체중:23~25</li>
												<li>경도비만26~29</li>
												<li>중등도30이상</li>
											</ul>
										</div>
										<p>
											<b>BMI 지수만을 맹신하지 마세요!</b>
										</p>
										<p>
											남성의 경우 체지방률이 25% 이상일때 보통 "마른비만"일 수 있습니다. 
											여성의 경우 체지방률이 30% 이상일때 보통 "마른비만" 일 수 있습니다.
										</p>
										<P>
											<b>허리둘레도 재 보세요!</b>
										</p>
										<p>
											남성의 경우 90cm 이상이면 "복부비만" 입니다.
											여성의 경우 85cm 이상이면 "복부비만" 입니다.
										</P>
										<p><b>꾸준한 운동으로 건강하고 탄탄한 몸매를 만들어보세요!</b></p>
									</c:when>
									<c:when test="${bmi >= '26' && bmi < '29'}">
										<h2>
											<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
										</h2>
											<div class="progress">
												<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.7}%">
											    ${bmi}
												</div>
											</div>
										<h6>
											<span>
												<strong>체질량(BMI)지수</strong>
												는 <em class="aq">${bmi}</em> 입니다.
											</span>
											<span class="fat">
												현재
												<em>경도 비만</em> 으로 보입니다.
											</span>
										</h6>
										<div class="reference">
											<ul>
												<li>저체중:18미만</li>
												<li>정상:18~22</li>
												<li>과체중:23~25</li>
												<li>경도비만26~29</li>
												<li>중등도30이상</li>
											</ul>
										</div>
										<p>
											<b>BMI 지수만을 맹신하지 마세요!</b>
										</p>
										<p>
											남성의 경우 체지방률이 25% 이상일때 보통 "마른비만"일 수 있습니다. 
											여성의 경우 체지방률이 30% 이상일때 보통 "마른비만" 일 수 있습니다.
										</p>
										<P>
											<b>허리둘레도 재 보세요!</b>
										</p>
										<p>
											남성의 경우 90cm 이상이면 "복부비만" 입니다.
											여성의 경우 85cm 이상이면 "복부비만" 입니다.
										</P>
										<p><b>꾸준한 운동으로 건강하고 탄탄한 몸매를 만들어보세요!</b></p>
										<a class="membershipApply" data-target="#layerpop" data-toggle="modal">나에게 맞는 추천식단보기</a><br/>
										<div class="modal fade" id="layerpop">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <!-- header -->
										      <div class="modal-header">
										        <!-- 닫기(x) 버튼 -->
										        <button type="button" class="close" data-dismiss="modal">×</button>
										        <!-- header title -->
										        <h4 class="modal-title">Header</h4>
										      </div>
										      <!-- body -->
										      <div class="modal-body">
										      </div>
										      <!-- Footer -->
										      <div class="modal-footer">
										        Footer
										        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										      </div>
										    </div>
										  </div>
										</div>
									</c:when>
									<c:otherwise>
										<h2>
											<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
										</h2>
											<div class="progress">
												<div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.7}%">
											    ${bmi}
												</div>
											</div>
										<h6>
											<span>
												<b>체질량(BMI)지수</b>
												는<em class="aq">${bmi}</em> 입니다.
											</span>
											<span class="fat">
												현재
												<em>중등도 비만</em> 으로 보입니다.
											</span>
										</h6>
										<div class="reference">
											<ul>
												<li>저체중:18미만</li>
												<li>정상:18~22</li>
												<li>과체중:23~25</li>
												<li>경도비만26~29</li>
												<li>중등도30이상</li>
											</ul>
										</div>
										<p>
											<b>BMI 지수만을 맹신하지 마세요!</b>
										</p>
										<p>
											남성의 경우 체지방률이 25% 이상일때 보통 "마른비만"일 수 있습니다. 
											여성의 경우 체지방률이 30% 이상일때 보통 "마른비만" 일 수 있습니다.
										</p>
										<P>
											<b>허리둘레도 재 보세요!</b>
										</p>
										<p>
											남성의 경우 90cm 이상이면 "복부비만" 입니다.
											여성의 경우 85cm 이상이면 "복부비만" 입니다.
										</P>
										<p><b>꾸준한 운동으로 건강하고 탄탄한 몸매를 만들어보세요!</b></p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="myheadPC_myCoin">
							<span class="mP_ctxt">현재 사용가능한 코인:</span>
			            	<span class="mP_coin" id="mP_coin">${dto.member_coin}</span>
			                <span class="mP_ctxt">COIN</span>
				        </div>
						<c:choose>
							<c:when test="${dto.member_coin == '0'}">
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
							<c:when test="${empty dto.member_coin >= '1'}">
				                <div class="notYetMembership">
				                	<div class="mypayInfo" id="mypayInfom">
					                    <table class="table table-striped table-hover">
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






















