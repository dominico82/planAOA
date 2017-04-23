<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

</head>
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>
<br><br><br>
<div class="wrap">
    <div class="wrap">
	  <div class="container">
    	<div class="row">
    	  <div class="content col-md-12">
       		 <div class="page-header">
          <h2>
            1:1게시판 관리자
            <small>이벤트와 새로운 알림을 확인하세요!</small>
          </h2>
        </div>
        
        <div class="mtomWrap">
          <div class="list-group">
          	<c:if test="${empty list}">
          		<div>등록된 1:1문의 글이 없습니다.</div>
          	</c:if>
          	<c:forEach var="dto" items="${list}">
          		<c:url var="contentUrl" value="helpMtomContents.do">
          			<c:param name="idx">${dto.qa_idx}</c:param>
          		</c:url>
				<a style="display: inline-block;" class="list-group-item" href="${contentUrl}">
					
					<h4 style="display: inline-block;" class="list-group-ietm-heading">${dto.qa_subject}</h4>
					<c:if test="${dto.qa_checked=='n'}">
						<span style="display: inline-block; float: right;" class="btn btn-sm btn-default btnAnswer">답변대기</span>
					</c:if>
					<c:if test="${dto.qa_checked=='y'}">
						<span style="display: inline-block; float: right;" class="btn btn-sm btn-default btnAnswer">답변완료</span>
					</c:if>
					<span style="display: inline-block; float: right;" class="date">
						<fmt:formatDate value="${dto.qa_date}" pattern="yyyy-MM-dd HH:mm"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
					
				</a>
          	</c:forEach>
              
          </div><!-- /.list-group -->
          <nav>
            <ul class="pagination">
            	<li>${pageStr}</li>
            </ul>
          </nav>
          
          
 	      
        </div><!-- /.noticeWrap -->



      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->
  

	<br/>
	<div id= "paging" style= "margin-left: 190px;"></div>
	<br/>
	

  
</div>
</div>
	<footer>
		<jsp:include page="../footer.jsp"/>
	</footer>
</body>
</html>