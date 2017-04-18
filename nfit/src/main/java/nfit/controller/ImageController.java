package nfit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import nfit.member.model.MemberDTO;

@Controller
public class ImageController {
	
	@RequestMapping(value="upload", method=RequestMethod.POST)
	public ModelAndView uploadImage(MemberDTO member_idx, @RequestParam("upload") List<MultipartFile> files){
		
		int result = 
	}
	
}













