<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Runkeeper Website Template | Home :: w3layouts</title>
		<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="resources/images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
	    <!---strat-slider---->
	    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="resources/css/slider-style.css" />
		<script type="text/javascript" src="resources/js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		<!---start-login-script--->
		<script src="resources/js/login.js"></script>
		<!---//End-login-script--->
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<link type="text/css" rel="stylesheet" href="resources/css/coin.css" />
		<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script type="text/javascript" src="resources/js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>
		<!-----//768px-menu----->
<!-- 코인결제 jquery -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript" src="resources/js/pwstabs.js"></script>
<script>
$(function(){
	$("a[data-tab-id='tab2']").click(
			function(){
						$("a[data-tab-id='tab2']").addClass('pws_tab_active');
						$("a[data-tab-id='tab1']").removeClass('pws_tab_active');
						$("div[data-pws-tab='tab2']").addClass('pws_show');
						$("div[data-pws-tab='tab1']").removeClass('pws_show');
						$("#agreeTitle").css("display", "block");
						$("#regul_agree_check").css("display", "block");
						$("#regularAgreement").css("display", "inline-block");
						$("#regul_agree_txt").text("※ 할인 정액권 3개월간 취소불가 동의 해 주세요");
						$("#VBANK_cont").css("display", "none");
						$("#buy_pass_btn").hide();
						$("#buy_monthly_pass_btn").show();
			});
	$("a[data-tab-id='tab1']").click(
			function(){
						$("a[data-tab-id='tab1']").addClass('pws_tab_active');
						$("a[data-tab-id='tab2']").removeClass('pws_tab_active');
						$("div[data-pws-tab='tab1']").addClass('pws_show');
						$("div[data-pws-tab='tab2']").removeClass('pws_show');
						$("#agreeTitle").css("display", "none");
						$("#regul_agree_check").css("display", "none");
						$("#regularAgreement").css("display", "none");
						$("#regul_agree_txt").text("");
						$("#VBANK_cont").css("display", "inline-block");
						$("#buy_pass_btn").show();
						$("#buy_monthly_pass_btn").hide();
			});
});
$(function(){
	$("#CARD").click(
			function(){
						$("#CARD").prop("checked", true);		
						$("#CARD").attr("value", "card");		
						$("#VBANK").prop("checked", false);
						$("#VBANK").removeAttr("value");
	});
	$("#VBANK").click(
			function(){
						$("#CARD").prop("checked", false);		
						$("#CARD").removeAttr("value");		
						$("#VBANK").prop("checked", true);
						$("#VBANK").attr("value", "vbank");
	});
});
$(function(){
	$("#pay_num1").click(
			function(){
						$("#pay_num1").addClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").removeClass("on");
						price="99000";
						buy_coin="100";
		
	});
	$("#pay_num2").click(
			function(){
						$("#pay_num1").removeClass("on");
						$("#pay_num2").addClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").removeClass("on");
						price="199000";
						buy_coin="200";
	});
	$("#pay_num3").click(
			function(){
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").addClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").removeClass("on");
						price="299000";
						buy_coin="300";
	});
	$("#pay_num4").click(
			function(){
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").addClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").removeClass("on");
						price="30000";
						buy_coin="30";
	});
	$("#pay_num5").click(
			function(){
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").addClass("on");
						$("#pay_num6").removeClass("on");
						price="99000";
						buy_coin="100";
	});
	$("#pay_num6").click(
			function(){
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").addClass("on");
						price="299000";
						buy_coin="300";
	});
});
</script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var pay="";
var price="0";
var buy_coin="";
var userName="${dto.member_name}";
var userEmail="${dto.member_email}";
var userTel="${dto.member_tel}";
var userAddr="${dto.member_addr}";
//일반결제 모듈
$(function(){
	$(".buy_pass_btn").click(
			function(){
				if(document.getElementById('CARD').value=="card"){
					pay="card";	
				}else if(document.getElementById('VBANK').value=="vbank"){
					pay="vbank";
				}

				if(price!="0"){
					IMP.request_pay({
					    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
					    pay_method : pay, //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
					    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
					    name : '주문명:결제테스트',
					    amount : price,
					    buyer_email : userEmail,
					    buyer_name : userName,
					    buyer_tel : userTel, //누락되면 이니시스 결제창에서 오류
					    buyer_addr : userAddr,
					    buyer_postcode : '123-456'
					}, function(rsp) {
					    if ( rsp.success ) {
					    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					    	jQuery.ajax({
					    		url: '/payments/complete', //cross-domain error가 발생하지 않도록 주의해주세요
					    		type: 'POST',
					    		dataType: 'json',
					    		data: {
						    		imp_uid : rsp.imp_uid
						    		//기타 필요한 데이터가 있으면 추가 전달
					    		}
					    	}).done(function(data) {
					    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					    		if ( everythings_fine ) {
					    			var msg = '결제가 완료되었습니다.';
					    			msg += '\n고유ID : ' + rsp.imp_uid;
					    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					    			msg += '\n결제 금액 : ' + rsp.paid_amount;
					    			msg += '카드 승인번호 : ' + rsp.apply_num;
					    			
					    			alert(msg);
					    			
					    		} else {
					    			//[3] 아직 제대로 결제가 되지 않았습니다.
					    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					    		}
					    	});

					        $('#getCoin').submit();
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        
					        alert(msg);
					        $('#getCoin').submit();
					    }
					});
				}else if(price=="0"){
					window.alert('상품을 선택해 주세요!');
				}
			});
});
//정기 결제 모듈
var monthly_checked="";

