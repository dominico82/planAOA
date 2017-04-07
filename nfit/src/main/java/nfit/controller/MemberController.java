package nfit.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value="memberLogin.do",method=RequestMethod.GET)
	public String loginForm(){
		return "member/memberLoginForm";
	}
	@RequestMapping(value="memberLogin.do",method=RequestMethod.POST)
	public ModelAndView login(MemberDTO dto, HttpSession session,HttpServletRequest req,HttpServletResponse resp,
			@RequestParam(value="saveid",required=false)String save,
			@RequestParam(value="member_id",required=false)String id,
			@RequestParam(value="member_pwd",required=false)String pwd){
		String member_id=id;
		String member_pwd=pwd;
		String saveid=save;
		session=req.getSession();
		ModelAndView mav=new ModelAndView();
		int result=memberDao.loginCheck(member_id,member_pwd);
		String msg="";
		String goPage="";
		if(result==MemberDAOImple.LOGIN_OK){
			//String username=memberDao.getUserInfo(member_id);
			session.setAttribute("saveid", member_id);
			//session.setAttribute("member_name", username);
			msg=member_id+"님 환영합니다";
			goPage="member/memberMsg";
			/*if(saveid==null||saveid.equals("")){
				Cookie ck=new Cookie("saveid",member_id);
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else{
				Cookie ck=new Cookie("saveid",member_id);
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}*/
		}else if(result==MemberDAOImple.NOT_ID){
			msg="아이디가 잘못되었습니다.";
			goPage="/member/memberLogin.do";
		}else if(result==MemberDAOImple.NOT_PWD){
			msg="비밀번호를 잘못입력하셨습니다.";
			goPage="/member/memberLogin.do";
		}else if(result==MemberDAOImple.ERROR){
			msg="고객센터 연락바람";
			goPage="/member/memberLogin.do";
		}
		mav.addObject("msg",msg);
		mav.setViewName(goPage);
		return mav;
	}

	public ModelAndView logoutForm(HttpServletRequest req){
		HttpSession session=req.getSession();
		ModelAndView mav=new ModelAndView();
		session.invalidate();
		String msg="";
		msg="로그아웃이 완료되었습니다.";
		mav.addObject("msg",msg);
		mav.setViewName("/member/memberMsg");
		return mav;
	}
		
}
