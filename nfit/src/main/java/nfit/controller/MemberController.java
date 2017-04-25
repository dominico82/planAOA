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
	public String rule() {
		return "member/rule";
	}

	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.GET)
	public String bbsWriteForm() {
		return "member/memberJoinForm";
	}

	@RequestMapping(value = "/idCheckResult.do", method = RequestMethod.POST)
	public ModelAndView idCheckResult(@RequestParam(value = "member_id") String member_id) {
		String userid = member_id.trim();
		String result = memberDao.idCheck(userid);
		String msg = result.equals(userid) ? "<div style='color: red;'>이미 사용중인 ID입니다!</div>"
				: "<div style='color: blue;'>사용 가능한 ID입니다.</div>";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/userIdCheckResult");
		return mav;
	}

	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.POST)
	public ModelAndView bbsWrite(MemberDTO dto, @RequestParam(value = "email1", required = false) String email1,
			@RequestParam(value = "email2", required = false) String email2) {
		String email = email1 + "@" + email2;
		dto.setMember_email(email);
		int result = memberDao.memberJoin(dto);
		String msg = result > 0 ? "회원가입완료" : "회원가입 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/memberMsg");
		return mav;
	}

	@RequestMapping(value = "memberLogin.do", method = RequestMethod.GET)
	public String loginForm() {
		return "member/memberLoginForm";
	}

	@RequestMapping(value = "memberLogin.do", method = RequestMethod.POST)
	public ModelAndView login(MemberDTO dto, HttpSession session, HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(value = "saveid", required = false) String save,
			@RequestParam(value = "member_id", required = false) String id,
			@RequestParam(value = "member_pwd", required = false) String pwd) {
		String member_id = id;
		String member_pwd = pwd;
		String saveid = save;
		session = req.getSession();
		ModelAndView mav = new ModelAndView();
		int result = memberDao.loginCheck(member_id, member_pwd);
		String msg = "";
		String goPage = "";
		if (result == MemberDAOImple.LOGIN_OK) {
			String username = memberDao.getUserInfo(member_id);
			session.setAttribute("saveid", member_id);
			session.setAttribute("member_name", username);
			msg = username + "님 환영합니다";
			goPage = "member/memberMsg";
			if (saveid == null || saveid.equals("")) {
				Cookie ck = new Cookie("saveid", member_id);
				ck.setMaxAge(0);
				resp.addCookie(ck);
			} else {
				Cookie ck = new Cookie("saveid", member_id);
				ck.setMaxAge(60 * 60 * 24 * 30);
				resp.addCookie(ck);
			}
		} else if (result == MemberDAOImple.NOT_ID) {
			msg = "아이디가 잘못되었습니다.";
			goPage = "member/login_ok";
		} else if (result == MemberDAOImple.NOT_PWD) {
			msg = "비밀번호를 잘못입력하셨습니다.";
			goPage = "member/login_ok";
		} else if (result == MemberDAOImple.ERROR) {
			msg = "고객센터 연락바람";
			goPage = "member/login_ok";
		}
		mav.addObject("msg", msg);
		mav.setViewName(goPage);
		return mav;
	}

	@RequestMapping("/logout.do")
	public ModelAndView logoutForm(HttpServletRequest req) {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		String msg = "";
		msg = "로그아웃이 완료되었습니다.";
		mav.addObject("msg", msg);
		mav.setViewName("/member/memberMsg");
		return mav;
	}

	@RequestMapping("/memberFind.do")
	public String memberFind() {
		return "member/memberFind";
	}

	private void sendIdFind(String member_email, String result) {
		String host = "smtp.gmail.com";
		String subject = "ID/PassWord 찾기";
		String fromName = "Nfit";
		String from = "keokyo@gmail.com";
		String to1 = member_email;
		String content = "찾으시는 아이디는 [" + result + "] 입니다.";
		System.out.println(to1);
		System.out.println(result);

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("keokyo@gmail.com", "finalproject");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void sendPwdFind(String member_email, String result) {
		String host = "smtp.gmail.com";
		String subject = "ID/PassWord 찾기";
		String fromName = "Nfit";
		String from = "keokyo@gmail.com";
		String to1 = member_email;
		String content = "찾으시는 비밀번호는 [" + result + "] 입니다.";
		System.out.println(to1);
		System.out.println(result);

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("keokyo@gmail.com", "finalproject");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("memberFindId.do")
	public ModelAndView memberIdFind(MemberDTO dto, @RequestParam(value = "member_name", required = false) String name,
			@RequestParam(value = "email1", required = false) String email1,
			@RequestParam(value = "email2", required = false) String email2) {
		String member_email = email1 + "@" + email2;
		String member_name = name;
		ModelAndView mav = new ModelAndView();
		System.out.println(member_email+" "+member_name);
		String result = memberDao.memberIdFind(member_name, member_email);
		System.out.println(result);
		String msg = "";
		if (result=="email") {
			msg = "잘못된 이메일 입니다.";
			mav.setViewName("member/memberFindMsg");
			mav.addObject("msg", msg);
		} else if(result=="namemail"){
			msg = "이름과 이메일이 일치하지 않습니다.";
			mav.setViewName("member/memberFindMsg");
			mav.addObject("msg", msg);
			
		}else if(result=="name"){
			msg = "잘못 된 이름입니다.";
			mav.setViewName("member/memberFindMsg");
			mav.addObject("msg", msg);
		}else {
			sendIdFind(member_email.toString(), result);
			msg = "입력하신 이메일로 발송하였습니다.";
			mav.setViewName("member/memberFindMsg");
			mav.addObject("msg", msg);
		}
		return mav;
	}

	@RequestMapping("memberPwdFind.do")
	public ModelAndView memberPwdFind(MemberDTO dto, @RequestParam(value = "member_id", required = false) String id,
			@RequestParam(value = "member_name", required = false) String name,
			@RequestParam(value = "email1", required = false) String email1,
			@RequestParam(value = "email2", required = false) String email2) {
		String member_id = id;
		String member_email = email1 + "@" + email2;
		String member_name = name;
		ModelAndView mav = new ModelAndView();
		String result = memberDao.membmerPwdFind(member_id, member_name, member_email);
		String msg="";
		if(result=="email"){
			msg="이메일이 일치하지 않습니다.";
			mav.addObject("msg", msg);
			mav.setViewName("member/memberFindMsg");
		}else if(result=="emailname"){
			msg="이름이 일치하지 않습니다.";
			mav.addObject("msg", msg);
			mav.setViewName("member/memberFindMsg");
		}else if(result=="null"){
			msg="존재하지 않는 ID입니다.";
			mav.addObject("msg", msg);
			mav.setViewName("member/memberFindMsg");
		}else{
			msg = "이메일에 전송을 완료하였습니다.";
			sendPwdFind(member_email.toString(), result);
			mav.addObject("msg", msg);
			mav.setViewName("member/memberFindMsg");
			
		}
		return mav;
	}
}
