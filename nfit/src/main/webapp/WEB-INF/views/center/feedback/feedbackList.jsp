<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>
<c:set var="flist" value="${flist}"/>
<!-- 세션에저장된아이디 -->
<c:set var="saveid" value="${sessionScope.saveid}"/>
<!-- 세션에저장된 이름 -->
<c:set var="member_name" value="${sessionScope.member_name}"/>
<div class="w3-container">
댓글<span  class="w3-badge w3-green">${count}</span>건
</div><br>
<table style="width:700px;">
	<c:if test="${empty flist}">
		<tr>
			<td></td>
		</tr>
	</c:if>
	<c:forEach var="row" items="${flist}">
	<tr>
		<td>${row.member_id}(
		<fmt:formatDate value="${row.feedback_date}" pattern="yyyy-MM-dd HH:mm:ss"/>)
		<c:choose>
			<c:when test="${row.feedback_score eq 1}">
				<img src="resources/images/img/star1.png" alt="star" width="20">
			</c:when>
			<c:when test="${row.feedback_score eq 2}">
				<img src="resources/images/img/star2.png" alt="star" width="100">
			</c:when>
			<c:when test="${row.feedback_score eq 3}">
				<img src="resources/images/img/star3.png" alt="star" width="100">
			</c:when>
			<c:when test="${row.feedback_score eq 4}">
				<img src="resources/images/img/star4.png" alt="star" width="100">
			</c:when>
			<c:when test="${row.feedback_score eq 5}">
				<img src="resources/images/img/star5.png" alt="star" width="100">
			</c:when>
			<c:otherwise>
				<p>별점 오류</p>
			</c:otherwise>
		</c:choose>
		<br>
		${row.feedback_content}
			<!-- 댓글 수정버튼 --> <!-- 세션아이디와 디비아이디비교후 버튼 활성화제한 예정-->
			<c:if test="${saveid eq row.member_id}"> 
				<input type="button" value="Modify" onclick="showModify(${row.feedback_index})" class="button">
			</c:if> 
		<hr>
		</td>
	</tr>
	</c:forEach>
</table>
<div>
</div>
</body>
</html>