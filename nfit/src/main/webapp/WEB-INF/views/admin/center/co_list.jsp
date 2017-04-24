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
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
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
<link type="text/css" rel="stylesheet"href="resources/css/jquery.mmenu.all.css" />
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
		console.log(jsonData);
		var data = new google.visualization.DataTable(jsonData);
		var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
		chart.draw(data, {
			title : '업체 누적 이용수',		
			width : 900,
			height : 1100
		});
	}
	/* PieChart 도가능  */
</script>
<script>
$(document).ready(function(){
		$('.filedropDown').on('dragenter dragover' , function(event){
			event.preventDefault();//기본 효과를 막음
		});
		//이벤트 효과 1개 넣기
		$('.filedropDown').on('drop',function(event){
			console.log('두번째이벤트 효과 출발');
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
});
</script>
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
                    	<a class="nav-link" href="questionAdmin.do"><i class="icon-check"></i>문의 관리</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="noticeAdmin.do"><i class="icon-list"></i>공지사항 관리</a>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Main content -->
       <main class="main">
            <div class="container-fluid">
				<!-- 내용들어갈곳 -->
				<div id="ui-view">
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
					<div class="container" style="width: 100px;display:inline-block;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-info btn-xs-5" data-toggle="modal" data-target="#myModal">업체등록</button>
					  <!-- Modal -->
					  	<div class="modal fade" id="myModal" role="dialog">
					   	 	<div class="modal-dialog" style="width:1500px;height: 700px;">
					      	<!-- Modal content-->
					      		<div class="modal-content">
					        		<div class="modal-header">
					          			<button type="button" class="close" data-dismiss="modal">&times;</button>
					          			<h4 class="modal-title">업체등록</h4>
					        		</div>
					        		<!-- 모달 body  -->
					        		<div class="modal-body">
					          			<form action="chart.do" name="company_add" method="post" enctype="multipart/form-data"id="form1" target="iframe1" class="form-horizontal" role="form" >
										  <div class="form-group">
										  	<label for="inputText3" class="col-sm-2 control-label">업체명</label>
										  		<div class="col-sm-5">
													<input type="text" class="form-control" name="co_name" id="co_name">  			
										  		</div>
										  </div> 
										  <div class="form-group">
										  	<label for="inputText3" class="col-sm-2 control-label">주소</label>
										  		<div class="col-sm-5">
													<input type="text" class="form-control" name="co_address" id="co_address">  			
										  		</div>
										  </div> 
											<div class="form-group">
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
										   	</div>
											<div class="form-group">
											  	<label for="inputText3" class="col-sm-2 control-label">업체전화번호</label>
											  		<div class="col-sm-5">
														<input type="text" class="form-control"placeholder="text" name="co_phone" id="co_phone">  			
											  		</div>
										  	</div>  
											<div class="form-group">
										  		<label for="inputText3" class="col-sm-2 control-label">이용규정및 준비물</label>
										  			<div class="col-sm-5">
														<textarea rows="5" cols="20"class="form-control" name="co_regul" placeholder="문단구분 '|'를 넣어주세요" id="co_regul"></textarea>
										  			</div>
										  	</div>
										  	<div class="form-group">
										  		<label for="inputText3" class="col-sm-2 control-label">부가서비스</label>
										  			<div class="col-sm-5">
														<textarea rows="5" cols="20"class="form-control" name="co_extra" placeholder="문단구분 '|'를 넣어주세요" id="co_extra"></textarea>
										  			</div>
										  	</div> 
										  	<div class="form-group">
										  		<label for="inputText3" class="col-sm-2 control-label">이용가능</label>
										  			<div class="col-sm-5">
														<textarea rows="5" cols="20"class="form-control" name="co_avail" placeholder="문단구분 '|'를 넣어주세요" id="co_avail"></textarea>
										  			</div>
										  	</div> 
										  	<div class="form-group">
										  		<label for="inputText3" class="col-sm-2 control-label">업체사진업로드</label>
										  			<div class="col-sm-5">
														<div class="filedropDown" style="width: 300px;height: 300px; border: 2px solid black;"></div>
										  			</div>
										  	</div> 
										</form>
					        		</div>
					      		</div>
					    	</div>
					  	</div>
					</div>
					<!-- 차트를 넣을 모달 적용 -->
					<div class="container" style="width: 100px; display:inline-block;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-info btn-xs-5" data-toggle="modal" data-target="#myModal2">이용누적차트</button>
					  <!-- Modal -->
						<div class="modal fade" id="myModal2" role="dialog">
							<div class="modal-dialog" style="width:1000px;height: 900px;">
							<!-- Modal content-->
								<div class="modal-content">
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
					<div class="container" style="width: 100px; display:inline ;">
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
								    	<table>
								    		<tr>
								 				<th>요일 을적어주세요|ex.)평일,토요일,일요일,휴무일 </th>
								    			<td>
							    					<input type="text" id="usetime_day" placeholder="작성해주세요~">
								    			</td>
								    		</tr>
								    		<tr>
								    			<th>시간을적어주세요 ex)00:00~00:00</th>
								    			<td>
								    				<input type="text" id="usetime_time" placeholder="작성해주세요~">
								    			</td>
								    		</tr>
								    		<tr>
								    			<td colspan="2" align="right">
								    				<button type="button" id="btnUsetime_insert">이용시간 등록!</button>
							    				</td>
								    		</tr>
								    	</table>
								    	<table>
								    		<tr>
								    			<th>적용코인갯수</th>
								    			<td>
								    			<input type="text" id="content_coin" placeholder="작성해주세요">
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
								    			<td colspan="7">
								    				<button type="button" id="btnContent_insert">컨텐츠 등록!</button>
							    				</td>
								    		</tr>
								    	</table>
								    	<hr>
							    		<!-- 기존업체 컨텐츠 등록 --> 
								    	 <p>기존 업체 컨탠츠 등록 폼</p>
								    	 <input type="text" id="oldcompany_co_idx"placeholder="전화번호입력해주세요">
								    	 <table>
								    	 	<tr>
								    	 	 	<td>코인</td>
								    	 	 	<td>
								    	 	 		<input type="text" id="con_coin">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 	 	<td>컨텐츠1번</td>
								    	 	 	<td>
								    	 	 		<input type="text" id="con_con1">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 	 	<td>컨텐츠2번</td>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con2">
								    	 	 	</td>
								    	 	</tr>
											<tr>
								    	 	 	<td>컨텐츠3번</td>
								    	 	 	<td>
								    	 	 		<input type="text" id="con_con3">
								    	 	 	</td>
								    	 	</tr>
											<tr>
								    	 	 	<td>컨텐츠4번</td>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con4">
								    	 	 	</td>
								    	 	</tr>
											<tr>
								    	 	 	<td>컨텐츠5번</td>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con5">
								    	 	 	</td>
								    	 	</tr>
								    	 	<tr>
								    	 	 	<td>컨텐츠6번</td>
								    	 	 	<td>
									    	 	 	<input type="text" id="con_con6">
								    	 	 	</td>
								    	 	</tr>
								    	 </table>
								    	 <button type="button" id="btnOldCompany">등록하기</button>
								 	</div>
								 	<div class="modal-footer"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- 업체리스트 나열 테이블  -->	 
					<span>등록된 업체 나열 </span>
						<table border="1" class="table table-striped table-bordered table-hover"> <!-- class="table table-bordered"  -->
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
								<div class="modal-content">
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
<!-- Bootstrap and necessary plugins -->
<!-- <script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/tether/dist/js/tether.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/pace/pace.min.js"></script>
GenesisUI main scripts
<script src="resources/js/app.js"></script> -->
</body>
</html>