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
<c:set var="list" value="${list}"/>
<span>${co_idx}번째게시물:총${count}개 댓글이 달려있습니다.</span> 
<table style="width:700px;">
	<c:if test="${empty list}">
		<tr>
			<td>표시될 내용이없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.member_id}(
		<fmt:formatDate value="${row.feedback_date}" pattern="yyyy-MM-dd HH:mm:ss"/>)
		<br>
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
			<input type="button" value="Modify" onclick="showModify(${row.feedback_index})">
		</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>