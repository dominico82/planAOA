<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2017/0423 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 다음우편주소서비스 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음지도api주소 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1dc7234b3e38c0fbbc3c82f768f6a747&libraries=services"></script>
<!-- 아이콘링크 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/co_list.css">
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
<!-- w3 css -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
		/* json형식으로 받은 데이터를 bar타입의 차트로 표현해준다. */
		var chart = new google.visualization.LineChart(document.getElementById('chart_div')); //BarChart
		chart.draw(data, {
			title : '업체 누적 이용수',		
			width : 900,
			height : 700,
			bar:{
				groupWidth:'20%'
			},
			legend : {
				position : 'none'
			}
		});
	}
	/* PieChatomcat 8 context path 설정rt 도가능  */
	//주소찾기
	  function execDaumPostcode() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var	fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                //주소료 좌표찾기 
				geocoderaddr(fullRoadAddr);
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
/*                 document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
 */                document.getElementById('roadAddress').value = fullRoadAddr;
                	document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
           /*      if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                } */
            }
        }).open();
    }
	function geocoderaddr(fullRoadAddr){
        /* 주소로좌표찾기 */
        var geocoder = new daum.maps.services.Geocoder();
        geocoder.addr2coord(fullRoadAddr,function(status,result){
        	
        	if(status === daum.maps.services.Status.OK){
        		var lat = result.addr[0].lat;
        		var lng = result.addr[0].lng;
        	
        		document.getElementById('co_lat').value= lat;
        		document.getElementById('co_lng').value = lng;
        	}
        });
	}
</script>
<script>
$(document).ready(function(){
		$('#modal-testNew').draggable({
			handle:'.modal-header'
		});
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
			var co_lat = $('#co_lat').val(); //위도
			var co_lng = $('#co_lng').val();//경도
			var co_name =document.getElementById('co_name').value;
			var co_address =document.getElementById('roadAddress').value;
		 	var co_avail = document.getElementById('co_avail').value;
		 	var co_extra = document.getElementById('co_extra').value;
		 	var co_regul = document.getElementById('co_regul').value;
		 	var co_phone = document.getElementById('co_phone').value;
			//ajax로 전달할  폼 객체 
			var formData=new FormData();
			//폼 객체에 파일 추가 , append ('변수명',값)
			
			var arr=[];
			for(var i =0;i<files.length;i++){
				var file=files[i];
			formData.append('files' ,file);//파일 배열 담는곳
			}
			formData.append('co_lat' , co_lat);
			formData.append('co_lng' , co_lng);
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
	//input text 에 검색어 입력시 목록 보여주는 함수
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
				//json타입으로 받아온 객체 안에 json배열 map함수를 이용하여 값으 리턴해준다.
				success : function(data){
						response($.map(data.data,function(result){
							return {
								label :result.co_list,
								value :result.co_list
							}
					}));
						//이상한 안내문구 안보이게하기
						$('.ui-helper-hidden-accessible').css('display','none');
						$('.ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all').css('width','150px');
						$('.ui-autocomplete ui-front ui-menu ui-widget ui-widget-content ui-corner-all').css('border','1px solid black');
				}
			});
 		},
 		//첫번째 검색어가 input text 에 올라가게 해준다.
 		selectFirst:true
 	});
});
</script>
<style>
.checkbox input[type=checkbox]{
position: inherit;
}
.modal{
 overflow: hidden;
}

.modal-dialog{
 margin-right: 0;
 margin-left: 0;
}
/* 자동완성검색어 색상 */
a#ui-id-16.ui-corner-all{
color:black;
}
button[type=submit]{
border:2px double;
border-radius: 50%;
}
</style>
</head>
<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
<!-- 업체목록 List에담긴것  -->
<c:set var="list" value="${list}"/>
<header>
	<jsp:include page="../../header.jsp"/>
</header>
<div>
	<!-- 경로에 이미지업로드 나오는지확인해봄 -->
	<img alt="" src="#" style="display: none;" ><!-- style="display: none;" -->
