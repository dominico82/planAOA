<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>만족스러운 피트니스 Nfit</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<script>
var userId="${dto.member_id}";
var userName="${dto.member_name}";
var userEmail="${dto.member_email}";
var userTel="${dto.member_tel}";
var userAddr="${dto.member_addr}";
</script>
	</head>
	
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>/
<br><br><br>
	
	<section>
		<article>
		<div style="margin-top:50px;">
		<div class="content">
					<div class="about">
						<div class="wrap">
							<h1>About <span>Nfit</span> :: 이용안내</h1>
							<div class="panels">
								<div class="panel-left">
									<span> </span>
								</div>
								<div class="panel-right">
									<h3>해당화면을 보여주기만하면  바로입장 가능 </h3>
									<p>코인으로 원하시는 제휴센터의 프로그램 시간을 예약한 후 예약된 시간전에 방문 하시면 센터데스크에서 해당화면을 확인한 후 , 
									  센터 담당자가 친절하게 구매 프로그램 진행을 도와드립니다. ^^ 부담없이 예약해 주세요. </p>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						</div>
		
	
			<div class="content">
				<div class="wrap">
				<!---start-mid-grids--->
					<div class="mid-grids">
						<div class="wrap">
						<div class="mid-grids-left">
							<img src="resources/images/app-divices.jpg" title="divices" />
							<span> </span>
						</div>
						<div class="mid-grids-right">
							<h3> <span>Nfit</span> 모바일앱 을 설치하세요!! </h3>
							<p>지금<big>앱스토어</big> 에서 <big>설치하세요.</big></p>
							<ul class="fea">
								<li><a href="#" style="decoration:none;">제휴시설 이용을 더욱 편리하게!</a></li>
								<li><a href="#" style="decoration:none;">한번에 가입부터 결제까지 </a></li>
								<li><a href="#" style="decoration:none;">나와 가까운 제휴시설 확인하기</a></li>
								<li><a href="#" style="decoration:none;">제휴시설 상세검색하기</a></li>
								<li><a href="#" style="decoration:none;">제휴시설 입장하기</a></li>
							</ul>
							<div class="big-btns">
								<ul>
									<li><a class="and" href="#"> </a></li>
									<li><a class="iphone" href="#"> </a></li>
								</ul>
							</div>
						</div>
						<div class="clear"> </div>
					</div>
				</div>		
				
					<!--- start-top-grids---->
					<div class="top-grids">
						<div class="top-grid">
							<div class="product-pic frist-product-pic">
								<img src="resources/images/img_step_1.png" width="280" height="280" title="watch" />
							</div>
							<span><label>1</label></span>
							<div class="border"> </div>
							<a href="#">회원가입 및 코인결제</a>
						</div>
						<div class="top-grid">
							<div class="product-pic">
								<img src="resources/images/img_step_2.png" width="280" height="280" title="shoe" />
							</div>
							<span><label>2</label></span>
							<div class="border hide"> </div>
							<a href="#">원하는 센터 검색 및 예약</a>
						</div>
						<div class="top-grid hide">
							<div class="product-pic">
								<img src="resources/images/img_step_3.png" width="280" height="280" title="laptop" />
							</div>
							<span><label>3</label></span>
							<a href="#">센터 데스크 방문 인증 후 운동시작</a>
						</div>
						<div class="clear"> </div>
					</div>
					</div>
					<!--- start-top-grids---->
				
					</div>
			
		
		
	<!---start-testimonials---->
						<div class="testimonials">
							<div class="wrap">
							<div class="testimonial-head">
								<h1><span>Nfit</span> 을 칭찬합시다.</h1>
								<p>Kind words from our valuable customers</p>
							</div>
							<div class="testimonial-grids">
								<div class="testimonial-grid">
									<a href="#"><img src="resources/images/test-people1.png" alt=""></a>
									<p>보통의 스포츠센터가 가지고 있는 핸디캡은 바로 위치에요. 근처 큰 건물에 위치해있으면 자연스럽게 홍보가 될 텐데 보통은 지하나 동네에 위치해있거든요. Nfit를 통해 저희 센터를 알게 된 회원들이 많아져서 굉장히 만족하고 있어요.</p>
									<a href="#">james,Envato</a>
								</div>
								<div class="testimonial-grid">
									<a href="#"><img src="resources/images/test-people2.png" alt=""></a>
									<p>저처럼 바쁜 사람들도 운동에 투자하는 비용을 합리적으로 느낄 수 있게 해준다는 점이에요. 헬스장은 연회권을 구매해도 가는 날보단 못 가는 날이 더 많잖아요. ...</p>
									<a href="#">Mariya, Activeden</a>
								</div>
								<div class="testimonial-grid">
									<a href="#"><img src="resources/images/test-people3.png" alt=""></a>
									<p>요가는 나랑 맞지 않아’ 라고 얘기하는 분들도 다른 센터로 옮기시면 잘 맞을 수도 있어요. ... Nfit 덕분에 여기 저기 다녀보고 저와 잘 맞는 요가 센터를 찾아서 지금은 굉장히 만족하고 ...</p>
									<a href="#">Steven, Microlancer</a>
								</div>
								<div class="clear"> </div>
							</div>
				  		</div>
				  		<!---//End-testimonials---->
				  		<!----start-clients-slider--->
				  		<div class="clients-slider">
						<div"><div class="nbs-flexisel-inner"><ul class="flexiselDemo3 nbs-flexisel-ul" style="left: -175.2px; display: block;">
						<li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c3.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c4.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c1.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c2.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c3.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c4.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c1.png"></li><li class="nbs-flexisel-item" style="width: 175.2px;"><img src="resources/images/c2.png"></li></ul><div class="nbs-flexisel-nav-left" style="top: 13px;"></div><div class="nbs-flexisel-nav-right" style="top: 13px;"></div></div></div> 
						<div class="clear"> </div>      
							

						</div>
						<!----start-clients-slider--->
					</div>
				</div>
				</div>
		
		
		<div class="content">
				<div class="content-feature-grids">
					<div class="wrap"> 
						<h1><span>Nfit</span> 를 이용하시면</h1>
					<div class="feature-grid">
						<div class="feature-grid-left icon1">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>쾌적한 시설의 추구</h2>
							<p>제휴업체 계약시 시설의 환경을 최우선적으로 생각하겠습니다. </p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon2">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>센터이용의 메뉴얼화</h2>
							<p>회원님의 센터이용시 센터마다의 서비스 및 시설 매뉴얼을 공개해 서비스에 모자람이 없도록 준비하도록 하겠습니다.</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon3">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>매일 업데이트 되는 업체정보</h2>
							<p>저희와 제휴되는 업체들은 지금도 계속 늘어나고 있습니다. ^^</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon4">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>SNS, 메신져를 통한 빠른 서비스</h2>
							<p>서비스 이용시 불편함이 없도록 실시간 응답서비스를 해드리겠습니다.</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon5">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>자동 알림</h2>
							<p>결제된 코인의 유효기간이 만료되기 이전에 이용하실 수 있도록 안내를 드리며, 다만 유효기간이 지나면 50%의 환불만 가능합니다.</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon6">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2>통계자료제공</h2>
							<p>해당센터에서 데이터 측정 서비스가 가능한 경우 해당데이터를 앱으로 확인 하실 수 있게 해드립니다.</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="clear"> </div>
				</div>
				</div>
			</div>
			
			
		</article>
	</section>
		<footer>
			<jsp:include page="../footer.jsp"/>
		</footer>
	</body>
</body>
</html>