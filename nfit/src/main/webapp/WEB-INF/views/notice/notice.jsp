<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="wrap">

    <div class="wrap">


  <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header">
          <h2>
            공지사항
            <small>이벤트와 새로운 알림을 확인하세요!</small>
          </h2>
        </div>
        <div class="noticeWrap">
          <div class="list-group">
            <a class="list-group-item" href="/notice/view/129948/">
              <span class="label label-info">공지</span> <span class="label label-primary">이벤트</span>              <h4 class="list-group-ietm-heading">4월 단 하루, 깜짝 이벤트!</h4>
              <span class="date">2017-04-06</span>
            </a>
            <a class="list-group-item" href="/notice/view/129947/">
              <span class="label label-info">공지</span> <span class="label label-primary">이벤트</span>              <h4 class="list-group-ietm-heading">최고의 시설, 강남 스포월드와 판교 스포짐을 1PASS로 이용하세요!</h4>
              <span class="date">2017-04-05</span>
            </a>
            <a class="list-group-item" href="/notice/view/129914/">
              <span class="label label-info">공지</span> <span class="label label-primary">이벤트</span>              <h4 class="list-group-ietm-heading">하나멤버스 가입 시  할인쿠폰 100% 증정(~4/30)</h4>
              <span class="date">2016-11-15</span>
            </a>
            <a class="list-group-item" href="/notice/view/129845/">
              <span class="label label-info">공지</span>               <h4 class="list-group-ietm-heading">공지사항 운영방법 변경안내</h4>
              <span class="date">2016-03-29</span>
            </a>
            <a class="list-group-item" href="/notice/view/129795/">
              <span class="label label-info">공지</span>               <h4 class="list-group-ietm-heading">TLX PASS 멤버십 카드 변경안내</h4>
              <span class="date">2016-03-03</span>
            </a>
            <a class="list-group-item" href="/notice/view/129946/">
              <span class="label label-default">56</span> <span class="label label-default">이벤트</span>              <h5 class="list-group-ietm-heading">핫바디 챌린지 체험단 발표 및 미션 참여안내</h5>
              <span class="date">2017-03-02</span>
            </a>
            <a class="list-group-item" href="/notice/view/129945/">
              <span class="label label-default">55</span> <span class="label label-default">이벤트</span>              <h5 class="list-group-ietm-heading">♨도전! 핫바디 챌린지♨ 179,000원의 인바디밴드를 득템하세요!</h5>
              <span class="date">2017-02-20</span>
            </a>
          </div><!-- /.list-group -->

          <nav>
            <ul class="pagination">
              <li class="active"><a href="/notice/thread/1">1</a></li>
              <li><a href="/notice/thread/2">2</a></li>
              <li><a href="/notice/thread/3">3</a></li>
              <li><a href="/notice/thread/4">4</a></li>
              <li><a href="/notice/thread/5">5</a></li>
              <li><a href="/notice/thread/6" aria-label="Next"><span aria-hidden="true">»</span></a></li>
            </ul>
          </nav>
        </div><!-- /.noticeWrap -->



      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->


</div> <!-- /.wrap -->
<div class="spinnerWrap" id="spinner" style="display:none;">
    <div class="loader">Loading...</div>
</div>

<script src="/js/bootstrap.min.js"></script>
<script src="/js/wow.min.js"></script>
<!--[if gt IE 8]><!-->
<script>
    new WOW().init();
</script>
<!--<![endif]-->
<script src="/js/lightgallery-all.min.js"></script>
<script src="/js/jquery.bgswitcher.js"></script>

<!-- IE8 / no SVG support browser -->
<script src="/js/svgeezy.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
<script src="/js/daterangepicker.js"></script>
<script src="/js/waypoints.min.js"></script>
<script src="/js/jquery.counterup.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<script src="/js/sweetalert.min.js"></script>
<!--
<script src="/js/chromeSmoothScroll.min.js"></script>
-->
<script src="/js/tlx_front.js?v=20160812"></script>


</div>
<%@include file="../footer.jsp" %>
</body>
</html>