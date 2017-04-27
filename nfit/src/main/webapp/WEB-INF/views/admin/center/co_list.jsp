<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2017/0423 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> --> 
<!-- Icons -->
<!-- Main styles for this application -->
<link href="resources/css/adminstyle.css" rel="stylesheet">
<link href="resources/css/style.css" rel='stylesheet' type='text/css' />
<link rel="shortcut icon" type="image/x-icon"href="resources/images/fav-icon.png" />
<!---start-login-script--->
<script src="resources/js/login.js"></script>
<!---//End-login-script--->
<!-----768px-menu----->
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/css/simple-line-icons.css" rel="stylesheet">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	google.load('visualization', '1', {
		'packages' : [ 'corechart','table' ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		var jsonData = $.ajax({
			url : 'company_list.do',
			dataType : 'json',
			async : false
		}).responseText;
		var data = new google.visualization.DataTable(jsonData);
		var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
		chart.draw(data, {
			title : '업체 누적 이용수',		
			width : 900,
			height : 900
		});
	}
	/* PieChatomcat 8 context path 설정rt 도가능  */
</script>
<script>
$(document).ready(function(){
		$('.filedropDown').on('dragenter dragover' , function(event){
			event.preventDefault();//기본 효과를 막음
		});
		//이벤트 효과 1개 넣기
		$('.filedropDown').on('drop',function(event){
			//기본 효과막음
			event.preventDefault();
			//드래그된 파일정보
			var files= event.originalEvent.dataTransfer.files;
			//체크박스 검사
			
			//체크박스값 가져오기
			var checkbox=0;
			$('input[name=co_class2]:checked').each(function() {
				 checkbox = $(this).val();
				console.log(checkbox);
			});
			var co_name =document.getElementById('co_name').value;
			var co_address =document.getElementById('co_address').value;
		 	var co_avail = document.getElementById('co_avail').value;
		 	var co_extra = document.getElementById('co_extra').value;
		 	var co_regul = document.getElementById('co_regul').value;
		 	var co_phone = document.getElementById('co_phone').value;
			//ajax로 전달할  폼 객체 
			var formData=new FormData();
			//폼 객체에 파일 추가 , append ('변수명',값)
			console.log(files[0]);
			
			var arr=[];
			for(var i =0;i<files.length;i++){
				var file=files[i];
				console.log('파일 for문 돌림 : :  :: : '+file)
				
			formData.append('files' ,file);//파일 배열 담는곳
			}
			
			console.log('첫번째파일::'+files[0]);
			console.log('두번째파일::'+files[1]);
			console.log('콘솔에서찍은 주소 ::'+co_address);
			
			formData.append('checkbox' ,checkbox);
			formData.append('co_name' ,co_name);
			formData.append('co_address' ,co_address);
			formData.append('co_avail',co_avail);
			formData.append('co_regul',co_regul);
			formData.append('co_extra',co_extra);
			formData.append('co_phone',co_phone);
			//processData : false => post 방식
			//contentType : false => multipart/form-data
			$.ajaxSettings.traditional = true;
			$.ajax({
				type : 'post',
				url : 'uploadAjax.do',
				data : formData,
				dataType:'text',
				processData : false,
				contentType: false,
				success : function(result){
					if(result =='success'){
						alert('등록업로드 완료입니다.');
					}
				}
		});
	});
	//이용시간 등록 
	$('#btnUsetime_insert').click(function(){
		var usetime_day=  $('#usetime_day').val();
		var usetime_time= $('#usetime_time').val();
		var param='usetime_day='+usetime_day+'&usetime_time='+usetime_time;
		$.ajax({
			type : 'post',
			data : param,
			url  : 'usetime_insert.do',
			success : function(result){
					if(result='success'){
						alert('이용시간 등록 성공!');
					}
			}
		});
	});
	//컨탠츠 등록
	$('#btnContent_insert').click(function(){
		var content_coin = $('#content_coin').val();
		var content1= $('#content1').val();
		var content2= $('#content2').val();
		var content3= $('#content3').val();
		var content4= $('#content4').val();
		var content5= $('#content5').val();
		var content6= $('#content6').val();
		var param ='content_coin='+content_coin+'&content1='+content1+'&content2='+content2+'&content3='+content3+'&content4='+content4+'&content5='+content5+'&content6='+content6;
		$.ajax({
			type :'post',
			url : 'content_insert.do',
			data : param,
			success : function(result){
				 if(result ='success'){
					 alert('컨탠츠등록 성공!');
				 }
			}
		});
	});
	//기존 업체 컨탠츠 등록
	$('#btnOldCompany').click(function(){
		//기존 업체 전화번호
		var oldcompany_phone =$('#oldcompany_co_idx').val();
		var con_coin = $('#con_coin').val();
		var con_con1 = $('#con_con1').val();
		var con_con2 = $('#con_con2').val();
		var con_con3 = $('#con_con3').val();
		var con_con4 = $('#con_con4').val(); 
		var con_con5 = $('#con_con5').val();
		var con_con6 = $('#con_con6').val();
		var param=
			'co_phone='+oldcompany_phone+'&content_coin='+con_coin+'&content1='+con_con1+'&content2='+con_con2+'&content3='+con_con3+'&content4='+con_con4+'&content5='+con_con5+'&content6='+con_con6;
		$.ajax({
			type : 'post',
			url : 'oldCompanycon.do',
			data : param,
			success : function(result){
				if(result='success'){
					alert('등록완료입니다.');
				}
			}
		});
	});
	 $('#keyField').autocomplete({
		 source :function(request ,response){
			 var keyword =$('#keyWord').val();
			 $.ajax({
				type : 'post',
				url : 'autocomplete.do',
				dataType : 'json',
				data :{ value : request.term,//사용자가 입력한값
						keyword:keyword//option value
				},
				success : function(data){
						response($.map(data.data,function(result){
							return {
								label :result.co_list,
								value :result.co_list
							}
					}));
						$('.ui-helper-hidden-accessible').css('display','none');
				}
			});
 		},
 		selectFirst:true
 	});
});
</script>
<style>
.ui-menu-item{
color: black;
font-weight: bold;
}
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.type05 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
   .button {
   border: 0px solid #0a3c59;
   background: #a5c1d4;
   background: -webkit-gradient(linear, left top, left bottom, from(#a8b8c4), to(#a5c1d4));
   background: -webkit-linear-gradient(top, #a8b8c4, #a5c1d4);
   background: -moz-linear-gradient(top, #a8b8c4, #a5c1d4);
   background: -ms-linear-gradient(top, #a8b8c4, #a5c1d4);
   background: -o-linear-gradient(top, #a8b8c4, #a5c1d4);
   background-image: -ms-linear-gradient(top, #a8b8c4 0%, #a5c1d4 100%);
   padding: 4.5px 9px;
   -webkit-border-radius: 29px;
   -moz-border-radius: 29px;
   border-radius: 29px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   text-shadow: #422542 0 1px 0;
   color: #10171c;
   font-size: 11px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 0px solid #0a3c59;
   text-shadow: #93ccf0 0 1px 0;
   background: #bacedb;
   background: -webkit-gradient(linear, left top, left bottom, from(#aecee3), to(#bacedb));
   background: -webkit-linear-gradient(top, #aecee3, #bacedb);
   background: -moz-linear-gradient(top, #aecee3, #bacedb);
   background: -ms-linear-gradient(top, #aecee3, #bacedb);
   background: -o-linear-gradient(top, #aecee3, #bacedb);
   background-image: -ms-linear-gradient(top, #aecee3 0%, #bacedb 100%);
   color: #080508;
   }
.button:active {
   text-shadow: #1e4158 0 1px 0;
   border: 0px solid #0a3c59;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#bacedb));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
   color: #fff;
   }
</style>
</head>
<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
<c:set var="list" value="${list}"/>
<header>
	<jsp:include page="../../header.jsp"/>
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
       <main class="main"><div class="title" style="margin-top: 15px; margin-left: 35px;">
			<img src="resources/img/favicon.png" style="height: 65px;"> 
			<a href="memberAdmin.do" style="font-family:'Nanum Pen Script' serif;">회원관리 페이지</a>
		</div>
            <div><!-- class="container-fluid" -->
				<!-- 내용들어갈곳 -->
				<div><!-- id="ui-view" -->
					<!--페이징부분  -->
					<div style="display: block;">
						<c:if test="${startpage>1}">
							<a href="co_list.do?pagenum=${startpage-10}">&lt;&lt;</a>
						</c:if>
						<c:forEach  var ="i" begin="${startpage}" end="${endpage}" step="1">
							<a href="co_list.do?pagenum=${i}">[${i}]</a>
						</c:forEach> 
						<c:if test="${endpage<totalpage}">
							<a href="co_list.do?pagenum=${startpage+10}">&gt;&gt;</a>
						</c:if>
					</div>
					<!-- -------- -->
					<!-- 업체등록 모달 -->
					<div class="container" style="width: 10%;display: -webkit-inline-box">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-info btn-xs-5" data-toggle="modal" data-target="#myModal" style="margin-right: 10px;">업체등록</button>
					  <!-- Modal -->
					  	<div class="modal fade" id="myModal" role="dialog">
					   	 	<div class="modal-dialog" style="width:1500px;height: 700px;">
					      	<!-- Modal content-->
					      		<div class="modal-content" style="width: 900px;">
					        		<div class="modal-header">
					          			<button type="button" class="close" data-dismiss="modal">&times;</button>
					          			<h4 class="modal-title">업체등록</h4>
					        		</div>
					        		<!-- 모달 body  -->
					        		<div class="modal-body" style="margin:10px;">
					          			<form action="chart.do" name="company_add" method="post" enctype="multipart/form-data"id="form1" target="iframe1" class="form-horizontal" role="form" >
										  	<label for="inputText3" class="col-sm-2 control-label">업체명</label>
										  		<div class="col-sm-5">
													<input type="text" class="form-control" name="co_name" id="co_name">  			
										  		</div>
										  	<label for="inputText3" class="col-sm-2 control-label">주소</label>
										  		<div class="col-sm-5">
													<input type="text" class="form-control" name="co_address" id="co_address">  			
										  		</div>
													 <div class="col-sm-offset-2 col-sm-5"> 
												   		<div class="checkbox"> 
													   		<label> <input type="checkbox" name="co_class2" value="1"> 헬스 </label> 
													   		<label> <input type="checkbox" name="co_class2" value="2"> 뷰티</label> 
													   		<label> <input type="checkbox" name="co_class2" value="3"> 필라테스</label> 
													   		<label> <input type="checkbox" name="co_class2" value="4"> 탁구</label> 
													   		<label> <input type="checkbox" name="co_class2" value="5"> 복싱</label> 
													   		<br>
													   		<label> <input type="checkbox" name="co_class2" value="6"> 검도</label> 
													   		<label> <input type="checkbox" name="co_class2" value="7"> 격투기</label> 
													   		<label> <input type="checkbox" name="co_class2" value="8"> 크로스핏</label> 
													   		<label> <input type="checkbox" name="co_class2" value="9"> 골프</label> 
													   		<label> <input type="checkbox" name="co_class2" value="10"> 기타</label> 
												   		</div> 
											   		</div> 
											  	<label for="inputText3" class="col-sm-2 control-label">업체전화번호</label>
											  		<div class="col-sm-5">
														<input type="text" class="form-control" name="co_phone" id="co_phone">  			
											  		</div>
										  		<label for="inputText3" class="col-sm-2 control-label">이용규정및  &nbsp;&nbsp;&nbsp;준비물</label>
										  			<div class="col-sm-5">
														<textarea rows="5" cols="20"class="form-control" name="co_regul" placeholder="문단구분 '|'를 넣어주세요" id="co_regul"></textarea>
										  			</div>
										  		<label for="inputText3" class="col-sm-2 control-label">부가서비스</label>
										  			<div class="col-sm-5">
														<textarea rows="5" cols="20"class="form-control" name="co_extra" placeholder="문단구분 '|'를 넣어주세요" id="co_extra"></textarea>
										  			</div>
										  	
										  		<label for="inputText3" class="col-sm-2 control-label">이용가능</label>
										  			<div class="col-sm-5">
														<textarea rows="5" cols="20"class="form-control" name="co_avail" placeholder="문단구분 '|'를 넣어주세요" id="co_avail"></textarea>
										  			</div>
										  	 	<div class="col-sm-5">
										  	 	<b>사진은 마지막에 넣어주세요 ~</b>
										  		</div>
										  		<label for="inputText3" class="col-sm-5 control-label">업체사진업로드</label>
										  			<div class="col-sm-5">
														<div class="filedropDown" style="width: 300px;height: 300px; border: 2px solid black;"></div>
										  			</div>
										</form>
					        		</div>
					      		</div>
					    	</div>
					  	</div>
					</div>
					<!-- 차트를 넣을 모달 적용 -->
					<div class="container" style="width: 10%; display:inline-table;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-info btn-xs-5" data-toggle="modal" data-target="#myModal2">이용누적차트</button>
					  <!-- Modal -->
						<div class="modal fade" id="myModal2" role="dialog">
							<div class="modal-dialog">
							<!-- Modal content-->
								<div class="modal-content" style="width:1000px;height: 1300px;">
								  <div class="modal-header">
								    <button type="button" class="close" data-dismiss="modal">&times;</button>
								    <h4 class="modal-title">누적차트표</h4>
								  </div>
								  <div class="modal-body">
								    <div id="chart_div">
										<!-- 차트새로고침버튼 -->
										<button type="button" onclick="drawChart()" id="btn" class="btn btn-default">refresh</button>
									</div>
								 </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								 	 </div>
								</div>
							</div>
						</div>
					</div>
					<!-- 이용시간및 컨탠츠 등록  -->
					<div class="container" style="width: 10%; display:inline ;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-info btn-xs-5" data-toggle="modal" data-target="#myModal3">이용시간및 컨탠츠 등록</button>
					  <!-- Modal -->
						<div class="modal fade" id="myModal3" role="dialog">
							<div class="modal-dialog" style="width:1000px;height: 900px;">
							<!-- Modal content-->
								<div class="modal-content">
								  <div class="modal-header">
								    <button type="button" class="close" data-dismiss="modal">&times;</button>
								    <h4 class="modal-title">이용시간 및 컨텐츠 등록 </h4>
								  </div>
								  <div class="modal-body">
								    	<table class="type09">
								    		<tr>
								 				<th>요일 <br>을적어주세요 </th>
								    			<td>
							    					<input type="text" id="usetime_day" placeholder=" ex.)평일,토요일,일요일,휴무일 " required="required">
								    			</td>
								    		</tr>
								    		<tr>
								    			<th>시간을적어주세요</th>
								    			<td>
								    				<input type="text" id="usetime_time" placeholder=" ex)00:00~00:00" required="required">
								    			</td>
								    		</tr>
								    		<tr>
								    			<td colspan="2" align="right">
								    				<button type="button" id="btnUsetime_insert" class="button">Insert!</button>
							    				</td>
								    		</tr>
								    	</table>
								    	<table class="type09">
								    		<tr>
								    			<th>적용코인갯수</th>
								    			<td>
								    			<input type="text" id="content_coin" placeholder="작성해주세요" required="required">
								    			</td>
								    		</tr>
								    		<tr>
								    			<th>컨탠츠1번</th>
												<td>
													<input type="text" id="content1">
												</td>	    		
								    		</tr>
								    		<tr>
								    			<th>컨탠츠2번</th>
								    			<td>
								    				<input type="text" id="content2">
								    			</td>
								    		</tr>
								    		<tr>
								    			<th>컨탠츠3번</th>
								    			<td>
								    				<input type="text" id="content3">
								    			</td>
								    		</tr>
								    		<tr>
								    			<th>컨탠츠4번</th>
								    			<td>
								    				<input type="text" id="content4">
								    			</td>
								    		</tr>	
								    		<tr>
								    			<th>컨탠츠5번</th>
								    			<td>
								    				<input type="text" id="content5">
								    			</td>
								    		</tr>
								    		<tr>
								    			<th>컨탠츠6번</th>
								    			<td>
								    				<input type="text" id="content6">
								    			</td>
								    		</tr>
								    		
								    		<tr>
								    			<td colspan="7" align="right">
								    				<button type="button" id="btnContent_insert" class="button">Insert!</button>
							    				</td>
								    		</tr>
								    	</table>
								    	<hr>
							    		<!-- 기존업체 컨텐츠 등록 --> 
								    	 <p>기존 업체 컨탠츠 등록 폼</p>
								    	 <input type="text" id="oldcompany_co_idx"placeholder="전화번호입력해주세요">
								    	 <table class="type05">
								    	 	<tr>
								    	 	 	<th>코인</th>
								    	 	 	<td>
								    	 	 		<input type="text" id="con_coin">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 	 	<th>컨텐츠1번</th>
								    	 	 	<td>
								    	 	 		<input type="text" id="con_con1">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 	 	<th>컨텐츠2번</th>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con2">
								    	 	 	</td>
								    	 	</tr>
											<tr>
								    	 	 	<th>컨텐츠3번</th>
								    	 	 	<td>
								    	 	 		<input type="text" id="con_con3">
								    	 	 	</td>
								    	 	</tr>
											<tr>
								    	 	 	<th>컨텐츠4번</th>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con4">
								    	 	 	</td>
								    	 	</tr>
											<tr>
								    	 	 	<th>컨텐츠5번</th>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con5">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 	 	<th>컨텐츠6번</th>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con6">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 		<td colspan="2" align="right">
											    	 <button type="button" id="btnOldCompany" class="button">Insert!</button>
								    	 		</td>
								    	 	</tr>
								    	 </table>
								 	</div>
								</div>
							</div>
						</div>
					</div>
				<form name="form1" method="post" action="co_list.do">
						 <select name="keyword" id="keyWord">
							 	<option value="co_name">업체명</option>
							 	<option value="co_class">종목</option>
							 	<option value="co_phone">연락처</option>
							 	<option value="co_address">주소</option>
						 </select>
							 <input type="text" name="keyfield" id="keyField">
					    	 <input type="submit" value="조회">
					    	 <!-- 키워드목록표출 -->
					    	 <div id="div1"></div>
				</form>
					<!-- 업체리스트 나열 테이블  -->	 
					<span style="margin-left: 600px;">등록된 업체 나열 </span>
						<table class="table table-striped table-bordered table-hover"> <!-- class="table table-bordered"  -->
								<thead>
										<tr>
											<td>업체 번호(수정)</td>
											<td>업체 이름</td>
											<td>업체 주소</td>
											<td>업체 종목</td>
											<td>업체 연락쳐</td>
										</tr>
								</thead>
								<tbody id="container">
									<c:if test="${empty list}">
										<tr>
											<td colspan="6">등록된게시물이없음</td>
										</tr>
									</c:if>
									<c:forEach var="vo" items="${list}">
											<tr>
												<td><a data-toggle="modal"href="co_update.do?co_idx=${vo.co_idx}" data-target="#modal-testNew" role="button" data-backdrop="static"><span class="btn btn-info">${vo.co_idx}</span></a></td>
												<td>${vo.co_name}</td>
												<td>${vo.co_address}</td>
												<td>${vo.co_class}</td>
												<td>${vo.co_phone}</td>
											</tr>
									</c:forEach>
								</tbody>
						</table>
						<!-- 모달 생성되는곳 -->
						<div id="modal-testNew" class="modal fade" tabindex="1" role="dialog" aria-labelledby="테스트" aria-describedby="테스트모달">
							<div class="modal-dialog" style="width:1200px;height: 700px;">
								<div class="modal-content" style="width:1300px;">
									<!-- remote ajax call -->
								</div>
							</div>
						</div>
                 </div>
            </div>
            <!-- /.conainer-fluid -->
        </main>
    </div>
<footer class="app-footer">
   <jsp:include page="../../footer.jsp"/>
</footer>
</body>
</html>