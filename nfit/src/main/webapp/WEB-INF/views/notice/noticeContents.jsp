<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/tlx.bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
textarea{
width: 100%; 
border:0;overflow-y:hidden;background:clear;
}
</style>
<script>
$(document).ready(function(){
	$("#notice_con").focus();
});

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (20+obj.scrollHeight)+"px";

  $("#notice_con").blur();
}

</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>
<br><br><br>

<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header noticeViewHeader">
          <h2>
			<c:if test="${dto.notice_event=='1' }">
			  <span class="label label-default">이벤트</span>	
			</c:if>
              ${dto.notice_subject}
          </h2>
        </div>

        <div class="noticeWrap" id="noticeWrap">
          <article class="notice">
			<div>
				<c:if test="${!empty pics}">
					<c:forEach var="picList" items="${pics}">
						<img src="resources/file/upload/${picList}">
					</c:forEach>
				</c:if>
			</div>
				<c:if test="${!(dto.notice_content==null||dto.notice_content==' ')}">								
					<div><textarea id="notice_con" readonly="readonly" onfocus="resize(this)">${dto.notice_content}</textarea></div>
				</c:if>	
          </article>

           


          <div class="articleTail">
            <a href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 목록으로 돌아가기</a>
          </div>
          
              
        </div><!-- /.noticeWrap -->






      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>
<%@include file="../footer.jsp" %>
</body>
</html>