$(function(){
		$(".buy_monthly_pass_btn").click(
				function(){
					if($('input:checkbox[id="regularAgreement"]').is(":checked")==true){
						if(price!="0"){
							IMP.request_pay({
							    pg : 'inicis', // version 1.1.0부터 지원.
							    pay_method : 'card',
							    merchant_uid : 'merchant_' + new Date().getTime(),
							    customer_uid : 'your_customer_1234',
							    amount : price,
							    name : '주문명:빌링키 발급을 위한 결제',
							    buyer_email : userEmail,
							    buyer_name : userName,
							    buyer_tel : userTel
							}, function(rsp) {
							    if ( rsp.success ) {
							        var msg = '빌링키 발급이 완료되었습니다.';
							        msg += '고유ID : ' + rsp.imp_uid;
							        msg += '상점 거래ID : ' + rsp.merchant_uid;
							    } else {
							        var msg = '빌링키 발급에 실패하였습니다.';
							        msg += '에러내용 : ' + rsp.error_msg;
							    }
			
							    alert(msg);
						        $('#getCoin').submit();
							});
						}else if(price=="0"){
							window.alert('상품을 선택해 주세요!');
						}
					}else if($('input:checkbox[id="regularAgreement"]').is(":checked")==false){
						window.alert('할인 정액권 3개월간 자동 결제 취소 불가 동의를 해주세요!');
					}
		});
	
});
</script>
	</head>
	<body>
		<!---start-wrap---->
		<!------start-768px-menu---->
			<div id="page">
					<div id="header">
						<a class="navicon" href="#menu-left"> </a>
					</div>
					<nav id="menu-left">
						<ul>
							<li><a href="resources/index.html">Home</a></li>
							<li><a href="resources/about.html">About</a></li>
							<li><a href="resources/features.html">Features</a></li>
							<li><a href="coin.do">코인결제</a></li>
							<div class="clear"> </div>
						</ul>
					</nav>
			</div>
		<!------start-768px-menu---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="header-left">
					<div class="logo">
						<a href="resources/index.html">Runkeeper</a>
					</div>
				</div>
				<div class="header-right">
					<div class="top-nav">
					<ul>
						<li><a href="resources/index.html">Home</a></li>
						<li><a href="resources/about.html">About</a></li>
						<li><a href="resources/features.html">Features</a></li>
					</ul>
				</div>
				<div class="sign-ligin-btns">
					<ul>
						<li id="signupContainer"><a class="signup" id="signupButton" href="#"><span><i>Signup</i></span></a>
							 <div class="clear"> </div>
				                <div id="signupBox">                
				                    <form id="signupForm">
				                        <fieldset id="signupbody">
				                            <fieldset>
				                                <label for="email">Email Address <span>*</span></label>
				                                <input type="text" name="email" id="signupemail" />
				                            </fieldset>
				                            <fieldset>
				                                <label for="password">Choose Password <span>*</span></label>
				                                <input type="password" name="password" id="signuppassword" />
				                            </fieldset>
				                             <fieldset>
				                                <label for="password">Confirm Password <span>*</span></label>
				                                <input type="password" name="password" id="signuppassword1" />
				                            </fieldset>
				                            <input type="submit" id="signup" value="Register Now!" />
				                        </fieldset>
				                    </form>
				                </div>
				            <!-- Login Ends Here -->
						</li>
						<li id="loginContainer"><a class="login" id="loginButton" href="#"><span><i>Login</i></span></i></a>
							 <div class="clear"> </div>
				                <div id="loginBox">                
				                    <form id="loginForm">
				                        <fieldset id="body">
				                            <fieldset>
				                                <label for="email">Email Address</label>
				                                <input type="text" name="email" id="email" />
				                            </fieldset>
				                            <fieldset>
				                                <label for="password">Password</label>
				                                <input type="password" name="password" id="password" />
				                            </fieldset>
				                            <label class="remeber" for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
				                            <input type="submit" id="login" value="login" />
				                        </fieldset>
				                        <span><a href="#">Forgot your password?</a></span>
				                    </form>
				                </div>
				            <!-- Login Ends Here -->
						</li>
						<div class="clear"> </div>
					</ul>
				</div>
				<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
			</div>
			</div>
			<!---//End-header---->
