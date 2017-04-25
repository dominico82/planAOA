<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body>
<c:set var="list" value="${list}" />
<table>
<c:forEach var="vo" items="${list}">
<tr>
	<td>${vo.co_name}</td>
</tr>
</c:forEach>
</table>
</body>
</html>