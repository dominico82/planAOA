<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족스러운 피트니스 Nfit 회원정보 보기</title>

<link rel="stylesheet" type="text/css" href="resources/css/progressBar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/httpRequest.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-filestyle.min.js"></script>
<jsp:include page="../header.jsp"/>
<link rel="stylesheet" type="text/css" href="resources/css/mypage1.css"/>

<style>
table th{
	text-align: center;
}
table td{
	text-align: center;
}
div.navbar-brand{
	width: 128px;
	height: 90px;
}
</style>
<script>

$(document).ready(function(){ //DOM이 준비되고
    $('#bmiCheck').click(function(){ // ID가 bmiCheck인 요소를 클릭하면
        var state = $('#bmiResult').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
        if(state == 'none'){ // state가 none 상태일경우
            $('#bmiResult').show();
        }else{ // 그 외에는
            $('#bmiResult').hide();
        }
    });
});

$(document).ready(function(){ //DOM이 준비되고
    $('#memberInfo').click(function(){ // ID가 bmiCheck인 요소를 클릭하면
        var state = $('#infoContent').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
        if(state == 'none'){ // state가 none 상태일경우
        	$("#markContent").hide();
            $('#infoContent').show();
        }else{ // 그 외에는
            $('#infoContent').hide();
        }
    });
});

