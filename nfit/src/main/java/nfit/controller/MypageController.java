package nfit.controller;

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
	
	@RequestMapping("memberInfo.do")
	public String memberInfo(){
		return "mypage/memberInfo";
	}
	
	@RequestMapping("modifyForm.do")
	public String modifyForm(){
		return "mypage/modifyForm";
	}
}