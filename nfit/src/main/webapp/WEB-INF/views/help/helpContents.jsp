<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/bbs.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/help.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link href="resources/css/tlx.bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
textarea{
width: 100%; 
border:0;overflow-y:hidden;background:clear;
}
</style>
<script>
$(document).ready(function(){
	$("#help_con").focus();
});

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (20+obj.scrollHeight)+"px";

  $("#help_con").blur();
}

</script>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"/>
	</header>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
      <br><br><br>
        <div class="page-header">
          <h2>고객센터 <small>도움이 필요하신가요?</small></h2>
        </div>



        <div class="helpCenterWrap">
          <div class="row">

            <div class="col-md-12">
              <ol class="breadcrumb">
              	<c:if test="${empty helpContents}">
              		<div>잘못된 경로로 접속하셨습니다!</div>
              	</c:if>
              	<c:set var="contents" value="${helpContents}"></c:set>
                <li><a href="help.do">고객센터</a></li>
                <li class="active">${contents.faq_subject}</li>
              </ol>

              <article class="helpArticle">
                <h4>
                <c:if test="${contents.faq_category=='센터이용/오류'}">
               		<strong class="phType phType_1">${contents.faq_category}</strong>
               	</c:if>
               	<c:if test="${contents.faq_category=='결제/환불'}">
               		<strong class="phType phType_2">${contents.faq_category}</strong>
               	</c:if>
               	<c:if test="${contents.faq_category=='코인'}">
               		<strong class="phType phType_3">${contents.faq_category}</strong>
               	</c:if>
               	<c:if test="${contents.faq_category=='회원정보'}">
               		<strong class="phType phType_4">${contents.faq_category}</strong>
               	</c:if>
                <span>${contents.faq_subject} </span></h4>
                <div class="answer">
                  <textarea onfocus="resize(this)" id="help_con" cols="80">${contents.faq_content}</textarea> 
                </div>
              </article>
              
              


              <div class="orCantFindHelp">
                궁금한 점에 대한 도움말을 찾을 수 없으신가요? 1:1문의로 문의해주세요.
                <a href="/mypage/query/" class="btn btn-default"> 1:1 문의하기</a>
              </div>

              <div class="fastLink">
                <div class="row">
                  
                </div>
              </div><!-- /.fastLink -->

            </div><!-- /.col -->
				<div></div>
          </div>


        </div><!-- /.helpCenterWrap -->

      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>

<%@include file="../footer.jsp" %>
</body>
</html>