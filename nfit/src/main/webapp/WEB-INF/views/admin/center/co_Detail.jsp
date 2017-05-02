<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
.thumbnail{
margin:10px;
width: 150px;
height: 150px;
background-size: cover;
background-repeat:no-repeat;
background-position: center center;
border: 2px solid black;
}
.thumbnail.circle{
border-radius: 100%;
}
</style>
<script>
$(document).ready(function(){
	//이용시간 테이블 리스트
	usetime_table_list();
	//업체별 컨텐츠 리스트
	content_list();
	//uploadedList  on('이벤트','자손태그','이벤트헨들러함수')
	//태그.attr('속성')
	$('.uploadedList').on('click','span',function(event){
		var that = $(this);//클릭한 span
		$.ajax({
			url:'deleteFile.do',
			type:'post',
			data : {fileName:$(this).attr('data-src')},
			dataType:'text',
			success : function(result){
				if(result=='deleted'){
					//클릭한 span 태그 속한 div 제거
					alert('새로운파일을올리세요~');
					that.parent('div').remove();
				}
			}
		});
	});
	//클래스가 fileDrop 인태그
	//이벤트 효과 2개넣기 
	$('.fileDrop').on('dragenter dragover' , function(event){
		event.preventDefault();//기본 효과를 막음
	});
	//이벤트 효과 1개 넣기
	$('.fileDrop').on('drop',function(event){
		//기본 효과막음
		event.preventDefault();
		//드래그된 파일정보
		var files= event.originalEvent.dataTransfer.files;
		//폼객체 생성
		var formData=new FormData();
		
		for(var i=0;i<files.length;i++){
		//파일 들 저장할 변수
			var	file =files[i];
			formData.append('files',file);
		}
		//idx값
		var co_idx=$('#co_idx').val();
		//ajax로 전달할  폼 객체 
		//폼 객체에 파일 추가 , append ('변수명',값)
		formData.append('co_idx',co_idx);
		//processData : false => post 방식
		//contentType : false => multipart/form-data
		var arr={};
		$.ajax({
			type : 'post',
			url : 'ajaxUpload.do',
			data : formData,
			dataType :'json',
			processData : false,
			contentType: false,
			success : function(data){
				console.log('콘솔에서찍은 data::'+data.length);
				console.log(data[0]);
				var str='';
				for(var i=0;i<data.length;i++){
					if(checkImageType(data[i])){//이미지파일인경우
							str ='<div style="border:1px solid white;float:left;"><a href="displayFile.do?fileName='+getImageLink(data[i])+'">';		
							str+='<img class="thumbnail circle"src="displayFile.do?fileName='+data[i]+'"></a>';
							str+='<span data-src='+data[i]+'>[삭제]</span></div>';
							$('.uploadedList').append(str);
					}
				}
			}
			
		});
	});
	
	//수정버튼 클릭시 실행되는 ajax 
	$('#btnUpdate').click(function(){
		var co_class=$('#co_class_1').val();
		var co_idx = $('#co_idx').val();
		var co_name = document.getElementById('co_name_1').value;
		var co_address = $('#co_address_1').val();
		var co_phone = $('#co_phone_1').val();
		var co_avail = $('#co_avail_1').val();
		var co_extra = $('#co_extra_1').val();
		var co_regul = $('#co_regul_1').val();
		
		$.ajax({
			type:'post',
			url:'centerUpdate.do',
			headers :{
				'Content-Type':'application/json'
			},
			data:JSON.stringify({
				co_name : co_name,
				co_idx : co_idx,
				co_class : co_class,
				co_address:co_address,
				co_avail:co_avail,
				co_phone:co_phone,
				co_extra:co_extra,
				co_regul:co_regul
			}),
			dataType:'text',
			success : function(result){
				if(result =='success'){
					alert('수정이완료되었습니다.');
					window.location.reload();
				}
			}
		});	
	});
	//삭제버튼 클릭시 실행되는 ajax 
	$('#btnDelete').click(function(){
		var co_idx=$('#co_idx').val();
		console.log('btnDelete에서찍은 co_idx::::::'+co_idx);
		var param ='co_idx='+co_idx;
		if(confirm('정말 삭제하시겟습니까 ?')==true){
			$.ajax({
				type :'post',
				url : 'co_listdelete.do',
				data : param,
				success : function(result){
					if(result == 'success'){
						alert('삭제되었습니다.');
						window.location.reload();
					}
				}
			});
		}else{
			alert('취소되었습니다.');
			return;
		}
	});
});
function getImageLink(data){
	if(!checkImageType(data)){//이미지 형식이 아니면 
		return; // 함수종료
	}
	//이미지 파일이면 
	var end = data.substr(); // s_제거 (썸네일이면 s_가 붙여짐)
	return end;
}
function checkImageType(data){
	// i : ignore case ( 대소문자 무관)
	var pattern = /jpg|gif|png|jpeg/i; //정규식표현
	return data.match(pattern);// 규칙에 맞으면 true
}
//이용시간 테이블목록뽑기
function usetime_table_list(){
	var co_idx=$('#co_idx').val();
	var param = 'co_idx='+co_idx;
	$.ajax({
		type : 'get',
		url : 'usetime_table_list.do',
		data : param,
			success :  function(result){
			$('#usetime_table').html(result);
		}
	});
}
//업체별 컨텐츠 테이블 목록뽑기
function content_list(){
	var co_idx=$('#co_idx').val();
	var param = 'co_idx='+co_idx;
	$.ajax({
		type : 'get',
		url : 'content_list.do',
		data : param,
		success :  function(result){
			$('#content_list').html(result);
		}
	});
}
</script>
<style>
table{
float: left;
}
.fileDrop{
float: left; 
width: 30%;
height: 150px;
}
.modal-footer{
clear: both;
padding-right: 800px;
}
input#co_idx{
border:1px solid white;
}
</style>
</head>
<body>
<!-- 업체별 avail, extra , regul -->
<c:set var="co_list" value="${list}"/>
<!-- header -->
<div class="modal-header">
    <!-- 닫기(x) 버튼 -->
  <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">×</button>
  <!-- header title -->
  <h4 class="modal-title">Center UpDate</h4>
