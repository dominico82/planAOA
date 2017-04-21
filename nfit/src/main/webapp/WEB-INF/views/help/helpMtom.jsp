<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <button type="button" class="btn btn-default" onclick="open_form();">문의하기</button>
                
              </p>
            </div><!-- /.applyBoxWrap -->
          </div>
          
          <h3>문의 내역</h3>
          <div class="accordionList">              
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

              <div class="panel panel-default">

                <div class="panel-heading" role="tab" id="qaHeading1">

                  <h4 class="panel-title">
                    <strong class="faqType faqType_18">단순이용문의</strong>
                    <i class="fa fa-question-circle"></i> 멤버십관련 문의드립니다.
                    <span class="date">2017-04-20 16:51</span>
                  </h4>
                  <a role="button" data-toggle="collapse" data-parent="#accordion" href="#qa_185757" aria-expanded="true" aria-controls="qa2" class="btn btn-sm btn-success btnAnswer">답변보기</a>
                </div>
                <div id="qa_185757" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">
                  <div class="panel-body">
                    
                    <div class="question">

                      <h5><i class="fa fa-question-circle"></i> 멤버십관련 문의드립니다. <small>2017-04-20 16:51</small></h5>

                      <p>
                        최소결제금액이 3만원정도인데 한번 체험해볼 수 있도록 더 저렴한요금제를 이용해볼 수 있는 방법은 없는건가요?
                      </p>
                    </div><!-- /.question -->
                    <div class="answer">
                      <p>
                        </p><h5><i class="fa fa-check-circle"></i> 답변 <small>2017-04-20 17:02</small></h5>
                      <p></p>
                      <p>
                        안녕하세요 <b>강수석</b> 회원님<br>저희 티엘엑스를 이용해주셔서 대단히 감사합니다.<br>
</p><div><br></div>
<div>7패스 29990원 보다 저렴한 멤버십은 현재 없는 점 양해 바랍니다 : )</div>
<div><br></div>
<div>말씀 남겨주신 내용은 관련부서로 전달하여 추후 체험용으로 이용 가능한 멤버십 개편에 대해 논의 할 수 있도록</div>
<div>하겠으며~</div>
<div><br></div>
<div>친구 초대로 가입 시 무료 패스 지급 되고 있으나(1패스 센터에서 무료 이용 가능)</div>
<div><br></div>
<div>3/17일 성원준 회원님의 초대로 가입 당시<br></div>
<div>지급 되었던 무료 이용권 7일 : &nbsp;1패스는 기간 만료로 자동 소멸 되었습니다.</div>
<div><br></div>
<div>때문에 문의 해주신 계정으로 센터 이용은 멤버십 결제 하에만 가능한 점 참고 부탁드리며</div>
<div>센터마다 차감되는 포인트가 다르오니 주변제휴센터찾기에서 이용 원하는 센터 정보 검색 후 결제 및 이용 바랍니다!<br><br>문의주신 내용에 대해 도움 되셨길 바라며<br> 추가적인 문의가 있을 경우 언제든지 다시 <a href="tlx.co.kr/mypage/query/">1:1 문의</a>를 이용하여 주시기 바랍니다 <br> 오늘 하루도 즐겁고 활기찬 하루 되시길 바랍니다. <br> 저는 티엘엑스 고객지원센터 <b>한유은</b> 이었습니다. 감사합니다.<br></div>
                      <p></p>
                    </div><!-- /.answer -->
                   
                  </div><!-- /.panel-body -->
                </div><!-- /.panel-collapse  -->
              </div><!-- /.panel-->
            </div><!-- /.panel-group -->
          </div><!-- /.accordionFaq -->   
        </div><!-- /.qaListWrap -->
        
 
          

      </div> <!-- /.content -->
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
        <form name="form_qa11" action="helpMtom.do" method="post">
        <input type="hidden" name="member_id" value="">
          <fieldset>
            <div class="form-group">
              <label>제목</label>
              <input type="text" name="title" class="form-control" id="title" required="">
            </div>
            <div class="form-group">
              <label>내용</label>
              <textarea rows="5" name="cont" class="form-control" id="cont" placeholder="어플리케이션 오류일 경우 앱버전과 상황을 자세히 입력하면 도움이 될 수 있습니다." required=""></textarea>
            </div>            
        </fieldset>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">저장하기</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

<script>
function open_form(){
	$(document).ready(function(){
		document.getElementById("title").value = "";
        document.getElementById("cont").value = "";
		$('#qa11').modal();
	});
};
</script>

</div><!-- /.wrap -->

<%@include file="../footer.jsp" %>
</body>
</html>