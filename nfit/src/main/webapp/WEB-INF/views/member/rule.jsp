<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
		function checkForm(){
			var form=document.forms.check;
			var i=0;
			var sel="";
			
			for(i = 0; i < form.length; i++) { 
				if(form[i].type == "checkbox"){ 
					if(form[i].checked == true) { 
						sel++; 
					} 
				} 
			} 

			if(!sel) { 
				alert("약관에 반드시 동의하셔야합니다."); 
				return false; 
			} 
			
		}
		</script>
<link type="text/css" rel="stylesheet" href="resources/css/rule.css" />
</head>
<body class="body_has_c_gnb">
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<div class="wrap" style="margin: 0px auto; width: 750px;">

		<div class="container" style="margin-top: 120px; margin-bottom: 10px;">
			<div class="row">
				<div class="content col-md-12" style="margin-bottom: -10px;">
					<div class="page-header">
						<h2>이용약관</h2>
					</div>

					<div class="docWrap">
						<article class="doc">
							<!-- <p class="text-right">시행일자 2016.4.1  <a href="/contents/terms_old_20160315" class="btn btn-sm btn-link">이전 약관보기</a> </p> -->
							<p class="text-right">시행일자 : 2017년 04월 26일</p>
							<div class="well well-sm">Nfit에서 제공하는 Nfit 멤버십은 각 센터의 이용과
								관련하여 아래와 같은 규정에 의거 운영됩니다. 이용약관은 Nfit가 제공하는 Nfit의 이용과 관련하여 당사와
								회원과의 권리, 의무 및 책임 사항, 기타 필요한 사항을 규정함을 목적으로 하므로 동의하셔야 가입 후 이용하실 수
								있습니다.</div>
							​
							<h4>회원 정보 변경</h4>
							<div class="sen1">
								<ul class="set1">
									<li>회원 정보 변경 사항 발생 시 (정보, 연락처, 전자메일, 주소 등) 홈페이지에서 직접 정보 변경
										신청해 주십시오.</li>
									<li>회원 정보 변경 및 미 신청으로 인해 발생하는 모든 손해에 대해서는 Nfit에서 배상하지
										않습니다.</li>
								</ul>
							</div>

							<h4>제휴 센터 이용</h4>
							<div class="sen1">
								<ul class="set1">
									<li>“이용 시작일”이란, 신청일 기준으로 이용 시작 가능한 일자이며, 선택하신 날짜와 상품에 따라
										이용 시작 일자가 상이합니다.</li>
									<li>제휴 센터 이용 시 센터 별 차감 되는 패스가 상이합니다.</li>
									<li>각 센터 별 차감 되는 패스는 조정 또는 변경 될 수 있습니다.</li>
									<li>회원이라 하더라도 멤버십 미인증 시 또는 이용 대금 정산 등의 문제가 발생 시 제휴 센터에 입장이
										불가능합니다.</li>
									<li>회원 카드는 본인 외에 타인에게 양도 혹은 대여 불가 하며, 어떠한 경우에도 제휴 센터에 보관하여
										이용할 수 없습니다. 이와 같은 사례로 인해 발생한 금 전적 손실 및 부당하게 사용한 요금에 대해서 회원 본인이
										배상하여야 합니다.</li>
									<li>회원이 제휴 센터를 이용함에 있어 발생한 부상 등에 대해서는 별도의 보상이 어려우니 제휴 센터
										이용 시 각별히 유의하시기 바랍니다.</li>
								</ul>
							</div>

							<h4>제휴 센터 이용 기준</h4>
							<div class="sen1">
								<ul class="set1">
									<li>제휴 센터 이용은 1일, 1회, 1종목에 한해 이용 가능합니다.</li>
									<li>ONE-PLACE Membership 선택하신 경우, 지정된 센터만 이용 가능합니다.</li>
									<li>Nfit 에서 제공되는 프로그램 외에 각 제휴 센터에서 운영하는 추가 프로그램 이용 시 발생하는
										요금에 대해서는 회원님이 직접 해당 센터에 부담해 주십시오.</li>
									<li>회원이 선택한 제휴 센터의 이용 및 제반 규정은 각 센터 이용 기준 및 규정에 따릅니다.</li>
									<li>Nfit 에서 게시한 기준에 의거 제휴 센터는 이용할 수 있으나 각 제휴 센터의 내부 사정에 따라
										센터의 이용 여부가 일부 조정 또는 변경될 수 있습니다.</li>
								</ul>
							</div>

							<h4>결제</h4>
							<div class="sen1">
								<ul class="set1">
									<li>Nfit 의 결제 방식은 신용카드 정기 결제, CMS 자동이체, 카드 결제, 무통장 입금이 있으며
										선택하신 상품에 따라 이용 가능한 결제 방법이 상이합니다.</li>
									<li>상품 신청 시 회원이 선택 가능한 결제 방법은 Nfit와 제휴한 기업 및 상품에 따라 상이 할 수
										있습니다.</li>
									<li>결제 방법 및 결제 계좌 변경 등 결제 관련 변경은 홈페이지&gt;마이페이지 내 혹은 1:1문의를
										통해 가능합니다.</li>
									<li>Long-term PASS를 이용 중인 회원은 멤버십의 유효기간 만료 또는 제공 PASS 소진 시
										재 결제 및 멤버십 변경이 가능합니다.</li>
									<li>유효기간 만료 전 잔여 PASS (5PASS 이하)에 따라 멤버십 재 결제가 가능하며, 유효기간
										만료 후 재 결제 하지 않으면 자동으로 멤버십이 종료됩니다.</li>
									<li>매월 지정일 (휴일인 경우 전 영업일)에 다음 달 요금이 선 결제됩니다.</li>
									<li>즉시 신청을 원하시는 경우 당월 요금을 무통장 입금해 주십시오.</li>
									<li>추가 이용 요금의 경우, 전월 이용 실적에 따라 매월 지정일(익월 7일)혹은 이용기간 종료
										5일후에 추가 결제 됩니다.</li>
									<li>결제 일에 결제 되지 않을 경우, 며칠 간격으로 재 결제 됩니다.</li>
									<li>최종 결제가 안되면 자동으로 멤버십이 해지 됩니다.</li>
								</ul>
								<h5>CMS 자동이체 회원</h5>
								<ul class="set1">
									<li>멤버십 신청과 관련하여 금융거래정보(거래은행, 계좌번호, 예금주명)를 출금이체 신규신청 하는
										때로부터 해지 신청 할 때까지 Nfit에 제공하는 것에 대하여 [금융실명거래 및 비밀보장에 관한 긴급재정경제
										명령]의 규정에 따라 동의해 주십시오.</li>
									<li>잔고 부족, 계좌 오류, 해약 계좌 등의 사유로 최종 출금이 안되면 자동으로 멤버십 정지 됩니다.</li>
									<li>현금 영수증 발행 시 결제 확인 후 수일 이내 국세청으로 전달, 발행합니다.</li>
								</ul>
							</div>


							<h4>환불</h4>
							<div class="sen1">
								<ul class="set1">
									<li>Nfit는 저렴한 선 결제 방식으로 제공되므로 이용 시작 후 전액 환불이 불가능합니다.</li>
									<li>단, 이용 시작 전, 회원이 납부완료한 이용료 환불을 요청하는 경우, 한국 소비자원의
										소비자분쟁해결 기준 및 공정거래위원회의 표준약관에 의거하여, 아래 규정에 따라 진행됩니다.</li>
								</ul>
							</div>

							<div class="sen2">
								<table class="table table-bordered">
									<caption style="display: none">환불규정 표</caption>
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">내용</th>
										</tr>
										<tr>
											<td>이용시작 전</td>
											<td>
												<ul>
													<li>- 결제 일로부터 7일 이내 결제 취소 요청 시 전액 환불</li>
													<li>- 단 CMS 결제 회원의 경우, 매월 20일 이후 결제 취소 요청 시 취소 수수료 10%
														공제 후 환불 됩니다.</li>
													<li>- 결제 일로부터 7일 경과된 경우에는 결제액에서 위약금 (결제 상품의10%) 공제 후
														환불 됩니다.</li>
													<li>- 이용 기간이 만료된 상품의 경우 환불이 불가 합니다.</li>
													<li>- 할인특가상품의 경우 할인가격이 아닌 정상가격을 기준으로 공제한 후 환불됩니다.</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>이용시작 후</td>
											<td>
												<ul>
													<li>- 현재 상품을 이용 하고 다음 달부터 해지하는 경우 : 다음 달부터 정기 결제 취소</li>
													<li>- 즉시 해지를 원하는 경우 에는 결제 금액에서 위약금 (결제 상품의10%)과 사용한
														PASS의 정상가를 계산하여 환불 됩니다.<br>
													</li>
													<li>- ONE-PLACE Membership 이용 시, 이번 달 환불 불가 합니다</li>
													<li>- 할인특가상품의 경우 할인가격이 아닌 정상가격을 기준으로 공제한 후 환불됩니다.</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>예외사항</td>
											<td>
												<ul>
													<li>- 이용하시는 제휴센터가 내부시설공사 등 센터 사정으로 인한 이용에 차질이 생길 경우,
														인근 제휴 시설을 이용하실 수 있습니다. 인근 제휴시설이 없거나 부득이한 사정으로 이용이 불가한 경우,
														담당자 확인 후 10일/월 이상 휴장에 한하여 사용한 PASS 만큼 이용료 계산 후 환급해드립니다.</li>
													<li>- 제휴 시설의 정기 휴무, 휴가 등 센터 사정에 따른 10일/월 미만의 미사용 기간은
														환불이 되지 않습니다.</li>
													<li>- 해외 출장 및 질병, 부상에 의한 10일 이상 이용하지 못할 시, 환불은 해당 내용에
														관한 서류를 팩스(0505-357-3578)로 전송해주시면 확인 후 위약금 공제하지 않고 환불
														가능합니다.</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="sen1">
								<ul class="set1">
									<li>결제 수단 별 상세 환불 절차는 아래와 같습니다</li>
								</ul>
							</div>

							<div class="sen2">
								<table class="table table-bordered">
									<caption style="display: none">결제 수단별 상세 환불 절차</caption>
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">CMS 자동 이체, 무통장 입금</th>
											<td scope="col">환불 규정에 따라 공제 후 계좌 환불</td>
										</tr>
										<tr>
											<th>카드 결제</th>
											<td>환불 규정에 따라 공제 금액 입금 받은 후 주문 내역 전체 취소</td>
										</tr>
									</tbody>
								</table>
							</div>


							<h4>멤버십 상품 변경</h4>
							<div class="sen1">
								<ul class="set1">
									<li>Nfit 멤버십 상품 변경은 홈페이지에서 직접 신청해 주십시오. 홈페이지&gt; 마이페이지 내에서
										접수 가능 합니다.</li>
									<li>정기 결제 이용자
										<ul>
											<li>신용카드로 정기 결제
												<ul>
													<li>변경된 상품은 결제 청구 이후 이용 시작 일부터 적용됩니다.</li>
													<li>회원님의 정기 결제일 이후에 신청하신 경우에는 다 다음 달 이용 시작 일부터 적용됩니다.</li>
												</ul>
											</li>
											<li>계좌이체(CMS)로 결제
												<ul>
													<li>변경된 상품은 다음 달 1일부터 적용됩니다.</li>
													<li>매월 20일 이후 신청하신 경우에는 다 다음 달 1일부터 적용됩니다.</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>1회 결제 상품, ONE-PLACE Membership 이용자
										<ul>
											<li>유효기간이 만료되거나, PASS 모두 소진 하였다면 상품 변경 가능합니다.</li>
											<li>잔여 PASS가 있는데 상품 변경 신청을 할 경우에는 환불 절차 후에 변경 가능합니다.</li>
										</ul>
									</li>
								</ul>
							</div>

							<h4>멤버십 정지</h4>
							<div class="sen1">
								<ul class="set1">
									<li>멤버십 정지는 Monthly PASS 상품에 한해 가능하며, 홈페이지 &gt; 마이페이지에서 직접
										신청 접수 가능 합니다.</li>
									<li>정기 결제 이용자는 다음 결제부터 자동 출금이 중지되어 결제되지 않습니다.</li>
									<li>멤버십 정지 기간은 최대 3개월 까지며 정지 신청과 함께 재이용 시작일이 지정되어 자동 재개
										합니다.</li>
									<li>신용카드로 정기 결제
										<ul>
											<li>회원님의 정기 결제일 전까지 설정 시. 다음 달 적용됩니다.</li>
											<li>회원님의 정기 결제일 이후에 정지하신 경우에는 다 다음 달 이용 시작 일부터 적용됩니다.</li>
										</ul>
									</li>
									<li>계좌이체(CMS)로 결제
										<ul>
											<li>매월 20일 까지 정지 신청하신 경우 다음 달 1일부터 적용됩니다.</li>
											<li>매월 20일 이후 정지 신청하신 경우에는 다 다음 달 1일부터 적용됩니다.</li>
										</ul>
									</li>
									<li>롱텀(기간제)상품을 이용하는 회원 님께서는 이용 시작일이 지난 후에는 정지 접수가 불가능 하므로
										신청 시 유의하여 주시기 바랍니다.</li>
								</ul>
							</div>

							<h4>멤버십 해지</h4>
							<div class="sen1">
								<ul class="set1">
									<li>해지 신청 시 잔여 패스가 남아 있는 경우 정해진 유효기간 내 잔여 패스를 사용 할 수 있습니다.
									</li>
									<li>해지 신청 시 추가 정산 금액 등 미납된 이용 요금에 대한 모든 결제가 완료, 확인 된 이후에
										멤버십 해지가 됩니다.</li>
								</ul>
							</div>

							<h4>회원탈퇴</h4>
							<div class="sen1">
								<ul class="set1">
									<li>Nfit 의 회원 탈퇴는 마이페이지 &gt; 회원정보 &gt; 회원탈퇴 에서 직접 접수해
										주십시오.</li>
									<li>탈퇴 후 모든 정보는 삭제되며 복구 되지 않습니다.</li>
									<li>재가입 시 5천 원의 가입비가 발생합니다.</li>
									<li>회원 탈퇴 시 잔여 패스가 있더라도 사용이 불가능 합니다.</li>
									<li>회원 탈퇴 시 추가 이용 요금 결제가 있는 경우 결제 완료 후 탈퇴 가능합니다.</li>
									<li>단, 본인의 의지와 상관없이 이용 약관 위반 등으로 탈퇴 된 경우 재 등록이 제한될 수 있습니다.</li>
								</ul>
							</div>

							<h4>회원 자격 상실</h4>
							<div class="sen1">
								<p>
									<strong>※ 아래 사항에 해당될 경우, 회원 자격 박탈 및 이용 신청이 영구 제한되며, 제휴
										기업의 가족 회원의 경우, 임직원의 이용까지 제한되므로 주의 바랍니다.</strong>
								</p>
								<ul class="set1">
									<li>멤버십 카드를 타인에게 대여 혹은 양도하는 등 부정행위가 적발될 경우</li>
									<li>멤버십 카드를 제휴 센터에 보관하여 사용할 경우</li>
									<li>제휴 센터 이용 중 도덕적으로 불미스러운 행위를 했을 경우</li>
								</ul>
							</div>

							<h4>약관의 명시와 개정</h4>
							<div class="sen1">
								<p>본 약관을 개정하는 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 서비스 초기화면에 그
									적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하거나 약관의 중요한 내용을 개정하는
									경우에는 이용자의 합리적 판단 및 확인 가능한 시간을 고려하여 최소 30일 이상의 유예기간을 두고 공지합니다. 이
									경우 개정 전 내용과 개정 후 내용을 비교하여 이용자가 알기 쉽도록 표시합니다.</p>
								<ul class="set1">
									<li>시행일자 : 2017년 04월 26일</li>
								</ul>

							</div>
						</article>
					</div>
					<!-- /.docWrap -->


					​
				</div>
				<!-- /.content -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /container -->

		<div style="margin: 0px auto" align="center">
			<form name="check" action="memberJoin.do"
				style="margin-bottom: 50px;" onsubmit="return checkForm();">
				<input type="checkbox" name="agree" value="1">모든 약관 내용을
				이해했으며 이에 동의합니다.&nbsp;&nbsp;<input type="submit" value="동의">
			</form>
		</div>

	</div>
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>