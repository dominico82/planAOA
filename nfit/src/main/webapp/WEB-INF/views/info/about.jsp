<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>이용안내</title>
<%@include file="../header.jsp" %>
<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/help.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
 <style>
 ul{
 text-decoration:none;
 padding:0
 
 }
 footer{
 background:#cdd2d5;
 border-bottom:1px solid #bcdec0;
 border-top: 1px solid #bcdec0;
 margin:0;
 padding:0;
 border:0;
 font-size:100%;
 letter-spacing:-1px;
 outline:0;
 font-family: 'NotoSansKR-Regular-Alphabetic';
 display:inline-block;
 
 }
 </style>

</head>
<body>

<br><br><br>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header">
          <h2>고객센터 <small>도움이 필요하신가요?</small></h2>
        </div>


        <div class="helpCenterWrap">
          <div class="row">

            <div class="col-md-9">

              <div class="searchFormBox">
                <form action="/help/search"><div class="input-group input-group-lg" style="line-height: 46px;">

                    <input type="text" class="form-control" placeholder="어떤 도움이 필요하세요?" name="keyword">
                    <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                  
                </div></form><!-- /input-group -->
                <p class="help-block">
                  <b>모바일 인증</b>, <b>멤버십 일시정지</b> 등 도움이 필요한 내용을 검색어로 검색하거나 아래 태그를 선택하세요.
                </p>
              </div><!-- /.searchFormBox -->


              <div class="helpTagsBoxWrap">
                <div class="row">

                  <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="panel panel-default phType_1">
                      <div class="panel-heading">
                        <h5 class="panel-title"><a href="/help/search?category=1">센터이용/오류</a></h5>
                      </div>
                      <div class="panel-body">
                        <a href="/help/search?tag=1" class="label-faq">센터이용</a>
                        <a href="/help/search?tag=3" class="label-faq">인증오류</a>
                        <a href="/help/search?tag=27" class="label-faq">센터입장</a>
                        <a href="/help/search?tag=30" class="label-faq">PASS변경</a>
                        <a href="/help/search?tag=23" class="label-faq">원플레이스멤버십</a>
                        <a href="/help/search?tag=29" class="label-faq">제휴문의</a>
                      </div>
                    </div><!-- /.panel -->
                  </div><!-- /.col -->
                  <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="panel panel-default phType_2">
                      <div class="panel-heading">
                        <h5 class="panel-title"><a href="/help/search?category=2">결제/환불</a></h5>
                      </div>
                      <div class="panel-body">
                        <a href="/help/search?tag=4" class="label-faq">결제</a>
                        <a href="/help/search?tag=5" class="label-faq">환불</a>
                        <a href="/help/search?tag=32" class="label-faq">결제방법변경</a>
                        <a href="/help/search?tag=37" class="label-faq">할인코드</a>
                        <a href="/help/search?tag=6" class="label-faq">현금영수증</a>
                        <a href="/help/search?tag=36" class="label-faq">가입비</a>
                        <a href="/help/search?tag=97" class="label-faq">상품권</a>
                      </div>
                    </div><!-- /.panel -->
                  </div><!-- /.col -->
                  <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="panel panel-default phType_3">
                      <div class="panel-heading">
                        <h5 class="panel-title"><a href="/help/search?category=3">멤버십</a></h5>
                      </div>
                      <div class="panel-body">
                        <a href="/help/search?tag=65" class="label-faq">해지</a>
                        <a href="/help/search?tag=64" class="label-faq">변경</a>
                        <a href="/help/search?tag=10" class="label-faq">일시정지</a>
                        <a href="/help/search?tag=12" class="label-faq">멤버십이용</a>
                        <a href="/help/search?tag=66" class="label-faq">재이용</a>
                        <a href="/help/search?tag=13" class="label-faq">카드발급</a>
                        <a href="/help/search?tag=53" class="label-faq">재가입</a>
                        <a href="/help/search?tag=8" class="label-faq">멤버십연장</a>
                        <a href="/help/search?tag=75" class="label-faq">추가이용</a>
                        <a href="/help/search?tag=99" class="label-faq">친구초대</a>
                      </div>
                    </div><!-- /.panel -->
                  </div><!-- /.col -->
                  <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="panel panel-default phType_4">
                      <div class="panel-heading">
                        <h5 class="panel-title"><a href="/help/search?category=4">회원정보</a></h5>
                      </div>
                      <div class="panel-body">
                        <a href="/help/search?tag=19" class="label-faq">가족회원</a>
                        <a href="/help/search?tag=52" class="label-faq">제휴임직원회원</a>
                        <a href="/help/search?tag=15" class="label-faq">이메일인증</a>
                        <a href="/help/search?tag=56" class="label-faq">비빌번호찾기</a>
                      </div>
                    </div><!-- /.panel -->
                  </div><!-- /.col -->

                </div>
              </div><!-- /.helpTagsBoxWrap -->
           	<div class="innerBox col-xs-6 col-sm-12">
                <h3>1:1 문의</h3>
                <p class="help-block">
                  <span>게시판에 문의사항을 남겨주시면 정확하게 답변해 드립니다.</span>
                </p>
                <a href="/mypage/query/" class="btn btn-default">
                  1:1 문의 남기기
                </a>
              </div>
              <div class="faqList">
                <h3>FAQ <small><span class="label label-info">TOP 5</span></small></h3>
                <ul>
                  <li><strong class="phType phType_3">멤버십</strong> <a href="/help/contents/40"> 멤버십을 일시 정지 하고 싶어요. </a></li>
                  <li><strong class="phType phType_3">멤버십</strong> <a href="/help/contents/42"> 멤버십을 해지 하고싶어요. </a></li>
                  <li><strong class="phType phType_2">결제/환불</strong> <a href="/help/contents/27"> 멤버십 결제 취소/환불 안내  </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/9"> 멤버십 신청 완료 했는데 센터 입장이 안됩니다. </a></li>
                  <li><strong class="phType phType_1">센터이용/오류</strong> <a href="/help/contents/13"> 이용하던 제휴센터의 차감 PASS가 변경되었어요. </a></li>
                </ul>
              </div>


           </div><!-- /.col -->
           
          </div>

        </div><!-- /.helpCenterWrap -->


      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->


