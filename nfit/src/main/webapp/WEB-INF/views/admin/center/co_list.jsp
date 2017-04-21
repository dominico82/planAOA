<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
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
<style>
iframe{
 width: 0px;
 height: 0px;
 border: 0px;
}
</style>
</head>
<body>
<c:set var="list" value="${list}"/>

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

<!-- 부트스트랩 모달 -->
<div class="container" style="width: 100px;display:inline-block;">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-xs-5" data-toggle="modal" data-target="#myModal">업체등록</button>
  <!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
   	 	<div class="modal-dialog" style="width:900px;height: 700px;">
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
								<input type="text" class="form-control" name="co_name">  			
					  		</div>
					  </div> 
					  <div class="form-group">
					  	<label for="inputText3" class="col-sm-2 control-label">주소</label>
					  		<div class="col-sm-5">
								<input type="text" class="form-control" name="co_address">  			
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
									<input type="text" class="form-control"placeholder="text" name="co_phone">  			
						  		</div>
					  	</div>  
						<div class="form-group">
					  		<label for="inputText3" class="col-sm-2 control-label">이용규정및 준비물</label>
					  			<div class="col-sm-5">
									<textarea rows="5" cols="20"class="form-control" name="co_regul" placeholder="문단구분 '|'를 넣어주세요"></textarea>
					  			</div>
					  	</div>
					  	<div class="form-group">
					  		<label for="inputText3" class="col-sm-2 control-label">부가서비스</label>
					  			<div class="col-sm-5">
									<textarea rows="5" cols="20"class="form-control" name="co_extra" placeholder="문단구분 '|'를 넣어주세요"></textarea>
					  			</div>
					  	</div> 
					  	<div class="form-group">
					  		<label for="inputText3" class="col-sm-2 control-label">이용가능</label>
					  			<div class="col-sm-5">
									<textarea rows="5" cols="20"class="form-control" name="co_avail" placeholder="문단구분 '|'를 넣어주세요"></textarea>
					  			</div>
					  	</div> 
					  	<div class="form-group">
					  		<label for="inputText3" class="col-sm-2 control-label">업체사진업로드</label>
					  			<div class="col-sm-5">
									<input type="file" class="form-control" name="co_view2">
					  			</div>
					  	</div> 
					   	<div class="form-group"> 
					   		<div class="col-sm-offset-2 col-sm-5" align="right">
					    		<button type="submit" class="btn btn-default">Sign in</button>
					    		<button type="reset" class="btn btn-default">Reset</button> 
					    	</div> 
					   	</div>
					</form>
        		</div>
        		<!-- 모달 footer -->
        			<!-- hidden frame -->
					<iframe name="iframe1"></iframe>
					<script>
						function addFilePath(msg){
							alert(msg);
							document.getElementById('form1').reset();
						}
					</script>
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
<!-- 업체리스트 나열 테이블  -->	 
<table border="1" class="table table-striped table-bordered table-hover"> <!-- class="table table-bordered"  -->
	<caption>등록된 업체 나열 </caption>
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
</body>
</html>