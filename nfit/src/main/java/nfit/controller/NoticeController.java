package nfit.controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import nfit.notice.model.NoticeDAO;
import nfit.notice.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired NoticeDAO noticeDao;
	
	@RequestMapping(value="notice.do")
	public ModelAndView notice(Map param){
		ModelAndView mav=new ModelAndView();
		Map ls=noticeDao.noticeList(param);
		mav.addObject("list", ls);
		mav.setViewName("notice/notice");
		return mav;
	}
	
	@RequestMapping(value="noticeContents.do")
	public ModelAndView noticeContents(@RequestParam(value="idx")int idx){
		NoticeDTO dto=noticeDao.getNoticeContents(idx);
		List<String> pics=noticeDao.getNoticePics(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("pics", pics);
		mav.setViewName("notice/noticeContents");
		return mav;
	}
	
	@RequestMapping(value="noticeWrite.do", method=RequestMethod.GET)
	public String noticeWriteForm(){
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="noticeWrite.do", method=RequestMethod.POST)
	public ModelAndView noticeWrite(NoticeDTO dto, @RequestParam("files") List<MultipartFile> files)throws IllegalStateException, IOException{
		
		int result=noticeDao.setNoticeContents(dto, files);
		ModelAndView mav=new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("notice/noticeWrite_ok");
		return mav;
	}
	

}




























