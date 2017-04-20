package nfit.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.help.model.HelpDAO;
import nfit.help.model.HelpDTO;

@Controller
public class HelpController {
	
	@Autowired HelpDAO helpDao;
	
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
									@RequestParam(value="tag", defaultValue="0")String tag){
		List<HelpDTO> dtos=helpDao.getHelpSerch(category, keyword, tag);
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
}




















