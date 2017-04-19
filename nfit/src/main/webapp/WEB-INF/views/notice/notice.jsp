<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header.jsp" %>

<link href="http://tlx.co.kr/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

<script>

$(document).ready(function(){
	boardMain.init();
});

var boardMain = {
		
		init : function(){
			
			var _this = this;
			_this.btnEvent();
			_this.getBoardList();
			
		}
		,btnEvent : function(){
			
			/* 게시글 제목 클릭 상세보기 */
			$('.boardTitle').on('click',function(){
				var popUrl = "/spring/boardDetail?docnum="+$(this).attr('id');	//팝업창에 출력될 페이지 URL
				var popOption = "width=570, height=360, resizable=no, scrollbars=no, status=no;";//팝업창 옵션(optoin)
				window.open(popUrl,"",popOption);

			});
			
			/* 작성하기 클릭  */
			$('input[type=button]').on('click',function(){
				var url = "/spring/boardWrite";//팝업창에 출력될 페이지 URL
				location.href = url;
			});
			
		}
		// ************ 3번영역  ***************** 
		,getBoardList : function(no){

			var pageNo = (no || 1);
			
			$.ajax({
				type:"GET",
				url:  '/spring/boardList',
				dataType:  "json",
				data :  "countPerPage="+10+ "&amp;pageNo="+pageNo,
				contentType: "application/json; charset=UTF-8",
				cache 	: false,
				success : function(resData){
					
					var item=resData.result;
					var selectHtml=[];
					var len=item.length;
					
					var page=resData.page;  //페이징 변수</span>
					var page_boardList = Paging(page.totalCount, 10, 10 ,pageNo,  "boardList");  //공통 페이징 처리 함수 호출
				
					 //데이타 그리기</span>
					 if(len >0){
						$(item).each(function(i, item){
	 						
							selectHtml.push( '<tr>');
							selectHtml.push( '<th ><a href="#" >'+item.DOCNUM+ '</a></th>');
							selectHtml.push( '<th class="boardTitle" id="'+item.DOCNUM+ '"><a href="#">'+(item.TITLE ||  "제목없음")+ '</a></th>');
							selectHtml.push( '<td>'+item.ADD_USR_NM+ '</td>');
							selectHtml.push( '<td>'+item.VIEWCOUNT+ '</td>');
							selectHtml.push( '</tr>');
						});
					} else{
						selectHtml.push( '<tr>');
						selectHtml.push( '<td colspan="3">조회된 결과가 없습니다.</td>');
						selectHtml.push( '</tr>');
					}
					
					$( "#boardList").empty().html(selectHtml.join( ''));
					
					 //페이징 그리기</span>
					$( "#paging").empty().html(page_boardList);
					
				},
				 /* ajax error 확인방법 */
				error 	: function(request,status,error){
				    console.log(request);
				    console.log(status);
				    console.log(error);
				}
			});
			
			
		}
		
		
}

 //************ 4번영역  ***************** 
var goPaging_boardList = function(cPage){
	boardMain.getBoardList(cPage);  // boardAdmin 개체의 getBoardList 함수를 다시 호출
};	


 // ************ 2번영역  ***************** --> 목록 페이징 함수
Paging = function(totalCnt, dataSize, pageSize, pageNo, token){
           totalCnt = parseInt(totalCnt);	 // 전체레코드수
           dataSize = parseInt(dataSize);    // 페이지당 보여줄 데이타수
           pageSize = parseInt(pageSize);    // 페이지 그룹 범위       1 2 3 5 6 7 8 9 10
           pageNo = parseInt(pageNo);        // 현재페이지
          
           var  html =  new Array();
            if(totalCnt == 0){
                       return "";
           }
          
            // 페이지 카운트
           var pageCnt = totalCnt % dataSize;         
            if(pageCnt == 0){
                      pageCnt = parseInt(totalCnt / dataSize);
           } else{
                      pageCnt = parseInt(totalCnt / dataSize) + 1;
           }
          
           var pRCnt = parseInt(pageNo / pageSize);
            if(pageNo % pageSize == 0){
                      pRCnt = parseInt(pageNo / pageSize) - 1;
           }
          
            //이전 화살표
            if(pageNo > pageSize){
                      var s2;
                       if(pageNo % pageSize == 0){
                                  s2 = pageNo - pageSize;
                      } else{
                                  s2 = pageNo - pageNo % pageSize;
                      }
                      html.push( '<a href=javascript:goPaging_' + token +  '("');
                      html.push(s2);
                      html.push( '");>');
                      html.push( '◀ ');
                      html.push( "</a>");
           } else</span>{
                      html.push( '<a href="#">\n');
                      html.push( '◀ ');
                      html.push( '</a>');
           }
          
            //paging Bar
            for(var index=pRCnt * pageSize + 1;index<(pRCnt + 1)*pageSize + 1;index++){
                       if(index == pageNo){
                                  html.push( '<strong>');
                                  html.push(index);
                                  html.push( '</strong>');
                      } else{
                                  html.push( '<a href=javascript:goPaging_' + token +  '("');
                                  html.push(index);
                                  html.push( '");>');
                                  html.push(index);
                                  html.push( '</a>');
                      }
                       if(index == pageCnt){
                                   break;
                      } else html.push( '  |  ');
           }
            
            //다음 화살표
            if(pageCnt > (pRCnt + 1) * pageSize){
                      html.push( '<a href=javascript:goPaging_' + token +  '("');
                      html.push((pRCnt + 1)*pageSize+1);
                      html.push( '");>');
                      html.push( ' ▶');
                      html.push( '</a>');
           } else{
                      html.push( '<a href="#">');
                      html.push( ' ▶');
                      html.push( '</a>');
           }
 
            return html.join( "");
}
</script>