<div>
	<section id="sub_section"  class="payPC_wrap">

    <section class="content_inner pb0">
    <div class="myheadPC_wrap">
        <div class="myheadPC_back">
            <img src="https://az792517.vo.msecnd.net/img/myHeadPc_pt.jpg">
        </div>        
        <div class="myheadPC_content">
            <div class="mP_nm">
                <span class="mP_name">${dto.member_name}</span>
                <span class="mP_mail">${dto.member_email}</span>
            </div>
            <div class="mP_btn">
                <span class="mP_btn_gray"><a href="/process/pay">이용권구매</a></span>
                <span class="mP_btn_gray"><a href="/auth/modify">정보수정</a></span>
                <span class="mP_btn_gray"><a href="/auth/LogOut">로그아웃</a></span>
            </div>
        </div>  
        <div class="myheadPC_myCoin">
            <img src="https://az792517.vo.msecnd.net/img/myheadPC_coinBack.png">
            <ul>
                <li class="mP_coin">${dto.member_coin}</li>
                <li class="mP_ctxt">COIN</li>
            </ul>
        </div>
    </div>
</section>

    
        <div class="pws_tabs_container">
        <div class="pws_tabs_container pws_tabs_horizontal pws_tabs_horizontal_top pws_tabs_noeffect pws_none">
        	<ul class="pws_tabs_controll">
        	<li><a data-tab-id="tab2" class="">할인 정액권</a></li>
        	<li><a data-tab-id="tab1" class="pws_tab_active">일반권</a></li></ul>
            <div class="tabset0 pws_tabs_list">
                <div data-pws-tab="tab2" data-pws-tab-name="할인 정액권" class="pws_hide" data-pws-tab-id="1" style="overflow: hidden;">
                    <article class="buy_pass_pc">
                        <div class="pay_exp"><span>정기 결제 이용권</span></div>
                        <div class="passList_pc pc_voucher">                            
                            <ul>
                                
                                    <li>
                                        <a data-goods='{"goodsIndex":"1000032","goodsPrice":"99,000"}' id="pay_num1" class>
                                            <dl class="p5Box p-renew">
                                                <dt class="paypc-dt">다양한 운동을 실용적으로</dt>
                                                <dd class="paypc-d1"><span>30일</span></dd>
                                                <dd class="paypc-d2"><img src="https://az792517.vo.msecnd.net/img/icon_coin_02.png" /></dd>
                                                <dd class="paypc-d3">100 COIN</dd>
                                                <dd class="paypc-d4"><span>+ 15 coin</span></dd>
                                                <dd class="paypc-d5"><span>99,000 원</span></dd>
                                            </dl>
                                        </a>
                                    </li>
                                                                    <li>
                                        <a data-goods='{"goodsIndex":"1000033","goodsPrice":"199,000"}' id="pay_num2" class>
                                            <dl class="p5Box p-renew">
                                                <dt class="paypc-dt">운동이 취미인 분들은</dt>
                                                <dd class="paypc-d1"><span>30일</span></dd>
                                                <dd class="paypc-d2"><img src="https://az792517.vo.msecnd.net/img/icon_coin_03.png" /></dd>
                                                <dd class="paypc-d3">200 COIN</dd>
                                                <dd class="paypc-d4"><span>+ 40 coin</span></dd>
                                                <dd class="paypc-d5"><span>199,000 원</span></dd>
                                            </dl>
                                        </a>
                                    </li>
                                                                    <li>
                                        <a data-goods='{"goodsIndex":"1000034","goodsPrice":"299,000"}' id="pay_num3" class>
                                            <dl class="p5Box p-renew">
                                                <dt class="paypc-dt">운동 매니아들을 위한</dt>
                                                <dd class="paypc-d1"><span>30일</span></dd>
                                                <dd class="paypc-d2"><img src="https://az792517.vo.msecnd.net/img/icon_coin_04.png" /></dd>
                                                <dd class="paypc-d3">300 COIN</dd>
                                                <dd class="paypc-d4"><span>+ 80 coin</span></dd>
                                                <dd class="paypc-d5"><span>299,000 원</span></dd>
                                            </dl>
                                        </a>
                                    </li>
                            </ul>
                        </div>
                        
                    </article> 
                </div>               
                <div data-pws-tab="tab1" id="tab2" data-pws-tab-name="일반권" class="pws_hide pws_show" data-pws-tab-id="2" style="overflow: hidden;">
                    <article class="buy_pass_pc">
                        <div class="pay_exp"><span>일반 이용권 / 유효기간 30일</span></div>
                        <div class="passList_pc">                            
                            <ul>
                                
                                    <li>
                                        <a data-goods='{"goodsIndex":"1000029","goodsPrice":"30,000"}' id="pay_num4" class>
                                            <dl class="p5Box p-renew">
                                                <dt class="paypc-dt">운동 체험을 위한 이용권</dt>
                                                <dd class="paypc-d1"><span>30일</span></dd>
                                                <dd class="paypc-d2"><img src="https://az792517.vo.msecnd.net/img/icon_coin_01.png" /></dd>
                                                <dd class="paypc-d3">30 COIN</dd>
                                                <dd class="paypc-d4"><span>+ 2 coin</span></dd>
                                                <dd class="paypc-d5"><span>30,000 원</span></dd>
                                            </dl>
                                        </a>
                                    </li>
                                                                    <li>
                                        <a data-goods='{"goodsIndex":"1000030","goodsPrice":"99,000"}' id="pay_num5" class>
                                            <dl class="p5Box p-renew">
                                                <dt class="paypc-dt">다양한 운동을 실용적으로</dt>
                                                <dd class="paypc-d1"><span>30일</span><span class="pay-hot">HOT</span></dd>
                                                <dd class="paypc-d2"><img src="https://az792517.vo.msecnd.net/img/icon_coin_02.png" /></dd>
                                                <dd class="paypc-d3">100 COIN</dd>
                                                <dd class="paypc-d4"><span>+ 10 coin</span></dd>
                                                <dd class="paypc-d5"><span>99,000 원</span></dd>
                                            </dl>
                                        </a>
                                    </li>
                                                                    <li>
                                        <a data-goods='{"goodsIndex":"1000031","goodsPrice":"299,000"}' id="pay_num6" class>
                                            <dl class="p5Box p-renew">
                                                <dt class="paypc-dt">운동 매니아들을 위한</dt>
                                                <dd class="paypc-d1"><span>30일</span></dd>
                                                <dd class="paypc-d2"><img src="https://az792517.vo.msecnd.net/img/icon_coin_04.png" /></dd>
                                                <dd class="paypc-d3">300 COIN</dd>
                                                <dd class="paypc-d4"><span>+ 50 coin</span></dd>
                                                <dd class="paypc-d5"><span>299,000 원</span></dd>
                                            </dl>
                                        </a>
                                    </li>
                           </ul>
                        </div>                         
                    </article>      
                    </div>              
                </div>                               
            </div><!-- tabset0 -->
        </div>
        <form name="getCoin" action="getCoin.do" method="post">
        <ul class="regul_agree_con" id="regul_agree_con" style="height: 230px;">
            <li>
                <div class="pc_g_join" id="pc_g_join">
                    <p id="agreeTitle" style="display: none;">이용 동의</p>
                    <input type="hidden" name="coin" value="${buy_coin}">
                    <div id="regul_agree_check" style="display: none;">
                        <label class="join_info">
                            <input type="checkbox" id="regularAgreement" style="display: none;">
                        </label>
                        <strong>할인 정액권 3개월간 자동 결제 취소 불가 동의</strong>
                    </div>
                    <p class="regul_agree_txt" id="regul_agree_txt"></p>
                </div>
            </li>
            <li>
                <div class="pay_card_pc">
                    <div class="p_cart_pc" id="payinfo">
                    </div>
                    <div class="pay_pass_pc">
                        <div class="pass_card">
                            <input type="radio" title="신용카드" id="CARD" name="payment" value="card" checked="checked"><label for="CARD">신용카드</label>
                            <div id="VBANK_cont" style="display: inline-block;"><input type="radio" title="가상계좌" id="VBANK" name="payment" value="vbank"><label for="VBANK">가상계좌</label></div>
                        </div>
                        <div class="buy_pass_btn" id="buy_pass_btn" style="position: relative;z-index: 1;display: block;">
                            <a class="f_navFocus_pc" id="navFocus" style="width: 130px;">
                                <span id="navFocus_text">결제하기</span>
                            </a>
                        </div>
                        <div class="buy_monthly_pass_btn" id="buy_monthly_pass_btn" style="position: relative;z-index: 2;left: 183px;display: none;">
                            <a class="f_navFocus_pc" id="navFocus" style="width: 130px;">
                                <span id="navFocus_text">결제하기</span>
                            </a>
                        </div>      
                    </div>
                </div><input type="submit" value="결제">
            </li>
        </ul>
        </form>