</div>
    <footer>
                    <ul class="foot_menu">
                        <li><a ><span>회사소개</span></a></li>
                        <li><a href="/process/setting/terms"><span>이용약관</span></a></li>
                        <li><a href="/process/setting/info"><span>개인정보취급방침</span></a></li>
                        <li><a href="/Jaehu/JaehuQuestion"><span>제휴문의</span></a></li>
                        <li><a ><span>제휴파트너소개</span></a></li>
                    </ul>
                            <h4>픽플컴퍼니(주)</h4>
                            <ul class="pcf_list">
                                <li><span>대표이사:김영민</span><span>사업자등록번호:787-88-00065</span></li>
                                <li>통신판매업신고:제20165-서울서초-1445호</li>
                                <li>(05029) 서울시 광진구능동로 120 건국대학교 창의관</li>
                            </ul>
                            <h4>고객센터</h4>
                            <ul class="pcf_list">
                                <li>Tel : 02.446.0446</li>
                                <li>E-mail: help@classpick.co.kr</li>
                                <li>Kakao ID : 클래스픽</li>
                            </ul>
                            <ul class="sns_list01">
                                <li><a href="https://www.facebook.com/classpick1" target="_blank"><img src="https://az792517.vo.msecnd.net/img/pc_footer_facebook.png" alt="페이스북" width="35" height="35" /></a></li>
                                <li><a href="http://blog.naver.com/classpick" target="_blank"><img src="https://az792517.vo.msecnd.net/img/pc_footer_naver.png" alt="네이버블로그" width="35" height="35" /></a></li>
                                <li><a href="https://www.instagram.com/classpick_insta/" target="_blank"><img src="https://az792517.vo.msecnd.net/img/pc_footer_insta.png" alt="인스타그램" width="35" height="35" /></a></li>
                            </ul>
                            <ul class="sns_list02">
                                <li><a href="https://itunes.apple.com/kr/app/classpick-undong-daieoteu/id1105343241" target="_blank"><img src="https://az792517.vo.msecnd.net/img/pc_footer_app-store-logo.png" alt="클래스픽 앱스토어" width="120" height="42" /></a></li>
                                <li><a href="https://play.google.com/store/apps/details?id=com.pickple.classpick" target="_blank"><img src="https://az792517.vo.msecnd.net/img/pc_footer_google-play.png" alt="클래스픽 구글플레이" width="120" height="42" /></a></li>
                            </ul>
    </footer>

</body>
</html>