</head>
<body>

<br><br><br>
<div class="wrap">

    <div class="wrap">


  <div class="container">
    <div class="row">
      <div class="content col-md-12">
        <div class="page-header">
          <h2>
            공지사항
            <small>이벤트와 새로운 알림을 확인하세요!</small>
          </h2>
        </div>
        
        <div class="noticeWrap">
          <div class="list-group">
          	<c:if test="${empty list}">
          		<div>등록된 게시글이 없습니다.</div>
          	</c:if>
          	<c:forEach var="dto" items="${list}">
          		<c:url var="cotentUrl" value="noticeContents.do">
          			<c:param name="idx">${dto.notice_idx}</c:param>
          		</c:url>
				<a class="list-group-item" href="noticeContents.do?idx=${dto.notice_idx}">
					<c:if test="${dto.notice_top!='1'}">
						<span class="label label-default">${dto.notice_idx}</span>   
					</c:if>
					<c:if test="${dto.notice_top=='1'}">
						<span class="label label-info">공지</span> 
					</c:if>
					<c:if test="${dto.notice_top=='1'&&dto.notice_event=='1'}">
						<span class="label label-primary">이벤트</span>  
					</c:if>
					<c:if test="${dto.notice_top!='1'&&dto.notice_event=='1'}">
						<span class="label label-default">이벤트</span>  
					</c:if>            
					<h4 class="list-group-ietm-heading">${dto.notice_subject}</h4>
					<span class="date">
						<fmt:formatDate value="${dto.notice_date}" pattern="yyyy-MM-dd"/>
					</span>
				</a>
          	</c:forEach>
              
          </div><!-- /.list-group -->

          <nav>
            <ul class="pagination">
            	<li>${pageStr}</li>
            </ul>
          </nav>
          
          
 	      
        </div><!-- /.noticeWrap -->



      </div> <!-- /.content -->
    </div><!-- /.row -->
  </div><!-- /container -->
  

	<table class="tbl_port" style="border: 1px solid #ccc">
		<caption style= "background-color: #ccc">목록</caption>
		<colgroup>
			<col width= "10%"/>
			<col width= "*"/>
			<col width= "15%"/>
			<col width= "10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope= "col">글번호</th>
				<th scope= "col">제목</th>
				<th scope= "col">작성자</th>
				<th scope= "col">조회수</th>
			</tr>
		</thead>
		<!-- ************* 1번영역  ***************** -->
		<tbody id= "boardList">
			
		</tbody>
	</table>
	<br/>
	<div id= "paging" style= "margin-left: 190px;"></div>
	<br/>
	<div ><input type= "button" value= "작성하기 " style= "margin-left: 440px;"/></div>

  

</div> <!-- /.wrap -->
<div class="spinnerWrap" id="spinner" style="display:none;">
    <div class="loader">Loading...</div>
</div>

<script src="/js/bootstrap.min.js"></script>
<script src="/js/wow.min.js"></script>

<!--<![endif]-->
<script src="/js/lightgallery-all.min.js"></script>
<script src="/js/jquery.bgswitcher.js"></script>

<!-- IE8 / no SVG support browser -->
<script src="/js/svgeezy.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
<script src="/js/daterangepicker.js"></script>
<script src="/js/waypoints.min.js"></script>
<script src="/js/jquery.counterup.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<script src="/js/sweetalert.min.js"></script>
<!--
<script src="/js/chromeSmoothScroll.min.js"></script>
-->
<script src="/js/tlx_front.js?v=20160812"></script>


</div>
<%@include file="../footer.jsp" %>
</body>
</html>