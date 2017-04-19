package nfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/adminPage.do")
	public String AdminForm(){
		return "admin/main";
	}
	@ RequestMapping("/widgets.do")
	public String WidgetsForm(){
		return "admin/widgets";
	}
}
