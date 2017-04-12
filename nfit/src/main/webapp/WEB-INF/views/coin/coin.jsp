<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<!DOCTYPE html>
<html>
	<head>
		<title>만족스러운 피트니스 Nfit</title>
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
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript" src="resources/js/pwstabs.js"></script>
<script type="text/javascript" src="resources/js/coin.js"></script>
<script>
var userId="${dto.member_id}";
var userName="${dto.member_name}";
var userEmail="${dto.member_email}";
var userTel="${dto.member_tel}";
var userAddr="${dto.member_addr}";
</script>
	</head>
	<body>
	<%@include file="../header.jsp" %>
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
<div>
	<section id="sub_section"  class="payPC_wrap">

    <section class="content_inner pb0">
    <div class="myheadPC_wrap">
        <div class="myheadPC_back">
            <img src="resources/images/myHeadPc_pt.jpg">
        </div>        
        <div class="myheadPC_content">
            <div class="mP_nm">
                <span class="mP_name">${dto.member_name}</span>
                <span class="mP_mail">${dto.member_email}</span>
            </div>
            <div class="mP_btn">
            </div>
        </div>  
        <div class="myheadPC_myCoin">
            <img src="resources/images/myheadPC_coinBack.png">
            <ul>
                <li class="mP_coin" id="mP_coin">${dto.member_coin}</li>
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
                                                <dd class="paypc-d2"><img src="resources/images/icon_coin_02.png" /></dd>
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
                                                <dd class="paypc-d2"><img src="resources/images/icon_coin_03.png" /></dd>
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
                                                <dd class="paypc-d2"><img src="resources/images/icon_coin_04.png" /></dd>
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
                                                <dd class="paypc-d2"><img src="resources/images/icon_coin_01.png" /></dd>
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
                                                <dd class="paypc-d2"><img src="resources/images/icon_coin_02.png" /></dd>
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
                                                <dd class="paypc-d2"><img src="resources/images/icon_coin_04.png" /></dd>
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
        <form id="getCoin" name="getCoin" action="getCoin.do" method="post">
        <ul class="regul_agree_con" id="regul_agree_con" style="height: 230px;">
            <li>
                <div class="pc_g_join" id="pc_g_join">
                    <p id="agreeTitle" style="display: none;">이용 동의</p>
                    <input type="hidden" id="coin" name="coin" value="">
                    <input type="hidden" id="userId" name="userId" value="">
                    <input type="hidden" id="userCoin" name="userCoin" value="${dto.member_coin}">
                    <input type="hidden" id="member_idx" name="member_idx" value="${dto.member_idx}">
                    <input type="hidden" id="pay_method" name="pay_method" value="">
                    <input type="hidden" id="pay_coin" name="pay_coin" value="">
                    <input type="hidden" id="pay_price" name="pay_price" value="">
                    <input type="hidden" id="pay_class" name="pay_class" value="">
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
                </div>
            </li>
        </ul>
        </form>
</section>
			<%@include file="../footer.jsp" %>
			<!----//End-content--->
		<!---//End-wrap---->
	</body>
</body>
</html>