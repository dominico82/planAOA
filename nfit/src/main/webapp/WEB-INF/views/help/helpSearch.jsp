<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족스러운 피트니스 Nfit</title>

<link href="resources/css/bbs.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/help.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link href="resources/css/tlx.bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>

	<header>
		<jsp:include page="../header.jsp"/>
	</header>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header">
        <br><br><br>
          <h2>고객센터 <small>도움이 필요하신가요?</small></h2>
        </div>



        <div class="helpCenterWrap">
          <div class="row">

            <div class="col-md-12">

              <ol class="breadcrumb">
                <li><a href="help.do">고객센터</a></li>
                <li class="active">검색결과</li>
              </ol>

              <div class="searchFormBox">
                <form action="helpSearch.do">
                <div class="input-group input-group-lg">
                  <input type="text" class="form-control" placeholder="어떤 도움이 필요하세요?" name="keyword" value="${searchText}">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                  </span>
                </div><!-- /input-group -->
                </form>
              </div><!-- /.searchFormBox -->


              <div class="searchedHelpList">
                <ul>
                  <!-- 여기부터 검색결과 -->
                  <c:if test="${empty searchList}">
                  	<div>등록된 게시글이 없습니다.</div>
                  </c:if>
                  <c:forEach var="list" items="${searchList}">
                  	<li>
                  	<c:if test="${list.faq_category=='센터이용/오류'}">
                  		<strong class="phType phType_1">${list.faq_category}</strong>
                  	</c:if>
                  	<c:if test="${list.faq_category=='결제/환불'}">
                  		<strong class="phType phType_2">${list.faq_category}</strong>
                  	</c:if>
                  	<c:if test="${list.faq_category=='코인'}">
                  		<strong class="phType phType_3">${list.faq_category}</strong>
                  	</c:if>
                  	<c:if test="${list.faq_category=='회원정보'}">
                  		<strong class="phType phType_4">${list.faq_category}</strong>
                  	</c:if>
	                  	<c:url var="helpContents" value="helpContents.do">
							<c:param name="idx">${list.faq_idx}</c:param>
						</c:url>
	                  	<a href="${helpContents}">${list.faq_subject}</a>
                  	</li>
                  </c:forEach>

                  <!-- 여기까지 검색결과 -->
                </ul>
                <nav>
                    <ul class="pagination pagination-sm">
                        <li>${pageStr}</li>
                    </ul>
                </nav>
              </div>

          

            </div><!-- /.col -->


          </div>

        </div><!-- /.helpCenterWrap -->


      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->



</div>
<%@include file="../footer.jsp" %>
</body>
</html>