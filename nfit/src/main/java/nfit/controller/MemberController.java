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

	@Autowired
	private MemberDAO memberDao;
	@RequestMapping(value="/memberJoin.do",method=RequestMethod.GET)
	public String bbsWriteForm(){
		return "member/memberJoinForm";
	}
	@RequestMapping(value="/memberJoin.do",method=RequestMethod.POST)
	public ModelAndView bbsWrite(MemberDTO dto){
		int result=memberDao.memberJoin(dto);
		String msg=result>0?"회원가입완료":"회원가입 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("member/memberMsg");
		return mav;
	}

		
}
