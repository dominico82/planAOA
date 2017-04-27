package nfit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultEditorKit.CopyAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import nfit.bookmark.model.MarkDTO;
import nfit.coin.model.CoinDTO;
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
		List<String> pic = memberDao.getImage(userid);
		int useridx = dto.getMember_idx();
		List<CoinDTO> dta = memberDao.getPayInfo(useridx);
		int tall1 = dto.getMember_tall();
		double tall = (tall1*0.01);
		int weight = dto.getMember_weight();
		int bmi = (int)(weight/(tall*tall));
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("dta",dta);
		mav.addObject("bmi",bmi);
		mav.addObject("pic", pic);
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
	public ModelAndView infoModify(MemberDTO dto,
			@RequestParam(value="email1",required=false)String email1,
			@RequestParam(value="email2",required=false)String email2){
		
		dto.setMember_email(email1+"@"+email2);
		int result = memberDao.memberModify(dto);
		
		String msg = result>0?"정보가 수정되었습니다.":"정보수정 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("mypage/modifyMsg");
		return mav;
	}
	
	/**프로필사진 업로드
	@RequestMapping("fileUpload.do")
	public String fileUpload(MultipartHttpServletRequest req){
		String writer = req.getParameter("writer");
		MultipartFile upload = req.getFile("upload");
		copyInto(writer,upload);
		return "mypage/fileSuccess";
	} 
	
	//파일 복사 관련 사용자 정의 메서드
	private void copyInto(String writer, MultipartFile upload){
		
		try {
			byte bytes[] = upload.getBytes();
			System.out.println("작성자:"+writer);
			System.out.println("파일명:"+upload.getOriginalFilename());
			File outFile = new File("c:/Users/wonjun/git/planAOA/nfit/src/main/webapp/resources/upload_images/"+upload.getOriginalFilename());
			//C:/Users/wonjun/git/planAOA/nfit/src/main/webapp/resources/upload_images/
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
	
	//프로필 사진 DB에 업로드
	@RequestMapping(value="fileUpload.do", method=RequestMethod.POST)
	public ModelAndView saveImage(@RequestParam("id") String id, @RequestParam("files") MultipartFile files) throws IllegalStateException, IOException {
		
		int result = memberDao.setImage(id, files);
		String msg = result>0?"사진 업로드 완료":"업로드 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("mypage/myPage_ok");
		return mav;
	}
	
	@RequestMapping(value="memberLeave.do")
	public ModelAndView memberLeave(HttpSession session){
		
		String userid = (String)session.getAttribute("saveid");
		int result = memberDao.memberDelete(userid);
		String msg = result>0?"이용해주셔서 감사합니다":"회원탈퇴 실패";

		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("mypage/leaveMsg");
		return mav;
	}
	
	@RequestMapping(value="markJoin.do")
	public ModelAndView markJoin(MarkDTO dto){
		System.out.println(dto+"dto");
		int result = memberDao.setMark(dto);
		String msg = result>0?"즐겨찾기가 추가되었습니다.":"즐겨찾기 실패!";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("mypage/markMsg");
		return mav;
	}
	
}

























