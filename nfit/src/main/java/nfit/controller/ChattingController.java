package nfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChattingController {

	@RequestMapping("/broadcast.do")
	public ModelAndView chat(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/info/broadcast");
		return mav;
	}
}
