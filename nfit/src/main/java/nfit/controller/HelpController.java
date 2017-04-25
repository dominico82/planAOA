package nfit.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import nfit.help.model.HelpDAO;
import nfit.help.model.HelpDTO;
import nfit.member.model.MemberDTO;
import nfit.mtom.model.MtomDAO;
import nfit.mtom.model.MtomDTO;
import nfit.notice.model.NoticeDTO;

@Controller
public class HelpController {
	
	@Autowired HelpDAO helpDao;
	@Autowired MtomDAO mtomDao;
	
	@RequestMapping(value="help.do")
	public ModelAndView help(){
		ModelAndView mav=new ModelAndView();
		List<HelpDTO> dtos=helpDao.getHelpList();
		List<HelpDTO> top5=helpDao.getFaqTop5();
		mav.addObject("helpList", dtos);
		mav.addObject("top5", top5);
		mav.setViewName("help/help");
		return mav;
	}
	
	@RequestMapping(value="helpSearch.do")
	public ModelAndView helpSearch(@RequestParam(value="category", defaultValue="0")String category,
									@RequestParam(value="keyword", defaultValue="0")String keyword,
									@RequestParam(value="tag", defaultValue="0")String tag,
									@RequestParam(value="cp", defaultValue="1") int cp){
		int totalCnt=helpDao.getTotalSearchCnt(category, keyword, tag);
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;	
		List<HelpDTO> dtos=helpDao.getHelpSerch(category, keyword, tag, cp, listSize);
		String pageStr=nfit.page.PageModuleFAQ.makePageFAQ("helpSearch.do", totalCnt, listSize, pageSize, category, keyword, tag, cp);	
		String searchText="";
		if(!(category.equals("0"))){
			searchText=category;
		}else if(!(keyword.equals("0"))){
			searchText=keyword;
		}else if(!(tag.equals("0"))){
			searchText=tag;
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("searchList", dtos);
		mav.addObject("searchText", searchText);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("help/helpSearch");
		return mav;
	}
	
	@RequestMapping(value="helpContents.do")
	public ModelAndView helpContents(@RequestParam(value="idx")int idx){
		HelpDTO dto=helpDao.getHelpContents(idx);
		int readnum=dto.getFaq_readnum()+1;
		int result=helpDao.increaseReadnum(idx, readnum);
		ModelAndView mav=new ModelAndView();
		mav.addObject("helpContents", dto);
		mav.setViewName("help/helpContents");		
		return mav;
	}
	
	@RequestMapping(value="helpWrite.do")
	public ModelAndView helpWriteForm(){
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("help/helpWrite");
		
		return mav;
	}
	
	@RequestMapping(value="helpWrite.do", method=RequestMethod.POST)
	public ModelAndView helpWrite(HelpDTO dto){
		ModelAndView mav=new ModelAndView();
		int result=helpDao.setHelpContents(dto);
		
		mav.addObject("result", result);
		mav.setViewName("help/helpWrite_ok");
		
		return mav;
	}
	
	@RequestMapping(value="helpUpdate.do")
	public ModelAndView helpUpdateForm(@RequestParam(value="idx")int idx){
		HelpDTO dto=helpDao.getHelpContents(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("contents", dto);
		mav.setViewName("help/helpUpdate");
		return mav;
	}
	
	@RequestMapping(value="helpUpdate.do", method=RequestMethod.POST)
	public ModelAndView helpUpdate(HelpDTO dto){	
	ModelAndView mav=new ModelAndView();
	int result=helpDao.helpUpdate(dto);
	mav.addObject("result", result);
	mav.setViewName("help/helpUpdate_ok");
	
	return mav;
	}
	
	@RequestMapping(value="helpDel.do")
	public ModelAndView helpDel(@RequestParam(value="idx")int idx){
		ModelAndView mav=new ModelAndView();
		int result=helpDao.helpDel(idx);
		String msg=result>0?"삭제성공!":"삭제실패!";
		mav.addObject("msg", msg);
		mav.setViewName("help/helpDel");
		return mav;
	}
	
	@RequestMapping(value="helpMtom.do")
	public ModelAndView helpMtom(HttpSession session){
		String userid=(String)session.getAttribute("saveid");
		ModelAndView mav=new ModelAndView();
		if(userid==null || userid.equals("")){
			mav.setViewName("member/memberLoginForm");
		}else{
			List<MtomDTO> dtos=mtomDao.getHelpMtom(userid);
			mav.addObject("member_id", userid);
			mav.addObject("list", dtos);
			mav.setViewName("help/helpMtom");
		}
		return mav;
	}
	
	@RequestMapping(value="helpMtom.do", method=RequestMethod.POST)
	public ModelAndView helpMtomWrite(MtomDTO dto){
		String userid=dto.getMember_id();
		int result=mtomDao.setHelpMtom(dto);
		List<MtomDTO> dtos=mtomDao.getHelpMtom(userid);
		System.out.println(dtos.get(0).getQa_subject());
		ModelAndView mav=new ModelAndView();
		mav.addObject("result", result);
		mav.addObject("list", dtos);
		mav.setViewName("help/helpMtom");
		return mav;
	}
	
	@RequestMapping(value="helpMtomReply.do")
	public ModelAndView helpMtomList(@RequestParam(value="cp", defaultValue="1") int cp){
		int totalCnt=mtomDao.getTotalMtomCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=10;
		int pageSize=5;	
		List<MtomDTO> dtos=mtomDao.getHelpMtomList(cp, listSize);
		String pageStr=nfit.page.PageModule.makePage("helpMtomReply.do", totalCnt, listSize, pageSize, cp);	
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", dtos);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("admin/question");
		return mav;
	}
	
	@RequestMapping(value="helpMtomContents.do")
	public ModelAndView helpMtomContents(@RequestParam(value="idx")int idx){
		MtomDTO dto=mtomDao.getHelpMtomContents(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("help/helpMtomContents");
		return mav;
	}
	@RequestMapping(value="helpMtomReplyWrite.do", method=RequestMethod.POST)
	public ModelAndView helpMtomReplyWrite(MtomDTO dto){
		ModelAndView mav=new ModelAndView();
		int result=mtomDao.setHelpMtomReply(dto);
		mav.addObject("result", result);
		mav.setViewName("help/helpMtomReply_ok");
		return mav;
	}
	
	@RequestMapping(value="helpMtomDel.do")
	public ModelAndView helpMtomDel(@RequestParam(value="idx")int idx){
		ModelAndView mav=new ModelAndView();
		int result=mtomDao.helpMtomDel(idx);
		String msg=result>0?"삭제성공!":"삭제실패!";
		mav.addObject("msg", msg);
		mav.setViewName("help/helpMtomDel");
		return mav;
	}
	
	@RequestMapping(value="helpMtomUpdate.do")
	public ModelAndView helpMtomUpdate(MtomDTO dto){		
		ModelAndView mav=new ModelAndView();
		int result=mtomDao.setHelpMtomUpdate(dto);
		mav.addObject("result", result);
		mav.setViewName("help/helpMtomUpdate");
		return mav;
	}
	
	@RequestMapping(value="helpMtomRefresh.do")
	@ResponseBody
	public List<MtomDTO> jsonList(HttpSession session){
		String userid=(String)session.getAttribute("saveid");
		List<MtomDTO> list=mtomDao.getHelpMtom(userid);
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("list", list);
//		mav.setViewName();
		
		return list;
	}
}




















