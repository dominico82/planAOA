package nfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	@RequestMapping(value="notice.do")
	public ModelAndView notice(){
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("notice/notice");
		return mav;
	}
}
