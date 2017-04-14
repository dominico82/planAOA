<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%
	String saveid = "";
	Cookie cks[] = request.getCookies();
	if (cks != null) {
		for (int i = 0; i < cks.length; i++) {
			if (cks[i].getName().equals("saveid")) {
				saveid = cks[i].getValue();
			}
		}
	}
%>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="resources/images/n-1x-170x128.jpg" type="image/x-icon">
  <meta name="description" content="">
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
  <link rel="stylesheet" href="bootstrap-material-design-font/css/material.css">
  <link rel="stylesheet" href="resources/tether/tether.min.css">
  <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/dropdown/css/style.css">
  <link rel="stylesheet" href="resources/animate.css/animate.min.css">
  <link rel="stylesheet" href="resources/theme/css/style.css">
  <link rel="stylesheet" href="resources/mobirise/css/mbr-additional.css" type="text/css">
</head>

<body>
<section id="menu-0">
    <nav class="navbar navbar-dropdown bg-color navbar-fixed-top">
        <div class="container">
            <div class="mbr-table">
                <div class="mbr-table-cell">

                    <div class="navbar-brand">
                        <a href="index.do" class="navbar-logo"><img src="resources/images/n-1x-170x128.jpg" alt="Nfit"></a>
                        <a class="navbar-caption" href="index.do">Nfit</a>
                    </div>

                </div>
                <div class="mbr-table-cell">

                    <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>

                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">
                    <li class="nav-item"><a class="nav-link link" href="about.do">이용안내</a></li>
                    <li class="nav-item"><a class="nav-link link" href="index.do">주변센터찾기</a></li>
                    <li class="nav-item"><a class="nav-link link" href="help.do">고객센터</a></li>
                    <li class="nav-item"><a class="nav-link link" href="notice.do">공지사항</a></li>
                    <li class="nav-item"><a class="nav-link link" href="coin.do" aria-expanded="false">코인결제</a></li>
                    
                    <c:choose>
					<c:when test="${empty sessionScope.saveid }">
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="memberJoin.do">회원가입</a></li>
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="memberLogin.do">로그인</a></li>
                    </c:when>
					<c:when test="${sessionScope.saveid=='admin'}">
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="adminPage.do">관리자페이지</a></li>
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="logout.do">로그아웃</a></li>
                    </c:when>
                    <c:when test="${!empty sessionScope.saveid }">
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="myPage.do">마이페이지</a></li>
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="logout.do">로그아웃</a></li>
                    </c:when>
                    </c:choose>
                    
                    </ul>
                    
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                       <div class="close-icon"></div>
                    </button>

                </div>
            </div>

        </div>
    </nav>
</section>
</body>
</html>