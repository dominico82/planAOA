<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
 * CoreUI - Open Source Bootstrap Admin Template
 * @version v1.0.0-alpha.4
 * @link http://coreui.io
 * Copyright (c) 2017 creativeLabs Łukasz Holeczek
 * @license MIT
 -->
<!DOCTYPE html>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,Angular 2,Angular4,Angular 4,jQuery,CSS,HTML,RWD,Dashboard,React,React.js,Vue,Vue.js">
    <link rel="shortcut icon" href="resources/img/favicon.png">

    <title>CoreUI - Open Source Bootstrap Admin Template</title>

    <!-- Icons -->
 

    <!-- Main styles for this application -->
    <link href="resources/css/adminstyle.css" rel="stylesheet">
    <link href="resources/css/style.css" rel='stylesheet' type='text/css' />
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

        <!-- Main content -->
       <main class="main">
       <div class="title" style="margin-top: 15px; margin-left: 35px;">
			<img src="resources/img/favicon.png" style="height: 65px;"> 
			<a href="coinAdmin.do" style="font-family:'Nanum Pen Script' serif;">코인 사용현황</a>
		</div>
            <div class="container-fluid">
			<div id="ui-view">
				<table class="blueone">
					<thead>
						<tr>
							<th class="num" style="width:10%;">순번</th>
							<th class="num" style="width:10%;">사용자 ID</th>
							<th class="sub" style="width:10%;">이용센터 번호</th>
							<th class="content">이용센터 이름</th>
							<th class="not" style="width:10%;">사용 코인</th>
							<th class="mak"style="width:20%;">사용일</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="ulist" value="${uselist}" />
						<c:if test="${empty uselist }">
							<tr>
								<td colspan="10" align="center">사용정보가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="coin" items="${ulist }">
							<tr>
								<td class="center">${coin.paid_idx }</td>
								<td class="center">${coin.member_id }</td>
								<td class="center">${coin.co_idx }</td>
								<td class="center">${coin.co_name }</td>
								<td class="center">${coin.usemember_coin }</td>
								<td class="center">${coin.use_date }</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
			<div>
				<ul>
					<li class="bottom">${pageStr }</li>
				</ul>

			</div>
		</div>
        </main>


    </div>

    <footer class="app-footer">
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
