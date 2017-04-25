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
	$('#usetimeBtn').click(function(){
		var arr1 = new Array(); //idx;
		var arr2 = [];//day
		var arr3 = [];//time 담을 배열
		for(var i =0;i<4;i++){
				//각각의 idx값 
			 var usetime_idx =document.getElementById('usetime_idx'+i).value;
				//arr배열에 idx값 넣기 
				arr1.push(usetime_idx);
				console.log(arr1[i]);
				//각각의 시간
			var  usetime_time = document.getElementById('usetime_time'+i).value;
				arr3.push(usetime_time);
				console.log(arr3[i]);
		}
		/* data = {'arr1':arr1,'arr3':arr3}; */
		//배열 넘겻을때 한글 인코딩
		$.ajaxSettings.traditional = true;
		$.ajax({
			type : 'post',
			url : 'usetimeupdate.do',
			data : {'arr1' : arr1,
		            'arr3' : arr3
 			},
			dataType:'text',
			success : function(result){
				if(result =='success'){
					alert('수정성공입니다.');
					usetime_table_list();
				}
			}
		});
	});
	$('#usetimeBtndelete').click(function(){
			var usetime_co_idx = $('#usetime_co_idx').val();
			var param= 'usetime_co_idx='+usetime_co_idx;
			$.ajax({
				type : 'post',
				url : 'usetime_delete.do',
				data :param,
				success : function(result){
					if(result =='success'){
						alert('삭제성공');
						usetime_table_list();
					}
				}
			});
	});
});
</script>
<style>
.form_control{
width: 300px;
}
</style>
</head>
<body>
<c:set var="usetime_co_idx1" value="${usetime_co_idx}"/>
<input type="hidden" value="${usetime_co_idx1}" id="usetime_co_idx">
<c:set var="list" value="${list}"/>
	<table border="1">
		<tr>
			<th>요일</th>
			<th>시간</th>
		</tr>
			<c:if test="${empty list}">
				<tr>
					<th>이용시간 이 없습니다.</th>
				</tr>
			</c:if>
		<c:forEach var="vo" items="${list}" varStatus="status">
			<tr>
				<td>
					<input type="hidden" value="${vo.usetime_idx}" id="usetime_idx${status.index}">
					<input  id="usetime_day${status.index}" type="text" value="${vo.usetime_day}" readonly="readonly">
				</td>
				<td>
					<input  id="usetime_time${status.index}"type="text" value="${vo.usetime_time}">
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2">
				<button type="button" id="usetimeBtn">수정버튼</button>
				<button type="button" id="usetimeBtndelete">삭제버튼</button>
			</td>
		</tr>
	</table>
</body>
</html>