<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body>
<%@include file="../header.jsp" %>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header">
          <h2>고객센터 <small>도움이 필요하신가요?</small></h2>
        </div>



        <div class="helpCenterWrap">
          <div class="row">

            <div class="col-md-12">

              <ol class="breadcrumb">
                <li><a href="/help">고객센터</a></li>
                <li class="active">검색결과</li>
              </ol>

              <div class="searchFormBox">
                <form action="/help/search">
                <div class="input-group input-group-lg">
                  <input type="text" class="form-control" placeholder="어떤 도움이 필요하세요?" name="keyword" value="센터이용/오류">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                  </span>
                </div><!-- /input-group -->
                </form>
              </div><!-- /.searchFormBox -->


              <div class="searchedHelpList">
                <ul>
                  <!-- 여기부터 검색결과 -->
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/1"> TLX PASS란?  </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/2"> 멤버십 상품과 관계없이 제휴 센터 모두 이용가능하나요? </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/3"> ONE PLACE 멤버십 센터란 무엇인가요?  </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/4"> 유료부가서비스,유료프로그램은 무엇인가요? </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/5"> 고객센터 연결이 안돼요. </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/6"> 미성년자 이용이 가능한가요? </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/7"> 센터입장하기에서 인증 오류가 납니다. </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/8"> SMS인증 방식은 무엇인가요?  </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/9"> 멤버십 신청 완료 했는데 센터 입장이 안됩니다. </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/10"> 이용 시 유의사항은 무엇인가요? </a></li>
                  <!-- 여기까지 검색결과 -->
                </ul>
                <nav>
                    <ul class="pagination pagination-sm">
                        <li class=" active">
                            <a href="/help/search/1/?category=1">1</a>
                        </li>
                        <li class="">
                            <a href="/help/search/2/?category=1">2</a>
                        </li>
                    </ul>
                </nav>
              </div>

              <div class="fastLink">
                <div class="row">
                  <div class="col-sm-12">
                    <h3>빠른링크</h3>
                    <a href="/member/reset_pw/" class="btn btn-link">비밀번호 찾기</a>
                    <a href="/member/find_id/" class="btn btn-link">아이디 찾기</a>
                  </div>
                </div>
              </div><!-- /.fastLink -->

            </div><!-- /.col -->


          </div>

        </div><!-- /.helpCenterWrap -->


      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

<script>
  if ($('.fastLink a').size() == 0) {
      $('.fastLink').remove();
  }
</script>

    <footer class="footer">
        <div class="inner">
            <div class="row">
                <div class="col-sm-5">
                    <a href="/" class="logo"><img src="/images/tlx_pass_logo_text_alt.svg"></a>
                    <p class="copyrights">
                        © 2008 ~ 2017 TLX PASS.
                    </p>
                    <div class="companyInfo">
                        <p>
                            (주)티엘엑스 <small>|</small> 대표이사 : 김혁, 강영준 <small>|</small> 경기 성남시 분당구 성남대로 331번길8 1402호(정자동,킨스타워)<br>
                            사업자등록번호 129-86-21810 <small>|</small>  통신판매업신고 : 제2008-경기성남-1061호   <a href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2008378019330200570&amp;area1=&amp;area2=&amp;currpage=1&amp;searchKey=04&amp;searchVal=1298621810&amp;stdate=&amp;enddate=" target="blank">사업자정보확인</a><br>
                            <span>고객센터 <i class="fa fa-phone"></i> 1644-3578</span>
                        </p>
                        <p class="mailList">
                            <span><i class="fa fa-envelope"></i> 사업/서비스 제휴 문의  <a href="mailto:contact@tlx.co.kr">contact@tlx.co.kr</a></span>
                            <span><i class="fa fa-envelope"></i> 기타 문의 <a href="mailto:help@tlx.co.kr">help@tlx.co.kr</a></span>
                            <span><a class="btn_applyPartner" href="/help/partner"><i class="fa fa-handshake-o"></i> 센터 제휴 문의</a></span>
                        </p>
                    </div>
                    <ul class="util">
                        <li><a href="/contents/terms/">이용약관</a></li>
                        <li><a href="/contents/privacy/">개인정보취급방침</a></li>
                        <li><a href="/notice/thread/">공지사항</a></li>
                        <li><a href="/help/">고객센터</a></li>
                        <!-- <li><a href="/contents/b2b" target="_blank">TLX BIZ 임직원 건강관리 솔루션</a></li> -->
                    </ul>
                </div>
                <div class="col-sm-3">
                    <div class="customerCenter">
                        <h5>고객센터</h5>
                        <a href="javascript:void($zopim.livechat.window.openPopout());" class="goChat"><i class="fa fa-comments-o"></i> 실시간 채팅상담</a>
                        <span>로그인 후 이용하시면 더 빠르게 상담 받을 수 있습니다 <strong><a href="/member/login/">로그인하기</a></strong></span>
                        <span>운영시간 평일 09:30 ~ 17:30</span>
                        <span>이외의 시간은 로그인 후 <a href="/mypage/query/">1:1문의</a>를 이용해주세요.</span>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="mobileApp">
                        <h5>모바일 앱</h5>
                        <a href="http://tlx.co.kr/contents/app" class="go"><i class="fa fa-mobile"></i>모바일 앱</a>
                        <span>스마트폰에서 TLX PASS 를 보다 편리하게 이용하실 수 있습니다. 아이폰 안드로이드 모두 이용하실 수 있습니다.</span>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="tlxBiz">
                        <h5>기업/단체 우대 서비스 제휴 문의</h5>
                        <a href="/contents/b2b" class="aq go" target="_blank">TLX BIZ</a>
                        <span>법인 계약 할인/혜택 프로그램입니다.</span>
                    </div>
                </div>

            </div>
        </div>
    </footer>

</div>
<%@include file="../footer.jsp" %>
</body>
</html>