</div>
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
       <div class="title"> <!-- style="margin-top: 15px; margin-left: 35px;" -->
			<img src="resources/img/favicon.png" style="height: 65px;"> 
			<a href="co_list.do" style="font-family:'Nanum Pen Script' serif;">제휴업체 등록/삭제 페이지</a>
		</div>
            <div>
				<!-- 내용들어갈곳 -->
				<div>
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
					<div class="container" style="width: 10%;display:inline-table;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin-right: 10px;"><i class="fa fa-plus-square" style="font-size:30px" ></i></button>
					  <!-- Modal -->
					  	<div class="modal fade" id="myModal" role="dialog">
					   	 	<div class="modal-dialog" style="width:1200px;height: 700px;">
					      	<!-- Modal content-->
					      		<div class="modal-content" style="width: 800px;">
					        		<div class="modal-header">
					          			<button type="button" class="close" data-dismiss="modal">&times;</button>
					          			<h4 class="modal-title">업체등록</h4>
					        		</div>
					        		<!-- 모달 body  -->
					        		<div class="modal-body" style="margin:10px;">
					          			<form action="chart.do" name="company_add" method="post" enctype="multipart/form-data"id="form1" target="iframe1"  role="form" >
										  	<label for="inputText3" class="col-sm-2 control-label">업체명</label>
													<input type="text" class="form-control" name="co_name" id="co_name">  			
										 			<!-- daum  우편주소이용 -->
										  	<label for="inputText3" class="col-sm-2 control-label">주소</label>
										 		 	<button type="button" onclick="execDaumPostcode()"><i class="material-icons" style="font-size:25px;">search</i></button>
													<input type="text" class="form-control" name="co_address" id="roadAddress" readonly="readonly">  	
													<!-- 위도 -->
													<input type="text" class="form-control" id="co_lat">		
													<!-- 경도 -->
													<input type="text" class="form-control" id="co_lng">		
														<label>업체 종목</label>
														<br><br>
												   		 	<input type="checkbox" name="co_class2" value="1" class="w3-check"><label>헬스</label>
													   		 <input type="checkbox" name="co_class2" value="2" class="w3-check"><label>뷰티</label> 
													   		 <input type="checkbox" name="co_class2" value="3" class="w3-check"><label>필라테스</label>
													   		 <input type="checkbox" name="co_class2" value="4" class="w3-check"><label>탁구</label>
													   		 <input type="checkbox" name="co_class2" value="5" class="w3-check"><label>복싱</label>
													   		 <input type="checkbox" name="co_class2" value="6" class="w3-check"><label>검도</label>
													   		 <input type="checkbox" name="co_class2" value="7" class="w3-check"><label>격투기</label>
													   		 <input type="checkbox" name="co_class2" value="8" class="w3-check"><label>크로스핏</label>
													   		 <input type="checkbox" name="co_class2" value="9" class="w3-check"><label>골프</label>
													   		 <input type="checkbox" name="co_class2" value="10" class="w3-check"><label>기타</label>
												   		<br>
												   		<br>
											  	<label for="inputText3" class="col-sm-2 control-label">업체전화번호</label>
														<input type="text" class="form-control" name="co_phone" id="co_phone">  			
										  		<label for="inputText3" class="col-sm-2 control-label">이용규정및  &nbsp;&nbsp;&nbsp;준비물</label>
														<textarea rows="5" cols="20"class="form-control" name="co_regul" placeholder="문단구분 '|'를 넣어주세요" id="co_regul"></textarea>
										  		<label for="inputText3" class="col-sm-2 control-label">부가서비스</label>
														<textarea rows="5" cols="20"class="form-control" name="co_extra" placeholder="문단구분 '|'를 넣어주세요" id="co_extra"></textarea>
										  	
										  		<label for="inputText3" class="col-sm-2 control-label">이용가능</label>
														<textarea rows="5" cols="20"class="form-control" name="co_avail" placeholder="문단구분 '|'를 넣어주세요" id="co_avail"></textarea>
										  	 	<div class="col-sm-5">
										  	 	<b>사진은 마지막에 넣어주세요 ~</b>
										  		</div>
										  		<label for="inputText3" class="col-sm-5 control-label">업체사진업로드</label>
														<div class="filedropDown" style="width: 300px;height: 300px; border: 2px solid black;"></div>
										</form>
					        		</div>
					      		</div>
					    	</div>
					  	</div>
					</div>
					<!-- 차트를 넣을 모달 적용 -->
					<div class="container" style="width: 10%; display:inline-table;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"><i class="fa fa-bar-chart" style="font-size:30px"></i></button>
					  <!-- Modal -->
						<div class="modal fade" id="myModal2" role="dialog">
							<div class="modal-dialog">
							<!-- Modal content-->
								<div class="modal-content" style="width:1000px;height: 900px;">
								  <div class="modal-header">
								    <button type="button" class="close" data-dismiss="modal">&times;</button>
								    <h4 class="modal-title">누적차트표</h4>
								  </div>
								  <div class="modal-body">
								    <div id="chart_div">
										<!-- 차트새로고침버튼 -->
									</div>
								 </div>
								      <div class="modal-footer">
										<button type="button" onclick="drawChart()" id="btn" class="btn btn-default">refresh</button>
								        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								 	 </div>
								</div>
							</div>
						</div>
					</div>
					<!-- 이용시간및 컨탠츠 등록  -->
					<div class="container" style="width: 10%; display:inline ;">
					  <!-- Trigger the modal with a button -->
					  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal3"><i class="fa fa-plus-square-o" style="font-size: 30px;"></i></button>
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
								    			<td colspan="7" align="right" class="w3-bar">
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
							 <input type="text" name="keyfield" id="keyField" >
					    	<button type="submit">
					    	<i class="material-icons" style="font-size:25px;">search</i>
					    	</button> 
					    	<!--  <input type="submit" value="조회"> -->
					    	 <!-- 키워드목록표출 -->
					    	 <div id="div1"></div>
				</form>
					<!-- 업체리스트 나열 테이블  -->	 
						<table class="w3-table-all"> <!-- class="table table-bordered"  -->
								<thead>
										<tr class="w3-blue">
											<th>업체 번호(수정)</th>
											<th>업체 이름</th>
											<th>업체 주소</th>
											<th>업체 종목</th>
											<th>업체 연락쳐</th>
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
												<td><a data-toggle="modal"href="co_update.do?co_idx=${vo.co_idx}" data-target="#modal-testNew" role="button" data-backdrop="static"><span class="btn btn-primary">${vo.co_idx}</span></a></td>
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
								<div class="modal-content" style="width:1323px;" id="modal-content">
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