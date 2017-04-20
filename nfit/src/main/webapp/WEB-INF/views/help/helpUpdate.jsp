<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header.jsp" %>
<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-filestyle.min.js"></script>

</head>
<body>
<br><br><br>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header noticeViewHeader">
          <h2>
          	고객센터 글수정
          </h2>
        </div>
		<c:set var="content" value="${contents}"></c:set>
        <form name="helpUpdate" action="helpUpdate.do" method="post" accept-charset="utf-8">
        <div class="noticeWrap">
          <article class="notice">
          	<div class="form-group">
          		<label>카테고리</label>
          		<select name="faq_category">
          			<option value="센터이용/오류">센터이용/오류</option>
          			<option value="결제/환불">결제/환불</option>
          			<option value="코인">코인</option>
          			<option value="회원정보">회원정보</option>
          		</select>
          	</div>
          	<div class="form-group">
          		<label>태그</label>
          		<input type="text" name="faq_tag" size="10" value="${content.faq_tag}">
          	</div>
          	<div class="form-group">          	
          		<label>제목</label>
          		<input type="text" name="faq_subject" size="60" class="form-control" required="required" value="${content.faq_subject}">
          		<input type="hidden" name="faq_idx" value="${content.faq_idx}">
          	</div>
			<div class="form-group">
				<label>내용</label>
				<textarea cols="60" rows="20" name="faq_content" class="form-control" required="required">${content.faq_content}</textarea>				
			</div>

			
          </article>

          


          <div class="articleTail">
            <a href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 이전으로 돌아가기</a>
            <span class="contentsWrite"><input type="submit" class="btn btn-default" value="수정"></span>
          </div>
        </div><!-- /.noticeWrap -->
		</form>





      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>
<%@include file="../footer.jsp" %>
</body>
</html>