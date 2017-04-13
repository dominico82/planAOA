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
	
	//마이페이지 정보
	@RequestMapping("myPage.do")
	public ModelAndView myPage(HttpSession session){
		
		String userid = (String)session.getAttribute("saveid");
		
		MemberDTO dto = memberDao.getMemberInfo(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("mypage/myPage");
		return mav;
	}
	
	//회원정보 수정폼
	@RequestMapping("memberInfo.do")
	public ModelAndView memberInfo(HttpSession session){
		
		String userid = (String)session.getAttribute("saveid");
		
		MemberDTO dto = memberDao.getMemberInfo(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("mypage/modifyForm");
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value="modifyGo.do",method=RequestMethod.POST)
	public ModelAndView infoModify(MemberDTO dto){
		
		int result = memberDao.memberModify(dto);
		
		String msg = result>0?"정보수정 완료":"정보수정 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("mypage/modifyMsg");
		return mav;
	}
}

























