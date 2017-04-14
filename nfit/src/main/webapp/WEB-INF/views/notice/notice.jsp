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
var page = 1;                       //페이지 변수를 1로 초기화
var searchKey = '';                 //검색기능을 위해 검색 변수 초기화

$.ajax({
	type : 'POST',
	url : "notice.do"
        dataType : "json",
        data : {
	        'page' : page,
	        'searchKeyword' : searchKey
	},
	success : function (result) {

respone = result.lists;          	       	 //반환값중 데이터목록을 response변수에 삽입
	       	

paging = result.paging;             //페이징관련 데이터들을 paging변수에 삽입
	       			    	

	       	$("데이터가 삽입될 객체 table").empty();    //데이터가 삽입될 객체를 비워준다. (들어가있던 전데이터들을 지워주기위해)


	       	if(respone.length == 0){                //가져온 데이터가 없으면 목록이 없다는 문구를 삽입.
	       		$("데이터가 삽입될 tbody").append("<td colspan=20 style='padding:30px;'>데이터가 없습니다.</td>");
	       	}else{                                    //데이터가있으면 목록을 each로 반복
	            _.each(respone, function(item){
			var contentHtml = _.template($('데이터가 삽입될 템플릿').html(), item );      //언더스코어를 이용 템플릿을 제작
			$("데이터가 삽입될 tbody").append(contentHtml);
	      });		
	       	}						

	       	//이부분이 페이징처리
	        $(".pagination").empty();  //페이징에 필요한 객체내부를 비워준다.
	        	
	        if(paging.page != 1){            // 페이지가 1페이지 가아니면
	        	$(".pagination").append("<li class=\"goFirstPage\"><a><<</a></li>");        //첫페이지로가는버튼 활성화
	        }else{
	        	$(".pagination").append("<li class=\"disabled\"><a><<</a></li>");        //첫페이지로가는버튼 비활성화
	        }

	        if(paging.block != 1){            //첫번째 블럭이 아니면
	        	$(".pagination").append("<li class=\"goBackPage\"><a><</a></li>");        //뒤로가기버튼 활성화
	        }else{
	        	$(".pagination").append("<li class=\"disabled\"><a><</a></li>");        //뒤로가기버튼 비활성화
	        }
	        	
	        for(var i = paging.startPage ; i <= paging.endPage ; i++){        //시작페이지부터 종료페이지까지 반복문
	        	if(paging.page == i){                            //현재페이지가 반복중인 페이지와 같다면
	                	$(".pagination").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화
	        	}else{
	        		$(".pagination").append("<li class=\"goPage\" data-page=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
	        	}
	        }

	        if(paging.block < paging.totalBlock){            //전체페이지블럭수가 현재블럭수보다 작을때
	        	$(".pagination").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화
	        }else{
	        	$(".pagination").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화
	        }
  
          if(paging.page < paging.totalPage){                //현재페이지가 전체페이지보다 작을때
        		$(".pagination").append("<li class=\"goLastPage\"><a>>></a></li>");    //마지막페이지로 가기 버튼 활성화
        	}else{
        		$(".pagination").append("<li class=\"disabled\"><a>>></a></li>");        //마지막페이지로 가기 버튼 비활성화
        	}

//첫번째 페이지로 가기 버튼 이벤트
        	$(".goFirstPage").click(function(){
		       	page = 1;
		       	pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
	        });

//뒷페이지로 가기 버튼 이벤트
		$(".goBackPage").click(function(){
		      	page = Number(paging.startPage) - 1;
		       	pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
	        });

//클릭된 페이지로 가기 이벤트
		$(".goPage").click(function(){
			page = $(this).attr("data-page");
			pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
		});

//다음페이지로 가기 클릭이벤트
		$(".goNextPage").click(function(){
			page = Number(paging.endPage) + 1;
			pageFlag = 1;
		      	$("상단 ajax를 함수로 만들어 재귀호출");
		       	pageFlag = 0;
	        });

//마지막페이지로 가기 클릭이벤트
	        $(".goLastPage").click(function(){
	        	page = paging.totalPage;
	        	pageFlag = 1;
		       	$("상단 ajax를 함수로 만들어 재귀호출");
		      	pageFlag = 0;
	        });
	    }
    });
});
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