<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header.jsp" %>
<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<br><br><br>
<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header noticeViewHeader">
          <h2>
          	공지사항 글작성
          </h2>
        </div>
        
        <form name="noticeContentWrite" action="noticeWrite.do" method="post">
        <div class="noticeWrap">
          <article class="notice">
          	<div class="form-group">          	
          		<label>제목</label>
          		<input type="text" name="notice_subject" size="95" class="form-control">
          	</div>
			<div class="form-group">
				<label>내용</label>
				<textarea cols="99" rows="20" name="notice_content" class="form-control">
				</textarea>				
			</div>
          </article>

          


          <div class="articleTail">
            <a href="javascript:history.go(-1)" class="btn btn-default"><i class="fa fa-arrow-left"></i> 목록으로 돌아가기</a>
          </div>
        </div><!-- /.noticeWrap -->
		</form>





      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->

</div>
<%@include file="../footer.jsp" %>
</body>
</html>