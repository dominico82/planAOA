<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
$(document).ready(function(){
	$('#btncontentupdate').click(function(){
		var co_idxcount=$('#co_idx_count').val();
		console.log('스크립트에서본 : ::::'+co_idxcount+'개');
		var arr1=[]; //idx
		var arr2=[]; //coin
		var arr3=[]; //content1
		var arr4=[];//content2
		var arr5=[];//content3
		var arr6=[];//content4
		var arr7=[];//content5
		var arr8=[];//content6
		var arr9=[];
		for(var i=0;i<co_idxcount;i++){
			var content_idx = document.getElementById('content_idx'+i).value;
				console.log('스크립트에서본 : :::content_idx= '+content_idx);
				 arr1.push(content_idx);
			var content_coin = document.getElementById('content_coin'+i).value;
				arr2.push(content_coin);
			var content1 = document.getElementById('content1_'+i).value;
			var content2 = document.getElementById('content2_'+i).value;
			var content3 = document.getElementById('content3_'+i).value;
			var content4 = document.getElementById('content4_'+i).value;
			var content5 = document.getElementById('content5_'+i).value;
			var content6 = document.getElementById('content6_'+i).value;
			var co_idx=document.getElementById('co_idx'+i).value;
				arr3.push(content1);
				arr4.push(content2);
				arr5.push(content3);
				arr6.push(content4);
				arr7.push(content5);
				arr8.push(content6);
				arr9.push(co_idx);
		}
		//데이터값이 배열일 결우 써줘야하는것
		$.ajaxSettings.traditional = true;
		$.ajax({
			type : 'post',
			url : 'content_list_update.do',
			data : {
				'arr1': arr1,
				'arr2': arr2,
				'arr3': arr3,
				'arr4': arr4,
				'arr5': arr5,
				'arr6': arr6,
				'arr7': arr7,
				'arr8': arr8,
				'arr9': arr9
			},
			dataType: 'text',
			success : function(result){
				if(result == 'success'){
					alert('수정완료입니다.');	
					content_list();                       
				}
			}
		});
	});
	//삭제 버튼 누르면 실행 되는 ajax
	$('#btncontentdelete').click(function(){
		var content_co_idx = $('#content_co_idx').val();
		var param = 'content_co_idx='+content_co_idx;
		$.ajax({
			type :'post',
			data : param,
			url : 'content_delete.do',
			success : function(result){
				if(result =='success'){
						alert('삭제가 되었습니다.');
						content_list();
					}
				}
			});
		});
	
});
</script>
</head>
<body>
<c:set var="cnt" value="${count}"/>
<!-- 컨트롤러에서 보낸 idx  -->
<c:set var="idx" value="${co_idx}"/>
<!-- co_idx의총갯수  스크립트에서 for문에 넣을 조건식-->
<input type="hidden" value="${cnt}" id="co_idx_count">
<input type="hidden" value="${idx}" id="content_co_idx">
<c:set var="list" value="${list}"/>
<table border="1">
	<tr>
		<th>이용코인</th>
		<th>컨텐츠1</th>
		<th>컨텐츠2</th>
		<th>컨텐츠3</th>
		<th>컨텐츠4</th>
		<th>컨텐츠5</th>
		<th>컨텐츠6</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="7">등록된 컨텐츠가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="vo" items="${list}" varStatus="status">
	<tr>
		<td colspan="1">
			<input type="hidden" value="${vo.co_idx}" id="co_idx${status.index}">
			<input type="hidden" value="${vo.content_idx}" id="content_idx${status.index}">
			<input type="text"  value="${vo.content_coin}" id="content_coin${status.index}">
		</td>
		<td>
			<input type="text" value="${vo.content1}" id="content1_${status.index}">
		</td>
		<td>
			<input type="text" value="${vo.content2}" id="content2_${status.index}">
		</td>
		<td>
			<input type="text" value="${vo.content3}" id="content3_${status.index}">
		</td>
		<td>
			<input type="text" value="${vo.content4}" id="content4_${status.index}">
		</td>
		<td>
			<input type="text" value="${vo.content5}" id="content5_${status.index}">
		</td>
		<td>
			<input type="text" value="${vo.content6}" id="content6_${status.index}">
		</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="7">
			<button type="button" id="btncontentupdate">컨텐츠정보수정</button>
			<button type="button" id="btncontentdelete">컨텐츠정보삭제</button>
		</td>
	</tr>
</table>
</body>
</html>