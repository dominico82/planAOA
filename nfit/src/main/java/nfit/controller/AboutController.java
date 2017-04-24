package nfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController {

	@RequestMapping("/about.do")
	public ModelAndView about(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/info/about");
		return mav;
	}
}
