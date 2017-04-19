<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업로드 결과 페이지</title>
<style type="text/css">
	.failed {
		color: red;
		font-style: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${imageFile != null }">
		파일 업로드 완료
		<ul>
			<li>파일 ID : ${imageFile.id }</li>
			<li>저장된 파일 이름 : ${imageFile.fileName }</li>
			<li>파일 길이 : ${imageFile.contentLength }</li>
			<li>MIME 타입 : ${imageFile.contentType }</li>
		</ul>
		
		<img src="${pageContext.request.contextPath}/image/${imageFile.id}">
		</c:when>
		<c:otherwise>
		<span class="failed">파일 업로드 실패</span>		
		</c:otherwise>
	</c:choose>
</body>
</html>