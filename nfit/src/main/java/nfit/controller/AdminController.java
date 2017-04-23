package nfit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.center2.model.CompanyDAO;
import nfit.center2.model.CompanyListDTO;
import nfit.member.model.MemberDAO;
import nfit.member.model.MemberDTO;
import nfit.notice.model.NoticeDAO;
import nfit.notice.model.NoticeDTO;

@Controller
public class AdminController {

	@Autowired
	MemberDAO memberDao;
	@Autowired
	NoticeDAO noticeDao;
	//제휴업체 Dao
	@Autowired
	CompanyDAO companyDao;

	@RequestMapping("/adminPage.do")
	public String AdminForm() {
		return "admin/main";
	}

	@RequestMapping(value = "memberAdmin.do")
	public ModelAndView memberAdmin(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = memberDao.getTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;
		int listSize = 10;
		int pageSize = 5;
		List<MemberDTO> list = memberDao.memberList(cp, listSize);
		String pageStr = nfit.page.PageModule.makePage("memberAdmin.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("admin/member");
		return mav;
	}

	@RequestMapping(value = "noticeAdmin.do")
	public ModelAndView noticeAdmin(@RequestParam(value = "cp", defaultValue = "1") int cp) {
		int totalCnt = noticeDao.getTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;
		int listSize = 10;
		int pageSize = 5;
		List<NoticeDTO> list = noticeDao.noticeList(cp, listSize);
		String pageStr = nfit.page.PageModule.makePage("noticeAdmin.do", totalCnt, listSize, pageSize, cp);

		ModelAndView mav = new ModelAndView();
		mav.addObject("noticelist", list);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("admin/notice");
		return mav;
	}

	@RequestMapping(value = "memberDeleteAdmin.do")
	public ModelAndView memberDeleteAdmin(@RequestParam(value = "member_id") String id) {
		System.out.println(id);
		String member_id = id;
		int result = memberDao.memberDelete(member_id);
		String msg = result > 0 ? "회원삭제 완료" : "회원삭제 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	//보류페이지
	@RequestMapping(value="cooperateAdmin.do")
	public String cooperAdmin(Map map,@RequestParam(value="pagenum",defaultValue="1")String pagenum_o){
		//페이징 로직
		int pagenum=Integer.parseInt(pagenum_o);
		//시작,끝 게시글번호
		int start=((pagenum-1)*10)+1;
		int end=pagenum*10;
		
		int startpage=(pagenum/10*10)+1;
		
		if(pagenum%10==0){
			startpage=startpage-10;
		}
		//마지막페이지
		int endpage=startpage+9;
		//실제 게시물의 갯수의 변수
		int datacount = companyDao.companyListcount();
		//총 페이지가 될 변수
		int totalpage=0;	
		//총게시물 조건식
		if(datacount%10!=0){
			totalpage=datacount/10+1;
		}else{
			totalpage=datacount/10;
		}	
		//최종 게시물 조건식
		if(totalpage<endpage){
			endpage=totalpage;
		}
		List<CompanyListDTO> list = companyDao.companyListborad(start, end);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("totalpage", totalpage);
		map.put("list", list);
		return "admin/cooperate";
	}

	@RequestMapping("/coinAdmin.do")
	public String coinForm() {
		return "admin/coin";
	}

	@RequestMapping("/questionAdmin.do")
	public String questionAdmin() {
		return "admin/question";
	}

}
