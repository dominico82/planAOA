package nfit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.member.model.MemberDAO;
import nfit.member.model.MemberDTO;

@Controller
public class AdminController {

	@Autowired MemberDAO memberDao;
	
	@RequestMapping("/adminPage.do")
	public String AdminForm(){
		return "admin/main";
	}
	@RequestMapping(value="memberAdmin.do")
	public ModelAndView memberAdmin(
			@RequestParam(value="cp",defaultValue="1")int cp){
		int totalCnt=memberDao.getTotalCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=20;
		int pageSize=5;
		List<MemberDTO> list=memberDao.memberList(cp,listSize);
		String pageStr=nfit.page.PageModule.makePage("memberAdmin.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberList",list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("admin/member");
		return mav;
	}
	/*@RequestMapping("/memberDeleteAdmin.do")
	public ModelAndView memberDeleteAdmin(
			@RequestParam(value="member_id") String id){
		String member_id=id;
		String result=
	}*/
	@RequestMapping("/cooperateAdmin.do")
	public String cooperAdmin(){
		return "admin/cooperate";
	}
	@RequestMapping("/coinAdmin.do")
	public String coinForm(){
		return "admin/coin";
	}
	@RequestMapping("/questionAdmin.do")
	public String questionAdmin(){
		return "admin/question";
	}
	@RequestMapping("/noticeAdmin.do")
	public String noticeForm(){
		return "admin/notice";
	}
}
