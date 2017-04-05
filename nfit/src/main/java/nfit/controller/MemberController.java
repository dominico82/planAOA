package nfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import nfit.member.model.MemberDAO;
import nfit.member.model.MemberDTO;
import nfit.member.model.MemberDAOImple;

@Controller
public class MemberController {

	private MemberDAO memberDao;
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public ModelAndView memberJoin(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/memberJoinForm");
		return mav;
	}
	
	public ModelAndView memberSubmit(MemberDTO dto){
		
	}
		
}
