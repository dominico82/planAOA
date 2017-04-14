package nfit.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
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
import oracle.jdbc.OracleResultSetMetaData.SecurityAttribute;
import nfit.member.model.MemberDAOImple;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	@RequestMapping("/rule.do")
	public String rule(){
		return "member/rule";
	}
	
	@RequestMapping(value="/memberJoin.do",method=RequestMethod.GET)
	public String bbsWriteForm(){
		return "member/memberJoinForm";
	}
	
	@RequestMapping(value="/idCheckResult.do", method=RequestMethod.POST)
	public ModelAndView idCheckResult(@RequestParam(value="member_id")String member_id){
		String userid=member_id.trim();
		String result=memberDao.idCheck(userid);
		String msg=result.equals(userid)?"<div style='color: red;'>이미 사용중인 ID입니다!</div>":"<div style='color: blue;'>사용 가능한 ID입니다.</div>";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/userIdCheckResult");
		return mav;
	}
	
	@RequestMapping(value="/memberJoin.do",method=RequestMethod.POST)
	public ModelAndView bbsWrite(MemberDTO dto,
			@RequestParam(value="email1",required=false)String email1,
			@RequestParam(value="email2",required=false)String email2,
			@RequestParam(value="member_tall",required=false)int tall,
			@RequestParam(value="member_weight",required=false)int weight
			){
		String email=email1+"@"+email2;
		System.out.println(email);
		dto.setMember_email(email);
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
			String username=memberDao.getUserInfo(member_id);
			session.setAttribute("saveid", member_id);
			session.setAttribute("member_name", username);
			msg=username+"님 환영합니다";
			goPage="member/memberMsg";
			if(saveid==null||saveid.equals("")){
				Cookie ck=new Cookie("saveid",member_id);
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else{
				Cookie ck=new Cookie("saveid",member_id);
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
		}else if(result==MemberDAOImple.NOT_ID){
			msg="아이디가 잘못되었습니다.";
			goPage="member/login_ok";
		}else if(result==MemberDAOImple.NOT_PWD){
			msg="비밀번호를 잘못입력하셨습니다.";
			goPage="member/login_ok";
		}else if(result==MemberDAOImple.ERROR){
			msg="고객센터 연락바람";
			goPage="member/login_ok";
		}
		mav.addObject("msg",msg);
		mav.setViewName(goPage);
		return mav;
	}
	@RequestMapping("/logout.do")
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
	@RequestMapping("/memberFind.do")
	public String memberFind(){
	return "member/memberFind";
	}
	@RequestMapping("memberFindId.do")
	public ModelAndView memberIdFind(MemberDTO dto,
			@RequestParam(value="member_name",required=false)String name,
			@RequestParam(value="email1",required=false)String email1,
			@RequestParam(value="email2",required=false)String email2){
		String member_email=email1+"@"+email2;
		String member_name=name;
		ModelAndView mav=new ModelAndView();
		String result=memberDao.memberIdFind(member_name,member_email);
		String msg=result;
		mav.addObject("msg", msg);
		mav.setViewName("/member/memberFindMsg");
		return mav;
	}
	
	@RequestMapping("memberPwdFind.do")
	public ModelAndView memberPwdFind(MemberDTO dto,
			@RequestParam(value="member_id",required=false)String id,
			@RequestParam(value="member_name",required=false)String name,
			@RequestParam(value="email1",required=false)String email1,
			@RequestParam(value="email2",required=false)String email2){
		String member_id=id;
		String member_email=email1+"@"+email2;
		String member_name=name;
		ModelAndView mav=new ModelAndView();
		String result=memberDao.membmerPwdFind(member_id,member_name,member_email);
		String msg=result;
		mav.addObject("msg",msg);
		mav.setViewName("/member/memberFindMsg");
		return mav;
	}
}
