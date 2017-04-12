package nfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelpController {
	@Autowired
	
	@RequestMapping(value="help.do")
	public ModelAndView help(){
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("help/help");
		return mav;
	}
	
	@RequestMapping(value="search.do")
	public ModelAndView helpSearch(){
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("help/helpSearch");
		return mav;
	}
}
