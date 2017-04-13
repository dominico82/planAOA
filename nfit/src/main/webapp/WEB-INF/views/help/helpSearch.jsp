<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족스러운 피트니스 Nfit</title>

<%@include file="../header.jsp" %>
<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/help.css" rel="stylesheet" type="text/css">
</head>
<body>
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


</div>
<%@include file="../footer.jsp" %>
</body>
</html>