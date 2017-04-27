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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/help.css" rel="stylesheet" type="text/css">
<link href="resources/css/notice.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<jsp:include page="../header.jsp"/>
<style>
a{
	text-align: right;
}
</style>
<script>
$(document).ready(function(){
	mtomReload();
});
</script>
</head>
<body>

<div class="wrap">

    <div class="container">
    <div class="row">
      <div class="content col-md-12">    
        <div class="page-header">
        
		<br><br><br>
          <h2>1:1 문의
            <small>
            이용하시면서 불편한 사항 개선점이 있다면 알려주세요.<br>
            확인 및 처리 후 메일로 안내 드리겠습니다. 영업일 기준 최대 3일 내 처리될 예정입니다.
            </small>
          </h2>
        </div>
        
        <div class="qaListWrap">
          <div class="row">
            <div class="applyBoxWrap col-sm-8">
              <p>
                <!--
                <button type="button" class="btn btn-default" data-toggle="collapse" data-target="#applyBox" aria-expanded="false" aria-controls="applyBox">문의 접수하기</button>
                -->
                <button type="button" class="btn btn-success" onclick="open_form();">문의하기</button>
                
              </p>
            </div><!-- /.applyBoxWrap -->
          </div>
          
          <h3>문의 내역</h3>
          <div class="accordionList">              
			
          </div><!-- /.accordionFaq -->   
        </div><!-- /.qaListWrap -->
        
 
          

      </div> <!-- /.content -->
      	<div id="PAGE_NAVI"></div>
    </div><!-- /.row -->
  </div><!-- /container -->

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="qa11" style="display: none;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">1:1 문의하기</h4>
      </div>
      <div class="modal-body">
        <form name="form_qa11" id="form_qa11" action="helpMtom.do" method="post">
        <input type="hidden" name="member_id" value="${member_id}">
          <fieldset>
            <div class="form-group">
              <label>제목</label>
              <input type="text" name="qa_subject" class="form-control" id="qa_subject" required="">
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea rows="5" name="qa_content" class="form-control" id="qa_content" placeholder="어플리케이션 오류일 경우 앱버전과 상황을 자세히 입력하면 도움이 될 수 있습니다." required=""></textarea>
            </div>            
        </fieldset>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="mtomWrite" class="btn btn-primary">저장하기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="qa11Update" style="display: none;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">1:1 문의하기</h4>
      </div>
      <div class="modal-body">
        <form name="form_qa11Update" id="form_qa11Update" action="helpMtomUpdate.do" method="post">
        <input type="hidden" id="qa_idx" name="qa_idx" value="">
          <fieldset>
            <div class="form-group">
              <label>제목</label>
              <input type="text" name="qa_subject" class="form-control" id="qa_subject_update" value="" required="">
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea rows="5" name="qa_content" class="form-control" id="qa_content_update" placeholder="어플리케이션 오류일 경우 앱버전과 상황을 자세히 입력하면 도움이 될 수 있습니다." required=""></textarea>
            </div>            
        </fieldset>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="mtomUpdate" class="btn btn-primary">수정하기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

<script>
function open_form(){
	$(document).ready(function(){
		document.getElementById("qa_subject").value = "";
        document.getElementById("qa_content").value = "";
		$('#qa11').modal();
	});
};

function update_form(idx){
	
	$(document).ready(function(){
		var subject=$('#qa_sub'+idx).text();
		var content=$('#qa_con'+idx).text();
		console.log(subject+', '+content+', '+idx);
		$('#qa_subject_update').attr("value", subject);
		$('#qa_idx').attr("value", idx);
		$('#qa_content_update').empty();
		$('#qa_content_update').append(content);
		$('#qa11Update').modal();
	});
};
</script>
<script>
$(function(){
	$("#mtomWrite").click(function(){
		var formData=$("#form_qa11").serialize();
		
			$.ajax({
				type:"POST",
				url: "helpMtom.do",
				data: formData,
				success: function(data){
					$('#qa11').modal('hide');
					mtomReload();
				},
				error: function(data){
					alert("실패!!");
					$('#qa11').modal('hide');
				}
			});
	});
});

