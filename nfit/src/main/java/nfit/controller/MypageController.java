package nfit.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.member.model.MemberDAO;
import nfit.member.model.MemberDTO;
import nfit.member.model.MemberDAOImple;

@Controller
public class MypageController {
	
	@Autowired
	private MemberDAO memberDao;
	
	//마이페이지 이동
	@RequestMapping("memberInfo.do")
	public ModelAndView memberInfo(@RequestParam("member_id") String member_id){
		
		List<MemberDTO> info = memberDao.getMemberInfo(member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberInfo",info);
		mav.setViewName("mypage/modifyForm");
		return mav;
	}
}