</div>
<!-- body -->
<form>

<div class="modal-body">
<div id="content_list"></div>
	<hr>
	<hr>
		<table class="type1">
			<tr>
				<th>업체번호</th>
				<td>
					<input type="text" readonly="readonly" value="${co_list.co_idx}" id="co_idx">
				</td>
			</tr>
			<tr>
				<th>업체이름</th>
				<td>
					<input type="text" value="${co_list.co_name}"size="50" id="co_name_1">
				</td>
			</tr>
			<tr>
				<th>업체주소</th>
				<td>
					<input type="text" value="${co_list.co_address}" size="50" id="co_address_1">
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="text" value="${co_list.co_phone}" size="50" id="co_phone_1">
				</td>
			</tr>
			<tr>
				<th>종목</th>
				<td>
					<input type="text" value="${co_list.co_class}" size="50" id="co_class_1">
				</td>
			</tr>
			<tr>
				<th>이용가능서비스</th>
				<td>
					<textarea rows="5" cols="50" placeholder="avail" id="co_avail_1">${co_list.co_avail}</textarea>
				</td>
			</tr>
			<tr>
				<th>부가서비스</th>
				<td>
					<textarea rows="5" cols="50" placeholder="extra" id="co_extra_1">${co_list.co_extra}</textarea> 		   
				</td>
			</tr>
			<tr>
				<th>이용 규정및 준비물</th>
				<td>
					<textarea rows="5" cols="50" placeholder="regul" id="co_regul_1">${co_list.co_regul}</textarea> 		   
				</td>
			</tr>
			<tr>
				<td colspan="3" class="w3-bar">
					<button type="button"  class="w3-bar-item w3-button w3-black" id="btnUpdate">UpDate</button>
					<button type="button" class="w3-bar-item w3-button w3-teal"   id="btnDelete">Delete</button>
				 	<button type="button" class="w3-bar-item w3-button w3-red" data-dismiss="modal">Close</button>
				</td>
			</tr>
		</table>
		<!-- 파일 업로드할 영역  -->
		<span>파일 수정 칸</span><br>
		<div class="fileDrop" style="border : 1px solid black;"><i 	class="fa fa-file-image-o"></i>파일을 드래그 해서 넣어주세요~</div>
		<!-- 파일 업로드한 리스트출력란 -->
		<div style="float: left;"class="uploadedList"></div>
		<!-- 업체별이용시간 목록 표출 -->
			<div id="usetime_table"> </div>
	  <!-- 업체별 컨텐츠 목록 표출   -->
		<!-- 	<div id="content_list"></div>  -->
</div>
<!-- Footer -->
<div class="modal-footer"></div>
</form>
</body>
</html>