</section>
			<!---start-bottom-footer-grids---->
				<div class="footer-grids">
					<div class="wrap">
						<div class="footer-grid">
							<h3>Quick Links</h3>
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#">About Features</a></li>
								<li><a href="#">Login</a></li>
								<li><a href="#">Sign Up</a></li>
							</ul>
						</div>
						<div class="footer-grid">
							<h3>More</h3>
							<ul>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Terms and Conditions</a></li>
							</ul>
						</div>
						<div class="footer-grid">
							<h3>Connect With Us</h3>
							<ul class="social-icons">
								<li><a class="facebook" href="#"> </a></li>
								<li><a class="twitter" href="#"> </a></li>
								<li><a class="youtube" href="#"> </a></li>
							</ul>
							<p class="copy-right">Template by <a href="#">W3layouts</a></p>
						</div>
						<div class="footer-grid">
							<h3>Newsletter</h3>
							<p>Subscribe to our newsletter to keep up-to-date with all the latest news.</p>
							<form>
								<input type="text" class="text" value="Your Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Name';}">
								<input type="text" class="text" value="Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Email';}">
								<input type="submit" value="subscribe" />
							</form>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<!---//End-bottom-footer-grids---->
			</div>
			<!----//End-content--->
		<!---//End-wrap---->
	</body>
</body>
</html>