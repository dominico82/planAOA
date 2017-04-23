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
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<br><br><br>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header mtomViewHeader">
          <h2>
          	1:1문의 게시판 답변
          </h2>
        </div>
		<c:set var="content" value="${dto}"></c:set>
        <form name="helpReplyWrite" action="helpMtomReplyWrite.do" method="post">
        <div class="noticeWrap">
          <article class="notice">
          	
          	<div class="form-group">          	
          		<label>제목</label>
          		<input type="text" name="qa_subject" size="60" class="form-control" readonly="readonly" required="required" value="${content.qa_subject}">
          	</div>
			<div class="form-group">
				<label>내용</label>
				<textarea cols="60" rows="20" name="qa_content" class="form-control" readonly="readonly" required="required">${content.qa_content}</textarea>				
			</div>

			<div class="form-group">
				<label>답변</label>
				<textarea cols="60" rows="20" name="qa_answer" class="form-control" required="required"><c:if test="${content.qa_checked=='y'}">${content.qa_answer}</c:if></textarea>				
			</div>
          </article>

          


          <div class="articleTail">
            <a style="display: inline-block;" href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 목록으로 돌아가기</a>
            <span style="display: inline-block; float: right;" class="contentsUpdate"><input type="submit" class="btn btn-default" value="답변작성/수정"></span>
            
           	<c:url var="helpMtomDel" value="helpMtomDel.do">
				<c:param name="idx">${content.qa_idx}</c:param>
			</c:url>
          	<a style="display: inline-block; float: right;" href="${helpMtomDel}" class="btn btn-default">삭제</a><br>
          
          </div>
        </div><!-- /.noticeWrap -->
        <input type="hidden" id="qa_idx" name="qa_idx" value="${content.qa_idx}">
		</form>





      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>
<%@include file="../footer.jsp" %>
</body>
</html>