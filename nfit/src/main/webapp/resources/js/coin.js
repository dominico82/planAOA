/**
 * 
 */
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var pay="";
var price="0";
var buy_coin="";
var pay_class="";

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
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").removeClass("on");
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
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").removeClass("on");
						$("#pay_num6").removeClass("on");
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
						pay_class="정기/100코인";
		
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
						pay_class="정기/200코인";
						
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
						pay_class="정기/300코인";
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
						pay_class="일반/30코인";
	});
	$("#pay_num5").click(
			function(){
						$("#pay_num1").removeClass("on");
						$("#pay_num2").removeClass("on");
						$("#pay_num3").removeClass("on");
						$("#pay_num4").removeClass("on");
						$("#pay_num5").addClass("on");
						$("#pay_num6").removeClass("on");
						price="990";
						buy_coin="100";
						pay_class="일반/100코인";
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
						pay_class="일반/300코인";
	});
});


//일반결제 모듈
$(function(){
	$(".buy_pass_btn").click(
			function(){
				if(document.getElementById('CARD').value=="card"){
					pay="card";	
				}else if(document.getElementById('VBANK').value=="vbank"){
					pay="vbank";
				}
				document.getElementById("userId").value=userId;
				document.getElementById("coin").value=buy_coin;
				document.getElementById("pay_method").value=pay;
				document.getElementById("pay_coin").value=buy_coin;
				document.getElementById("pay_price").value=price;
				console.log("결제할 가격:"+price);
				document.getElementById("pay_class").value=pay_class;
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

			    			$(function(){
					    		var formData=$("#getCoin").serialize();
						    	
						    	$.ajax({
						    		type:"POST",
						    		url: "getCoin.do",
						    		data: formData,
						    		success: function(data){
						    			console.log(data.member_id);
						    			console.log(price);
						    			$(".mP_coin").empty();
						    			$(".mP_coin").append(data.member_coin);
						    		},
						    		error: function(data){
						    			alert("실패!!");
						    		}
						    	});	
					    	});

					    } else {
//					        var msg = '결제에 실패하였습니다.';
//					        msg += '에러내용 : ' + rsp.error_msg;
//					        
//					        $('#getCoin').submit();
					    	//ajax 페이지갱신
					    	$(function(){
					    		var formData=$("#getCoin").serialize();
						    	
						    	$.ajax({
						    		type:"POST",
						    		url: "getCoin.do",
						    		data: formData,
						    		success: function(data){
						    			console.log(data.member_id);
						    			$(".mP_coin").empty();
						    			$(".mP_coin").append(data.member_coin);
						    		},
						    		error: function(data){
						    			alert("실패!!");
						    		}
						    	});	
					    	});
					    }
					});
				}else if(price=="0"){
					window.alert('상품을 선택해 주세요!');
				}
			});
});

function coinRefresh(){
	var formData=$("#getCoin").serialize();
	
	$.ajax({
		type:"POST",
		url: "getCoin.do",
		data: formData,
		success: function(data){
			console.log(data.member_id);
			$(".mP_coin").empty();
		},
		error: function(data){
			alert("실패!!");
		}
	});	
}
//정기 결제 모듈

$(function(){
		$(".buy_monthly_pass_btn").click(
				function(){
					document.getElementById("userId").value=userId;
					document.getElementById("coin").value=buy_coin;
					document.getElementById("pay_method").value='card';
					document.getElementById("pay_coin").value=buy_coin;
					document.getElementById("pay_price").value=price;
					document.getElementById("pay_class").value=pay_class;
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
			
							    $(function(){
						    		var formData=$("#getCoin").serialize();
							    	
							    	$.ajax({
							    		type:"POST",
							    		url: "getCoin.do",
							    		data: formData,
							    		success: function(data){
							    			console.log(data.member_id);
							    			$(".mP_coin").empty();
							    			$(".mP_coin").append(data.member_coin);
							    		},
							    		error: function(data){
							    			alert("실패!!");
							    		}
							    	});	
						    	});
							});
						}else if(price=="0"){
							window.alert('상품을 선택해 주세요!');
						}
					}else if($('input:checkbox[id="regularAgreement"]').is(":checked")==false){
						window.alert('할인 정액권 3개월간 자동 결제 취소 불가 동의를 해주세요!');
					}
		});
	
});