$(function(){
	$("#mtomUpdate").click(function(){
		var formData=$("#form_qa11Update").serialize();
		
			$.ajax({
				type:"POST",
				url: "helpMtomUpdate.do",
				data: formData,
				success: function(data){
					$('#qa11Update').modal('hide');
					mtomReload();
				},
				error: function(data){
					alert("실패!!");
					$('#qa11Update').modal('hide');
				}
			});
			
	});
});
var listNum=4;
var listSize;
function mtomReload(){
	$(document).ready(function(){
		console.log("mtomReload()함수 동작!!");
		$.ajax({
			type:"POST",
			url:"helpMtomRefresh.do",
			dataType:"JSON",
			success:function(data){
				$(".accordionList").empty();
				listSize=data.length;
				var moreList;
				
				console.log("목록 갯수: "+listSize);
				$.each(data, function(index, list){
					
					console.log("index:"+index);
					var qa_date=list.qa_date;
					var qa_adate=list.qa_adate;
					if(list.qa_checked=='n'){
						if(index=='0'){						
							$(document).ready(function(){
								var $div=$('<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">'
									   	+'<div class="panel panel-default">'
										+'<div class="panel-heading" role="tab" id="qaHeading1">'
										+'<h4 class="panel-title"><i class="fa fa-question-circle"></i>'+list.qa_subject+'&nbsp;&nbsp;'
						                +'<span class="date">'+qa_date+'</span></h4>'
						                +'<div style="text-align: right;"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#'+list.qa_idx+'" aria-expanded="false" aria-controls="qa1" class="btn btn-sm btn-default btnAnswer">답변대기</a></div>'
						                +'</div><div id="'+list.qa_idx+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">'
						                +'<div class="panel-body"><div class="question">'
										+'<h5><i class="fa fa-question-circle"></i> <div id="qa_sub'+list.qa_idx+'">'+list.qa_subject+'</div> <small>'+qa_date+'</small></h5>'
										+'<div id="qa_con'+list.qa_idx+'"><p>'+list.qa_content+'</p></div><!-- /.question --><div style="text-align: right;">'
						                +'<button type="button" class="btn btn-sm btn-default" onclick="update_form('+list.qa_idx+');"><i class="fa fa-edit"></i> 수정</button>'
						                +'<button type="button" class="btn btn-sm btn-danger" onclick="mtomDel('+list.qa_idx+');"><i class="fa fa-trash-o"></i> 삭제</button>'
						                +'</div></div><!-- /.panel-body --></div><!-- /.panel-collapse  --></div><!-- /.panel--></div><!-- /.panel-group -->'
						                );
	
								$("div.accordionList").append($div);
							});					
						}
						if(index!='0'){
							if(index>listNum){
								moreList="style='display: none;'";
							}else{
								moreList="style='display: block;'";
							}
							$(document).ready(function(){
								var $div=$('<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" '+moreList+'>'
									   	+'<div class="panel panel-default">'
										+'<div class="panel-heading" role="tab" id="qaHeading1">'
										+'<h4 class="panel-title"><i class="fa fa-question-circle"></i>'+list.qa_subject+'&nbsp;&nbsp;'
						                +'<span class="date">'+qa_date+'</span></h4>'
						                +'<div style="text-align: right;"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#'+list.qa_idx+'" aria-expanded="false" aria-controls="qa1" class="btn btn-sm btn-default btnAnswer">답변대기</a></div>'
						                +'</div><div id="'+list.qa_idx+'" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">'
						                +'<div class="panel-body"><div class="question">'
										+'<h5><i class="fa fa-question-circle"></i><div id="qa_sub'+list.qa_idx+'">'+list.qa_subject+'</div> <small>'+qa_date+'</small></h5>'
										+'<div id="qa_con'+list.qa_idx+'"><p>'+list.qa_content+'</p></div><!-- /.question --><div style="text-align: right;">'
						                +'<button type="button" class="btn btn-sm btn-default" onclick="update_form('+list.qa_idx+');"><i class="fa fa-edit"></i> 수정</button>'
						                +'<button type="button" class="btn btn-sm btn-danger" onclick="mtomDel('+list.qa_idx+');"><i class="fa fa-trash-o"></i> 삭제</button>'
						                +'</div></div><!-- /.panel-body --></div><!-- /.panel-collapse  --></div><!-- /.panel--></div><!-- /.panel-group -->'
						                );
	
								$("div.accordionList").find(".panel-group:last").append($div);
							});					
					
						}
					}	
					
					if(list.qa_checked=='y'){
						if(index=='0'){		
							
							$(document).ready(function(){
								var $div=$("<div class='panel-group' id='accordion' role='tablist' aria-multiselectable='true'>"
										+"<div class='panel panel-default'>"
										+"<div class='panel-heading' role='tab' id='qaHeading1'>"
										+"<h4 class='panel-title'><strong class='faqType faqType_18'></strong>"
										+"<i class='fa fa-question-circle'></i>"+list.qa_idx+""
							            +"<span class='date'>&nbsp;"+qa_date+"</span></h4>"
							            +"<div style='text-align: right;'><a role='button' data-toggle='collapse' data-parent='#accordion' href='#"+list.qa_idx+"' aria-expanded='false' aria-controls='qa2' class='btn btn-sm btn-success btnAnswer collapsed'>"
							            +"답변보기</a></div></div>"
							            +"<div id='"+list.qa_idx+"' class='panel-collapse collapse' role='tabpanel' aria-labelledby='headingOne' aria-expanded='false'>"
							            +"<div class='panel-body'>"    
							    		+"<div class='question'>"
								    	+"<h5><i class='fa fa-question-circle'></i>"+list.qa_subject+"<small>&nbsp;"+qa_date+"</small></h5>"
										+"<p>${qlist.qa_content}</p>"
							    		+"</div><!-- /.question -->"
							    		+"<div class='answer'>"
							      		+"<p></p><h5><i class='fa fa-check-circle'></i> 답변 <small>&nbsp;"+qa_adate+"</small></h5><p></p>"
							      		+"<p>"+list.qa_answer+"</p></div><!-- /.answer -->)"
							      		);
								$("div.accordionList").append($div);
							});
						}
						if(index!='0'){	
							if(index>listNum){
								moreList="style='display: none;'";
							}else{
								moreList="style='display: block;'";
							}
							$(document).ready(function(){
								var $div=$("<div class='panel-group' id='accordion' role='tablist' aria-multiselectable='true' "+moreList+">"
										+"<div class='panel panel-default'>"
										+"<div class='panel-heading' role='tab' id='qaHeading1'>"
										+"<h4 class='panel-title'><strong class='faqType faqType_18'></strong>"
										+"<i class='fa fa-question-circle'></i>"+list.qa_subject+""
							            +"<span class='date'>&nbsp;"+qa_date+"</span></h4>"
							            +"<div style='text-align: right;'><a role='button' data-toggle='collapse' data-parent='#accordion' href='#"+list.qa_idx+"' aria-expanded='false' aria-controls='qa2' class='btn btn-sm btn-success btnAnswer collapsed'>"
							            +"답변보기</a></div></div>"
							            +"<div id='"+list.qa_idx+"' class='panel-collapse collapse' role='tabpanel' aria-labelledby='headingOne' aria-expanded='false'>"
							            +"<div class='panel-body'>"    
							    		+"<div class='question'>"
								    	+"<h5><i class='fa fa-question-circle'></i>"+list.qa_subject+"<small>&nbsp;"+qa_date+"</small></h5>"
										+"<p>"+list.qa_content+"</p>"
							    		+"</div><!-- /.question -->"
							    		+"<div class='answer'>"
							      		+"<p></p><h5><i class='fa fa-check-circle'></i> 답변 <small>&nbsp;"+qa_adate+"</small></h5><p></p>"
							      		+"<p>"+list.qa_answer+"</p></div><!-- /.answer -->)"
							      		);
								$("div.accordionList").find(".panel-group:last").append($div);
							});
						}
					}
										
				});
				if(listSize>listNum){
					$(document).ready(function(){
						var $div=$('<div id="moreMtom" class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="text-align: center;">'
							   	
				                +'<a id="moreList" role="button" data-toggle="collapse" data-parent="#accordion" href="#" onclick="moreMtomList()" aria-expanded="false" aria-controls="qa1" class="btn btn-sm btn-info btnAnswer">더보기</a>'
				                +'</div><!-- /.panel-group -->'
				                );
						$("div.accordionList").append($div);
					});
		
				}else{
					$(document).ready(function(){
						var $div=$('<div id="moreMtom" class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="text-align: center;">'
							   	
				                +'<a id="moreList" role="button" data-toggle="collapse" data-parent="#accordion" href="#" onclick="resetMtomList()" aria-expanded="false" aria-controls="qa1" class="btn btn-sm btn-info btnAnswer">닫기</a>'
				                +'</div><!-- /.panel-group -->'
				                );
						$("div.accordionList").append($div);
					});
				}
				
			},
			error:function(xhr, status, error){
				alert("에러발생!");
			}
		});
	});
};

function moreMtomList(){
	if(listNum>=listSize){
		$("#moreMtom").remove();
	}
	listNum+=5;
	mtomReload();	
}

function resetMtomList(){
	if(listNum>=listSize){
		$("#resetMtom").remove();
	}
	listNum=4;
	mtomReload();	
}

function mtomDel(idx){
		console.log(idx);
	$.ajax({
		type:"POST",
		url: "helpMtomDel.do",
		data: "idx="+idx,
		success: function(data){
			mtomReload();
		},
		error: function(data){
			alert("실패!!");
		}
	});
		
};
</script>

</div><!-- /.wrap -->

<%@include file="../footer.jsp" %>
</body>
</html>