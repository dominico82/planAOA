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
							<span class="userCircleImg"></span>
						</span>
						<h6>
							${sessionScope.member_name}<small>님</small>
							<br>
							${sessionScope.saveid}($sessionScope.)
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
							<a onclick="info()" class="membershipApply">"체질량지수 보러가기"</a>
						</div>
						<h3><i class="fa fa-clone"></i>"내 멤버십"</h3>
						<div class="notYetMembership">
							<h4>필요한 만큼 결제하세요!</h4>
							<p>
								<a href="" class="membershipApply">
									<i class="fa fa-clone"></i>"멤버십 신청하기"
								</a>
							</p>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>





















