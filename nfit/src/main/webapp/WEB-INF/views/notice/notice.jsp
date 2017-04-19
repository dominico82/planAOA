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
<%@include file="../header.jsp" %>

<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>


</head>
<body>

<br><br><br>
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
          	<c:if test="${empty list}">
          		<div>등록된 게시글이 없습니다.</div>
          	</c:if>
          	<c:forEach var="dto" items="${list}">
          		<c:url var="cotentUrl" value="noticeContents.do">
          			<c:param name="idx">${dto.notice_idx}</c:param>
          		</c:url>
				<a class="list-group-item" href="noticeContents.do?idx=${dto.notice_idx}">
					<c:if test="${dto.notice_top!='1'}">
						<span class="label label-default">${dto.notice_idx}</span>   
					</c:if>
					<c:if test="${dto.notice_top=='1'}">
						<span class="label label-info">공지</span> 
					</c:if>
					<c:if test="${dto.notice_top=='1'&&dto.notice_event=='1'}">
						<span class="label label-primary">이벤트</span>  
					</c:if>
					<c:if test="${dto.notice_top!='1'&&dto.notice_event=='1'}">
						<span class="label label-default">이벤트</span>  
					</c:if>            
					<h4 class="list-group-ietm-heading">${dto.notice_subject}</h4>
					<span class="date">
						<fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd"/>
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
	<div ><input type= "button" value= "작성하기 " style= "margin-left: 440px;"/></div>

  

</div> <!-- /.wrap -->
<div class="spinnerWrap" id="spinner" style="display:none;">
    <div class="loader">Loading...</div>
</div>

<script src="/js/bootstrap.min.js"></script>
<script src="/js/wow.min.js"></script>

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