package nfit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {

	@RequestMapping("/index.do")
	public ModelAndView index(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	
	@RequestMapping("/broadcast.do")
	public ModelAndView broadcast(HttpServletRequest request, HttpSession sess){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("broadcast");
		return mav;
	}
}
