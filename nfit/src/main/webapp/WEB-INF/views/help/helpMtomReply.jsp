<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,Angular 2,Angular4,Angular 4,jQuery,CSS,HTML,RWD,Dashboard,React,React.js,Vue,Vue.js">
    <link rel="shortcut icon" href="resources/img/favicon.png">

<title>Nfit 관리자 문의 답변</title>

<link href="resources/css/tlx.bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

</head>
<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
	<header>
		<jsp:include page="../header.jsp"/>
	</header>
	 <div class="app-body">
		<div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="icon-speedometer"></i>Test<span class="badge badge-info">NEW</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="memberAdmin.do"><i class="icon-people"></i> 회원관리</a>
                       
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="co_list.do"><i class="icon-briefcase"></i>제휴업체 등록/삭제</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="coinAdmin.do"><i class="icon-credit-card"></i>코인 관리</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link" href="helpMtomReply.do"><i class="icon-check"></i>문의 관리</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="noticeAdmin.do"><i class="icon-list"></i>공지사항 관리</a>
                    </li>
                </ul>
            </nav>
        </div>
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
</div>
	<footer>
		<jsp:include page="../footer.jsp"/>
	</footer>
	<!-- Bootstrap and necessary plugins -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bower_components/tether/dist/js/tether.min.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="bower_components/pace/pace.min.js"></script>



    <!-- GenesisUI main scripts -->

    <script src="resources/js/app.js"></script>
</body>
</html>