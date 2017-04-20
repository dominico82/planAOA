<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/bbs.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/help.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
</head>
<body>

	<header>
		<jsp:include page="../header.jsp"/>
	</header>

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
                <form action="helpSearch.do"><div class="input-group input-group-lg" style="line-height: 46px;">

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
                <c:if test="${empty helpList}">
                	<div>등록된 게시글이 없습니다.</div>
                </c:if>
                <div class="col-sm-6 col-md-6 col-lg-3">
					<div class="panel panel-default phType_1">
						<div class="panel-heading">
							<c:url var="category1" value="helpSearch.do">
								<c:param name="category">센터이용/오류</c:param>
							</c:url>
							<h5 class="panel-title"><a href="${category1}">센터이용/오류</a></h5>
						</div>
						<div class="panel-body">	
							<c:forEach var="tag" items="${helpList}">
								<c:if test="${tag.faq_category=='센터이용/오류'}">
									<c:url var="tag1" value="helpSearch.do">
										<c:param name="tag">${tag.faq_tag}</c:param>
									</c:url>
									<a href="${tag1}" class="label-faq">${tag.faq_tag}</a>
								</c:if>
							</c:forEach>
						</div>								
					</div>							
				</div>
                <div class="col-sm-6 col-md-6 col-lg-3">
					<div class="panel panel-default phType_2">
						<div class="panel-heading">
							<c:url var="category2" value="helpSearch.do">
								<c:param name="category">결제/환불</c:param>
							</c:url>
							<h5 class="panel-title"><a href="${category2}">결제/환불</a></h5>
						</div>
						<div class="panel-body">	
							<c:forEach var="tag" items="${helpList}">
								<c:if test="${tag.faq_category=='결제/환불'}">
									<c:url var="tag2" value="helpSearch.do">
										<c:param name="tag">${tag.faq_tag}</c:param>
									</c:url>
									<a href="${tag2}" class="label-faq">${tag.faq_tag}</a>
								</c:if>
							</c:forEach>
						</div>								
					</div>							
				</div>
             	<div class="col-sm-6 col-md-6 col-lg-3">
					<div class="panel panel-default phType_3">
						<div class="panel-heading">
							<c:url var="category3" value="helpSearch.do">
								<c:param name="category">코인</c:param>
							</c:url>
							<h5 class="panel-title"><a href="${category3}">코인</a></h5>
						</div>
						<div class="panel-body">	
							<c:forEach var="tag" items="${helpList}">
								<c:if test="${tag.faq_category=='코인'}">
									<c:url var="tag3" value="helpSearch.do">
										<c:param name="tag">${tag.faq_tag}</c:param>
									</c:url>
									<a href="${tag3}" class="label-faq">${tag.faq_tag}</a>
								</c:if>
							</c:forEach>
						</div>								
					</div>							
				</div>
                <div class="col-sm-6 col-md-6 col-lg-3">
					<div class="panel panel-default phType_4">
						<div class="panel-heading">
							<c:url var="category4" value="helpSearch.do">
								<c:param name="category">회원정보</c:param>
							</c:url>
							<h5 class="panel-title"><a href="${category4}">회원정보</a></h5>
						</div>
						<div class="panel-body">	
							<c:forEach var="tag" items="${helpList}">
								<c:if test="${tag.faq_category=='회원정보'}">
									<c:url var="tag4" value="helpSearch.do">
										<c:param name="tag">${tag.faq_tag}</c:param>
									</c:url>
									<a href="${tag4}" class="label-faq">${tag.faq_tag}</a>
								</c:if>
							</c:forEach>
						</div>								
					</div>							
				</div>
                
                
                  

                </div>
              </div><!-- /.helpTagsBoxWrap -->
              
              <div>
              	<a href="helpWrite.do" class="btn btn-default">작성</a><br>
              </div>
              
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
<jsp:include page="../footer.jsp"/>
</body>
</html>