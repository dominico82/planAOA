<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--
 * CoreUI - Open Source Bootstrap Admin Template
 * @version v1.0.0-alpha.4
 * @link http://coreui.io
 * Copyright (c) 2017 creativeLabs Łukasz Holeczek
 * @license MIT
 -->
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="CoreUI - Open Source Bootstrap Admin Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,Angular 2,Angular4,Angular 4,jQuery,CSS,HTML,RWD,Dashboard,React,React.js,Vue,Vue.js">
<link rel="shortcut icon" href="resources/img/favicon.png">

<title>CoreUI - Open Source Bootstrap Admin Template</title>

<!-- Icons -->


<!-- Main styles for this application -->
<link href="resources/css/adminstyle.css" rel="stylesheet">
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/fav-icon.png" />

<!---start-login-script--->
<script src="resources/js/login.js"></script>
<!---//End-login-script--->
<!-----768px-menu----->
<link type="text/css" rel="stylesheet"
	href="resources/css/jquery.mmenu.all.css" />
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/simple-line-icons.css" rel="stylesheet">
<link href="resources/css/table.css" rel="stylesheet">
</head>

<!-- BODY options, add following classes to body to change options

// Header options
1. '.header-fixed'					- Fixed Header

// Sidebar options
1. '.sidebar-fixed'					- Fixed Sidebar
2. '.sidebar-hidden'				- Hidden Sidebar
3. '.sidebar-off-canvas'		- Off Canvas Sidebar
4. '.sidebar-compact'				- Compact Sidebar Navigation (Only icons)

// Aside options
1. '.aside-menu-fixed'			- Fixed Aside Menu
2. '.aside-menu-hidden'			- Hidden Aside Menu
3. '.aside-menu-off-canvas'	- Off Canvas Aside Menu

// Footer options
1. '.footer-fixed'						- Fixed footer

-->

<body
	class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
	<header>
		<jsp:include page="../header.jsp" />
	</header>

	<div class="app-body">
		<div class="sidebar">
			<nav class="sidebar-nav">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="#"><i
							class="icon-speedometer"></i>Test<span class="badge badge-info">NEW</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="memberAdmin.do"><i
							class="icon-people"></i> 회원관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="co_list.do"><i class="icon-briefcase"></i>제휴업체
							등록/삭제</a></li>
					<li class="nav-item"><a class="nav-link" href="coinAdmin.do"><i
							class="icon-credit-card"></i>코인 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="helpMtomReply.do"><i class="icon-check"></i>문의 관리</a></li>
					<li class="nav-item"><a class="nav-link" href="noticeAdmin.do"><i
							class="icon-list"></i>공지사항 관리</a></li>
				</ul>
			</nav>
		</div>

		<!-- Main content -->
		<main class="main">
		<div class="title" style="margin-top: 15px; margin-left: 35px;">
			<img src="resources/img/favicon.png" style="height: 65px;"> 
			<a href="helpMtomReply.do" style="font-family:'Nanum Pen Script' serif;">1:1문의 답변</a>
		</div>
		<div class="container-fluid">
			<div id="ui-view">
				<table class="blueone">
					<thead>
						<tr>
							<th></th>
							<th>고객문의 내용</th>
							<th>답변상태</th>
							<th>문의 일시</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="dtot" value="${list}" />
						<c:if test="${empty list}">
							<tr>
								<td>등록된 1:1문의 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${dtot}">
							<tr>
								<td class="center"><c:url var="contentUrl"
										value="helpMtomContents.do">
										<c:param name="idx">${dto.qa_idx}</c:param>
									</c:url></td>
								<td class="center"><a href="${contentUrl}">
										${dto.qa_subject} </a></td>
								<td class="center"><c:if test="${dto.qa_checked=='n'}">
										<span>답변대기</span>
									</c:if> <c:if test="${dto.qa_checked=='y'}">
										<span>답변완료</span>
									</c:if> <span class="date"></span></td>
								<td class="center"><fmt:formatDate value="${dto.qa_date}"
										pattern="yyyy-MM-dd HH:mm" /></td>

							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
			<nav>
				<ul>
					<li class="bottom">${pageStr }</li>
				</ul>
			</nav>
		</div>
		<!-- /.noticeWrap --> <!-- /.conainer-fluid --> </main>


	</div>

	<footer class="app-footer">
		<jsp:include page="../footer.jsp" />
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
