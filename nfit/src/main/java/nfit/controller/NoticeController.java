package nfit.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfit.notice.model.NoticeDAO;
import nfit.notice.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired NoticeDAO noticeDao;
	
	@RequestMapping(value="notice.do")
	public ModelAndView notice(@RequestParam(value="cp", defaultValue="1")int cp){
		int totalCnt=noticeDao.getTotalCnt();
		totalCnt=totalCnt==0?1:totalCnt;
		int listSize=5;
		int pageSize=5;
		List<NoticeDTO> list=noticeDao.noticeList(cp, listSize);
		
		String pageStr=nfit.page.PageModule.makePage("notice.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("notice/notice");
		return mav;
	}
	
	@RequestMapping(value="noticeContents.do")
	public ModelAndView noticeContents(@RequestParam(value="idx")int idx){
		NoticeDTO dto=noticeDao.getNoticeContents(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("notice/noticeContents");
		return mav;
	}
}