$(document).ready(function(){ //DOM이 준비되고
    $('#bookmark').click(function(){ // ID가 bmiCheck인 요소를 클릭하면
        var state = $('#markContent').css('display'); // state 변수에 ID가 moreMenu인 요소의 display의 속성을 '대입'
        if(state == 'none'){ // state가 none 상태일경우
        	$("#infoContent").hide();
            $('#markContent').show();
        }else{ // 그 외에는
            $('#markContent').hide();
        }
    });
});


					
</script>
<script>
function picLoad(){
	document.upload.submit();
}
</script>
<script>
function bookingDel(member_id, co_idx, use_date, usemember_coin, member_coin){
	var refundCoin=member_coin+usemember_coin;
	console.log(member_id);
	console.log(co_idx);
	console.log(use_date);
	console.log(usemember_coin);
	console.log(member_coin);
	$.ajax({
		type:"POST",
		url: "bookingDel.do",
		data: "member_id="+member_id+"&co_idx="+co_idx+"&use_date="+use_date+"&usemember_coin="+refundCoin,
		success: function(data){
			if(data==1){
				alert('예약이 취소되었습니다!');
				console.log("예약삭제성공!");
				location.reload();
			}
		},
		error: function(data){
			alert("실패!!");
		}
	});
	
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
							<span class="userCircleImg">
							<c:forEach var="pics" items="${pic}"><img class="imgsize" src="resources/upload_images/${pics}"></c:forEach>
							</span>
						</span>
						<form name="upload" action="fileUpload.do" method="post" enctype="multipart/form-data">
							<span class="btn btn-default btn-file">사진 선택
							<input type="file" name="files" accept="image/*">
							</span>
							<div class="current">
								<a href="javascript:picLoad();" class="current" style="text-decoration: none">사진 바꾸기</a>
							</div>
							<input type="hidden" value="${dto.member_id}" name="id">
							<input type="hidden" value="${dto.member_idx}" name="idx">
						</form>
						<br>
						<h6>
							${dto.member_name}<small>님</small>
						</h6>
						<div class="userPicComment upcOK">
							<p class="text-anc">와~ 멋진 사진이네요!</p>
							
						</div>
					</div>
					<div class="mypageMenuWrap">
						<div class="mypageMenu">
							<ul>
								<li>
									<a class="current" href="modifyForm.do">회원정보 수정</a>
								</li>
								<li>
									<a class="current" id="memberInfo">mypage</a>
								</li>
								<li>
									<a class="current" id="bookmark">가보고 싶은 센터</a>
								</li>
								<li>
									<a href="coin.do" id="a_index" class="current">멤버십 신청하기</a>
								</li>
							</ul>
						</div>
					</div>
				</aside>
				<div class="col-lg-10 col-md-9 col-sm-8 mypagePanel" id="inner_top">
					<div id="infoContent">
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
													<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2}%">
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
											<a class="membershipApply" data-target="#layerpop" data-toggle="modal">나에게 맞는 추천식단보기</a><br/>
											<div class="modal fade" id="layerpop">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <!-- header -->
											      <div class="modal-header">
											        <!-- 닫기(x) 버튼 -->
											        <button type="button" class="close" data-dismiss="modal">×</button>
											        	
											        <h4 class="modal-title"><b>${dto.member_name}</b> 님을 위한 체중증량 식단</h4>
											      </div>
											      <!-- body -->
											      <div class="modal-body">
													<table class="table table-striped table-hover">
														<thead>
															<tr style="background-color: #00bff0; color: white;">
																<th></th>
																<th>월</th>
																<th>화</th>
																<th>수</th>
																<th>목</th>
																<th>금</th>
																<th>토</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>아침(950Kcal 이상)</td>
																<td>흑미밥,북어당면국,돈육조림,오징어무침,배추김치</td>
																<td>팥밥,동태찌개,간고등어구이,콩나물고추장잡채,배추김치</td>
																<td>보리밥,쇠고기감자국,시금치무침,두부계란말이,배추김치</td>
																<td>팥밥,사골우거지국,꽁치고추장구이,호박새우젓볶음</td>
																<td>닭죽,감자도너츠,메론,깍두기</td>
																<td>팥밥,어묵무국,햄스크램블,콩나물무침,배추김치</td>
															</tr>
															<tr>
																<td>점심(1100Kal 이상)</td>
																<td>쌀밥,크림스프,돈까스,샐러드,배추김치</td>
																<td>비빔밥,쇠고기미역국,꿀떡,요구르트</td>
																<td>짜장밥,모시조개국,찹쌀도너츠,배추김치</td>
																<td>잡채밥,실파계란국,오징어링튀김,깍두기</td>
																<td>옥수수밥,수제비,생선커틀렛,감자조림,배추김치</td>
																<td>해시라이스,달걀국,복숭아,약식,배추김치</td>
															</tr>
															<tr>
																<td>저녁(950Kcal 이상)</td>
																<td>밤밥,감자탕,김치전,콩조림,깍두기</td>
																<td>해물밥,유부장국,고구마야채튀김,사과,배추김치</td>
																<td>율무밥,건새우된장국,생선볼튀김,고구마조림,배추김치</td>
																<td>차조밥,조기매운탕,닭날개조림,김,배추김치</td>
																<td>불고기덮밥,콩나물국,고구마맛탕,토마토</td>
																<td>닭칼국수,야채고로케,배추김치</td>
															</tr>
															<tr>
																<td>간식(300~400Kcal)</td>
																<td>우유 1잔,토마토주스,사과</td>
																<td>우유 1잔,피자 1조각,오렌지주스</td>
																<td>우유 1잔,키위,찐옥수수 1개</td>
																<td>우유 1잔,토마토주스,바나나 1개</td>
																<td>우유 1잔,오렌지주스,피자 1조각</td>
																<td>귤 1개,꿀떡 120g,우유 1잔,치즈케익 60g</td>
															</tr>
														</tbody>
													</table>
											      </div>
											      <!-- Footer -->
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											      </div>
											    </div>
											  </div>
											</div>
										</c:when>
										<c:when test="${bmi >= '18' && bmi < '23'}">
											<h2>
												<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
											</h2>
												<div class="progress">
													<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2}%">
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
											<a class="membershipApply" data-target="#layerpop" data-toggle="modal">나에게 맞는 추천식단보기</a><br/>
											<div class="modal fade" id="layerpop">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <!-- header -->
											      <div class="modal-header">
											        <!-- 닫기(x) 버튼 -->
											        <button type="button" class="close" data-dismiss="modal">×</button>
											        	
											        <h4 class="modal-title"><b>${dto.member_name}</b> 님을 위한 고단백 식단</h4>
											      </div>
											      <!-- body -->
											      <div class="modal-body">
													<table class="table table-striped table-hover">
														<thead>
															<tr style="background-color: #00bff0; color: white;">
																<th></th>
																<th>월</th>
																<th>화</th>
																<th>수</th>
																<th>목</th>
																<th>금</th>
																<th>토</th>
																<th>일</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>아침</td>
																<td>삶은달걀 3개,자몽 1개,토스트 1장,블랙커피</td>
																<td>삶은달걀 1개,자몽 1개,블랙커피</td>
																<td>삶은달걀 1개,자몽 1개,블랙커피</td>
																<td>삶은달걀 1개,자몽 1개,블랙커피</td>
																<td>삶은달걀 3개,오이 1개,토스트 1장,블랙커피</td>
																<td>삶은달걀 3개,자몽 1개,토스트 1장,블랙커피</td>
																<td>삶은달걀 1개,자몽 1개,블랙커피</td>
															</tr>
															<tr>
																<td>점심</td>
																<td>삶은달걀 3개,토스트 1장,블랙커피</td>
																<td>삶은달걀 2개,자몽 1개,토스트 1장,블랙커피</td>
																<td>야채샐러드,자몽 1개,토스트 1장,블랙커피</td>
																<td>야채샐러드,자몽 1개,토스트 1장,블랙커피</td>
																<td>삶은달걀 3개,시금치나물,토스트 1장,블랙커피</td>
																<td>과일샐러드(오이,양상추,사과,딸기,바나나)</td>
																<td>닭고기구이,토마토 1개,오이 1개,블랙커피</td>
															</tr>
															<tr>
																<td>저녁</td>
																<td>삶은달걀 3개,야채샐러드(오이,샐러리,양상추,레몬즙)</td>
																<td>쇠고기스테이크,샐러드(토마토,샐러리,오이,양상추)</td>
																<td>삶은달걀 2개,굽거나 삶은 양고기,샐러드,블랙커피</td>
																<td>삶은달걀 3개,시금치 나물,블랙커피</td>
																<td>굽거나 찐 흰살생선 1토막,야채샐러드,토스트 1장</td>
																<td>쇠고기스테이크,샐러리,토마토,블랙커피</td>
																<td>야채수프,닭고기구이,토마토,양배추,샐러리,자몽 1개</td>
															</tr>
														</tbody>
													</table>
											      </div>
											      <!-- Footer -->
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											      </div>
											    </div>
											  </div>
											</div>
										</c:when>
										<c:when test="${bmi >= '23' && bmi < '25'}">
											<h2>
												<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
											</h2>
												<div class="progress">
													<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.3}%">
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
											<a class="membershipApply" data-target="#layerpop" data-toggle="modal">나에게 맞는 추천식단보기</a><br/>
											<div class="modal fade" id="layerpop">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <!-- header -->
											      <div class="modal-header">
											        <!-- 닫기(x) 버튼 -->
											        <button type="button" class="close" data-dismiss="modal">×</button>
											        	
											        <h4 class="modal-title"><b>${dto.member_name}</b> 님을 위한 체중감량 식단</h4>
											      </div>
											      <!-- body -->
											      <div class="modal-body">
													<table class="table table-striped table-hover">
														<thead>
															<tr style="background-color: #00bff0; color: white;">
																<th></th>
																<th>월</th>
																<th>화</th>
																<th>수</th>
																<th>목</th>
																<th>금</th>
																<th>토</th>
																<th>일</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>아침</td>
																<td>현미밥, 된장국, 닭가슴살조림, 배추김치, 귤 1개</td>
																<td>보리식빵 2장, 닭가슴살샐러드, 저지방우유 1컵</td>
																<td>고구마 1개, 방울토마토 20개, 저지방우유 1컵</td>
																<td>고구마 1/2개, 미숫가루 1잔, 사과 1/3개</td>
																<td>보리식빵 2장, 양배추샐러드, 사과주스 1잔</td>
																<td>고구마 1개, 귤 1개, 닭가슴살양파샐러드</td>
																<td>미숫가루 1잔, 귤 1개, 닭가슴살조림</td>
															</tr>
															<tr>
																<td>점심</td>
																<td>고구마 1개, 방울토마토 20개, 두유 1컵</td>
																<td>고구마 1개, 방울토마토 20개, 두유 1컵,귤 1개</td>
																<td>현미밥, 닭가슴살조림, 배추김치, 귤 1개</td>
																<td>현미밥, 달걀탕, 닭가슴살오븐구이, 배추김치</td>
																<td>현미보리밥, 무 된장국, 오이무침, 닭가슴살샐러드, 배추김치</td>
																<td>현미밥, 매콤한중국식닭볶음, 느타리버섯볶음, 배추김치</td>
																<td>현미식빵 1장, 닭날개오븐구이, 오이스틱, 방울토마토 5개</td>
															</tr>
															<tr>
																<td>저녁</td>
																<td>현미콩밥, 된장배추국, 닭살무침, 배추김치</td>
																<td>현미식빵 1장, 닭가슴살샐러드</td>
																<td>고구마 1개, 닭가슴살 샐러드</td>
																<td>현미밥, 미역된장국, 닭가슴살샐러드, 배추김치</td>
																<td>현미식빵 1개, 토마토 1/4개, 양배추 간장샐러드</td>
																<td>현미식빵 1개, 브로콜리 오이샐러드, 우유 1잔</td>
																<td>고구마 1개, 매콤한 중국식 닭볶음</td>
															</tr>
														</tbody>
													</table>
											      </div>
											      <!-- Footer -->
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											      </div>
											    </div>
											  </div>
											</div>
										</c:when>
										<c:when test="${bmi >= '26' && bmi < '29'}">
											<h2>
												<span>꾸준한 운동으로 건강관리 하실 필요가 있습니다.</span>
											</h2>
												<div class="progress">
													<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.7}%">
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
											        	
											        <h4 class="modal-title"><b>${dto.member_name}</b> 님을 위한 체중감량 식단</h4>
											      </div>
											      <!-- body -->
											      <div class="modal-body">
													<table class="table table-striped table-hover">
														<thead>
															<tr style="background-color: #00bff0; color: white;">
																<th></th>
																<th>월</th>
																<th>화</th>
																<th>수</th>
																<th>목</th>
																<th>금</th>
																<th>토</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>아침</td>
																<td>현미밥, 된장국, 닭가슴살조림, 배추김치, 귤 1개</td>
																<td>보리식빵 2장, 닭가슴살샐러드, 저지방우유 1컵</td>
																<td>고구마 1개, 방울토마토 20개, 저지방우유 1컵</td>
																<td>고구마 1/2개, 미숫가루 1잔, 사과 1/3개</td>
																<td>보리식빵 2장, 양배추샐러드, 사과주스 1잔</td>
																<td>고구마 1개, 귤 1개, 닭가슴살양파샐러드</td>
																<td>미숫가루 1잔, 귤 1개, 닭가슴살조림</td>
															</tr>
															<tr>
																<td>점심</td>
																<td>고구마 1개, 방울토마토 20개, 두유 1컵</td>
																<td>고구마 1개, 방울토마토 20개, 두유 1컵,귤 1개</td>
																<td>현미밥, 닭가슴살조림, 배추김치, 귤 1개</td>
																<td>현미밥, 달걀탕, 닭가슴살오븐구이, 배추김치</td>
																<td>현미보리밥, 무 된장국, 오이무침, 닭가슴살샐러드, 배추김치</td>
																<td>현미밥, 매콤한중국식닭볶음, 느타리버섯볶음, 배추김치</td>
																<td>현미식빵 1장, 닭날개오븐구이, 오이스틱, 방울토마토 5개</td>
															</tr>
															<tr>
																<td>저녁</td>
																<td>현미콩밥, 된장배추국, 닭살무침, 배추김치</td>
																<td>현미식빵 1장, 닭가슴살샐러드</td>
																<td>고구마 1개, 닭가슴살 샐러드</td>
																<td>현미밥, 미역된장국, 닭가슴살샐러드, 배추김치</td>
																<td>현미식빵 1개, 토마토 1/4개, 양배추 간장샐러드</td>
																<td>현미식빵 1개, 브로콜리 오이샐러드, 우유 1잔</td>
																<td>고구마 1개, 매콤한 중국식 닭볶음</td>
															</tr>
														</tbody>
													</table>
											      </div>
											      <!-- Footer -->
											      <div class="modal-footer">
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
													<div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="35" style="width:${bmi*2.7}%">
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
											<a class="membershipApply" data-target="#layerpop" data-toggle="modal">나에게 맞는 추천식단보기</a><br/>
											<div class="modal fade" id="layerpop">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <!-- header -->
											      <div class="modal-header">
											        <!-- 닫기(x) 버튼 -->
											        <button type="button" class="close" data-dismiss="modal">×</button>
											        	
											        <h4 class="modal-title"><b>${dto.member_name}</b> 님을 위한 체중감량 식단</h4>
											      </div>
											      <!-- body -->
											      <div class="modal-body">
													<table class="table table-striped table-hover">
														<thead>
															<tr style="background-color: #00bff0; color: white;">
																<th></th>
																<th>월</th>
																<th>화</th>
																<th>수</th>
																<th>목</th>
																<th>금</th>
																<th>토</th>
																<th>일</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>아침</td>
																<td>현미밥, 된장국, 닭가슴살조림, 배추김치, 귤 1개</td>
																<td>보리식빵 2장, 닭가슴살샐러드, 저지방우유 1컵</td>
																<td>고구마 1개, 방울토마토 20개, 저지방우유 1컵</td>
																<td>고구마 1/2개, 미숫가루 1잔, 사과 1/3개</td>
																<td>보리식빵 2장, 양배추샐러드, 사과주스 1잔</td>
																<td>고구마 1개, 귤 1개, 닭가슴살양파샐러드</td>
																<td>미숫가루 1잔, 귤 1개, 닭가슴살조림</td>
															</tr>
															<tr>
																<td>점심</td>
																<td>고구마 1개, 방울토마토 20개, 두유 1컵</td>
																<td>고구마 1개, 방울토마토 20개, 두유 1컵,귤 1개</td>
																<td>현미밥, 닭가슴살조림, 배추김치, 귤 1개</td>
																<td>현미밥, 달걀탕, 닭가슴살오븐구이, 배추김치</td>
																<td>현미보리밥, 무 된장국, 오이무침, 닭가슴살샐러드, 배추김치</td>
																<td>현미밥, 매콤한중국식닭볶음, 느타리버섯볶음, 배추김치</td>
																<td>현미식빵 1장, 닭날개오븐구이, 오이스틱, 방울토마토 5개</td>
															</tr>
															<tr>
																<td>저녁</td>
																<td>현미콩밥, 된장배추국, 닭살무침, 배추김치</td>
																<td>현미식빵 1장, 닭가슴살샐러드</td>
																<td>고구마 1개, 닭가슴살 샐러드</td>
																<td>현미밥, 미역된장국, 닭가슴살샐러드, 배추김치</td>
																<td>현미식빵 1개, 토마토 1/4개, 양배추 간장샐러드</td>
																<td>현미식빵 1개, 브로콜리 오이샐러드, 우유 1잔</td>
																<td>고구마 1개, 매콤한 중국식 닭볶음</td>
															</tr>
														</tbody>
													</table>
											      </div>
											      <!-- Footer -->
											      <div class="modal-footer">
											        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											      </div>
											    </div>
											  </div>
											</div>
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
						                    <table class="tavle tavle-striped tavle-hover">
						                    	<thead>
							                    	<tr>
							                    		<th>결제일</th>
							                    		<th>결제방법</th>
							                    		<th>구매가격</th>
							                    		<th>구매코인</th>
							                    	</tr>
						                    	</thead>
						                    	<tbody>
						                    		<c:if test="${empty list}">
						                    			<tr>
						                    				<td colspan="4">결제 내역이 없습니다.</td>
						                    			<tr>
						                    		</c:if>
						                    		<c:if test="${!empty list}">
							                    		<c:forEach var="dta" items="${list}">
								                    		<tr class="info">
								                    			<td><fmt:formatDate value="${dta.PAY_DATE}" pattern="yyyy-MM-dd"/></td>
								                    			<td>
								                    				<c:if test="${dta.PAY_METHOD=='card'}">
								                    				카드
								                    				</c:if>
								                    				<c:if test="${dta.PAY_METHOD=='vbank'}">
								                    				가상계좌
								                    				</c:if>
								                    			</td>
								                    			<td>${dta.PAY_PRICE}원</td>
								                    			<td>${dta.PAY_COIN}coin</td>
								                    		</tr>
								                    	</c:forEach>					          
						                    		</c:if>
						                    		          	
						                    	</tbody>
						                    </table>
						                    <br><div>${pageStr}</div><br>
						                    <table class="tavle tavle-striped tavle-hover">
						                    	<thead>
							                    	<tr>
							                    		<th>예약일</th>
							                    		<th>예약장소</th>
							                    		<th>결제한 코인</th>
							                    		<th>취소</th>
							                    	</tr>
						                    	</thead>
						                    	<tbody>
						                    		<c:if test="${empty list2}">
						                    			<tr>
						                    				<td colspan="4">예약 내역이 없습니다!</td>
						                    			<tr>
						                    		</c:if>
						                    		<c:if test="${!empty list2}">
							                    		<c:forEach var="dta2" items="${list2}">
								                    		<tr class="info">
								                    			<td>${dta2.USE_DATE}</td>
								                    			<td>${dta2.CO_NAME}</td>
								                    			<td>${dta2.USEMEMBER_COIN}코인</td>
								                    			<td><button type="button" class="btn btn-sm btn-info" onclick="javascript:bookingDel('${dta2.MEMBER_ID}', ${dta2.CO_IDX}, '${dta2.USE_DATE}', ${dta2.USEMEMBER_COIN}, ${dto.member_coin});"><i class="fa fa-edit"></i>예약취소</button></td>
								                    		</tr>

								                    	</c:forEach>					          
						                    		</c:if>
						                    		          	
						                    	</tbody>
						                    </table>
						                    <br><div>${pageStr2}</div>
										</div>
									</div>
								</c:when>
		                    </c:choose>
						</section>
					</div>
					<div id="markContent" style="display: none;">
						<section class="myMembership">
							<table class="tavle tavle-striped tavle-hover">
		                    	<thead>
			                    	<tr>
			                    		<th colspan="5" style="text-align: center;">즐겨찾기 업체</th>
			                    	</tr>
		                    	</thead>
		                    	<tbody>
			                    		<tr>
			                    			<td></td>
			                    			<td>업체명</td>
			                    			<td>종목</td>
			                    			<td>이용회수</td>
			                    			<td>연락처</td>
			                    		</tr>
			                    	<c:forEach var="cdt" items="${cdt}">
			                    		<tr class="info">
			                    			<td><img src="resources/centerImage/${cdt.co_view}/${cdt.co_view}_0.jpg" class="markimgsize"></td>
			                    			<td>${cdt.co_name}</td>
			                    			<td>${cdt.co_class}</td>
			                    			<td>${cdt.co_usecount}</td>
			                    			<td>${cdt.co_phone}</td>
			                    		</tr>
			                    	</c:forEach>
		                    	</tbody>
		                    </table>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>






















