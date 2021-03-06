<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="CoreUI - Open Source Bootstrap list Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,list,Template,Open,Source,AngularJS,Angular,Angular2,Angular 2,Angular4,Angular 4,jQuery,CSS,HTML,RWD,Dashboard,React,React.js,Vue,Vue.js">
<link rel="shortcut icon" href="resources/img/favicon.png">

<title>Nfit 공지사항 수정</title>

<link href="resources/css/tlx.bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-filestyle.min.js"></script>
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
}
</script>
<script>
//Check for the various File API support.
if (window.File && window.FileReader && window.FileList && window.Blob) {
  // Great success! All the File APIs are supported.
} else {
  alert('The File APIs are not fully supported in this browser.');
}
$(function(){
	$("#check_top").click(
			function(){
				if($('input:checkbox[id="check_top"]').is(":checked")==true){
					$('#notice_top').val('1');
				}else if($('input:checkbox[id="check_top"]').is(":checked")==false){
					$('#notice_top').val('0');
				}
			});
});

$(function(){
	$("#check_event").click(
			function(){
				if($('input:checkbox[id="check_event"]').is(":checked")==true){
					$('#notice_event').val('1');
				}else if($('input:checkbox[id="check_event"]').is(":checked")==false){
					$('#notice_event').val('0');
				}
			});
});

$(":file").filestyle({input: false});
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
<div class="wrap">

    <div class="container" style="margin-top:100px; width: 650px;">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header noticeViewHeader">
          <h2>
          	공지사항 글수정
          </h2>
        </div>
		<c:set var="content" value="${contents}"></c:set>
        <form name="noticeContentUpdate" action="noticeUpdate.do" method="post" enctype="multipart/form-data">
        <div class="noticeWrap">
          <article class="notice">
          	<div class="checks etrans">
          		
          		<input type="checkbox" id="check_top" name="check_top" <c:if test="${content.notice_top==1}">checked</c:if>>
          		<label for="check_top">공지사항</label>&nbsp;
          	
     			<input type="checkbox" id="check_event" name="check_event" <c:if test="${content.notice_event==1}">checked</c:if>>
     			<label for="check_event">이벤트</label>
          	</div>
          	<div class="form-group">          	
          		<label>제목</label>
          		<input type="text" name="notice_subject" size="60" class="form-control" required="required" value="${content.notice_subject}">
          	</div>
			<div class="form-group">
				<label>내용</label>
				<div>
					<c:if test="${!empty pics}">
						<c:forEach var="picList" items="${pics}">
							<img src="resources/file/upload/${picList}">
						</c:forEach>
					</c:if>
				</div>
				<textarea onkeyup="resize(this)" onfocus="resize(this)" id="notice_con" cols="60" rows="20" name="notice_content" class="form-control" required="required">${content.notice_content}</textarea>				
			</div>

			<div class="form-group">
			
			<input type="file" id="files" name="files" multiple class="filestyle" accept="image/*" data-input="false">
			<output id="list"></output>
			</div>
			
			<script>
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate ? f.lastModifiedDate.toLocaleDateString() : 'n/a',
                  '</li>');
    }
    document.getElementById('list').innerHTML = '<div class="form-group"><hr><ul>' + output.join('') + '</ul></div>';
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>
          </article>

          


          <div class="articleTail">
            <a href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 목록으로 돌아가기</a>
            <span class="contentsUpdate"><input type="submit" class="btn btn-default" value="수정"></span>
          </div>
        </div><!-- /.noticeWrap -->
        <input type="hidden" id="notice_top" name="notice_top" value="${content.notice_top}">
        <input type="hidden" id="notice_event" name="notice_event" value="${content.notice_event}">
        <input type="hidden" id="notice_idx" name="notice_idx" value="${content.notice_idx}">
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