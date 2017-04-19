package nfit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nfit.member.model.MemberDAO;
import nfit.member.model.MemberDTO;

@Controller
public class AdminController {

	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/adminPage.do")
	public String AdminForm(){
		return "admin/main";
	}
	@RequestMapping("/memberAdmin.do")
	public ModelAndView memberAdmin(){
		List<MemberDTO> list=memberDao.memberList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberList",list);
		mav.setViewName("admin/member");
		return mav;
	}
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
