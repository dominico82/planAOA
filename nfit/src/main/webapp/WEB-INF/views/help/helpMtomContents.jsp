<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

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

<link href="resources/css/tlx.bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<style>
textarea{
width: 100%; 
border:0;overflow-y:hidden;background:clear;
}
</style>
<script>
$(document).ready(function(){
	$("#qCon").focus();
});

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (20+obj.scrollHeight)+"px";

  $("#qCon").blur();
}
$(document).ready(function(){
	$("#aCon").focus();
});

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (20+obj.scrollHeight)+"px";

}
</script>
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
 <!-- Main content -->
       <main class="main">
<div class="wrap">

    <div  style="width: 650px;" class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header mtomViewHeader">
          <h2>
          	1:1문의 게시판 답변
          </h2>
        </div>
		<c:set var="content" value="${dto}"></c:set>
        <form name="helpReplyWrite" action="helpMtomReplyWrite.do" method="post">
        <div class="noticeWrap">
          <article class="notice">
          	
          	<div class="form-group">          	
          		<label>제목</label>
          		<input type="text" name="qa_subject" size="60" class="form-control" readonly="readonly" required="required" value="${content.qa_subject}">
          	</div>
			<div class="form-group">
				<label>내용</label>
				<textarea onfocus="resize(this)" id="qCon" cols="60" rows="20" name="qa_content" class="form-control" readonly="readonly" required="required">${content.qa_content}</textarea>				
			</div>

			<div class="form-group">
				<label>답변</label>
				<textarea onkeyup="resize(this)" onfocus="resize(this)" id="aCon" cols="60" rows="20" name="qa_answer" class="form-control" required="required"><c:if test="${content.qa_checked=='y'}">${content.qa_answer}</c:if></textarea>				
			</div>
          </article>

          


          <div class="articleTail">
            <a style="display: inline-block;" href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 목록으로 돌아가기</a>
            <span style="display: inline-block; float: right;" class="contentsUpdate"><input type="submit" class="btn btn-default" value="답변작성/수정"></span>
            
           	<c:url var="helpMtomDel" value="helpMtomDel.do">
				<c:param name="idx">${content.qa_idx}</c:param>
			</c:url>
          	<a style="display: inline-block; float: right;" href="${helpMtomDel}" class="btn btn-default">삭제</a><br>
          
          </div>
        </div><!-- /.noticeWrap -->
        <input type="hidden" id="qa_idx" name="qa_idx" value="${content.qa_idx}">
		</form>





      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>
</main>
</div>
	<footer class="app-footer">
       <jsp:include page="../footer.jsp"/>
    </footer>
    
    



    <!-- GenesisUI main scripts -->
</body>
</html>