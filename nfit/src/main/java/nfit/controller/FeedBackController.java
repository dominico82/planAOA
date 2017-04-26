package nfit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import nfit.feedback.model.FeedbackDAO;
import nfit.feedback.model.FeedbackDTO;

@Controller
public class FeedBackController {

	@Autowired
	FeedbackDAO feedbackDao;
	
	//페이지이동
	@RequestMapping("page.do")
	public String page(){
		return "center/feedback/companypage";
	}
	//댓글추가
	@RequestMapping("feedbackinsert.do")
	@ResponseBody
	public void feedbackinsert(@ModelAttribute FeedbackDTO vo){
		feedbackDao.feedbackinsert(vo);
	}
	//댓글 목록
	@RequestMapping("feedbacklist.do")
	public String feedbacklist(@RequestParam("co_idx")int co_idx,Map map){
		
		List<FeedbackDTO> flist=feedbackDao.feedbackList(co_idx);
		int count = feedbackDao.feedbackcount(co_idx);
		map.put("flist", flist);
		map.put("count",count );
		map.put("co_idx", co_idx);
		return "center/feedback/feedbackList";
	}
	//댓글 삭제
	@RequestMapping(value="feedbackdetail.do",method=RequestMethod.DELETE)
	public ResponseEntity<String> feedbackdetail(@RequestParam("feedback_index")int feedback_index){
		ResponseEntity<String> entity =null;
		try{
			feedbackDao.feedbackDelete(feedback_index);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//댓글 수정
	//REsponseEntity : 데이터 +http status code
	//@ResponseBody : 객체를 json 으로반환
	//@RequestBody : json 을객체로
	@RequestMapping(value="feedbackupdate.do",method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> feedbackupdate(@RequestParam("feedback_index")int feedback_index,@RequestBody FeedbackDTO dto){
		ResponseEntity<String> entity =null;
		try{
			dto.setFeedback_index(feedback_index);
			feedbackDao.feedbackUpdate(dto);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//댓를 상세보기 
	@RequestMapping(value="feedbackdetail.do",method=RequestMethod.GET)
	public String feedbackdetail(@RequestParam("feedback_index")int feedback_index,Map map){
		FeedbackDTO vo=feedbackDao.feebackDetail(feedback_index);
		map.put("vo", vo);
		return "center/feedback/feedbackdetaiil";
	}
	
	
	
}
