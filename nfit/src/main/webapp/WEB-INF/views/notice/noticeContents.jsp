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
        <div class="page-header noticeViewHeader">
          <h2>
			<c:if test="${dto.notice_event=='1' }">
			  <span class="label label-default">이벤트</span>	
			</c:if>
              ${dto.notice_subject}
          </h2>
        </div>

        <div class="noticeWrap">
          <article class="notice">
			<div>
				<c:if test="${!empty pics}">
					<c:forEach var="picList" items="${pics}">
						<img src="resources/file/upload/${picList}">
					</c:forEach>
				</c:if>
			</div>
			<div>			
				<p>${dto.notice_content}</p>
			</div>
          </article>

          


          <div class="articleTail">
            <a href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 목록으로 돌아가기</a>
          </div>
          
              
        </div><!-- /.noticeWrap -->






      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>
<%@include file="../footer.jsp" %>
</body>
</html>