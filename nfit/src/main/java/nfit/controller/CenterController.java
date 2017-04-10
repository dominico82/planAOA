package nfit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nfit.center.model.CenterDAO;
import nfit.center.model.CenterDTO;
import nfit.center.model.ContentDAO;
import nfit.center.model.ContentDTO;
import nfit.center.model.UsetimeDAO;
import nfit.center.model.UsetimeDTO;

@Controller
public class CenterController {
	
	@Autowired
	private CenterDAO centerDao;
	
	@Autowired
	private UsetimeDAO usetimeDao;
	
	@Autowired
	private ContentDAO contentDao;
	
	@RequestMapping("/centerPage.do")
	public String centerPage(ModelMap model){
		List<CenterDTO> list=centerDao.centerListDB();
		model.addAttribute("list", list);
		return "/center/centerMap";
	}
	
	@RequestMapping("/centerDetail.do")
	public String centerDetail(ModelMap model, @RequestParam(value="co_idx",required=false, defaultValue="0") int co_idx){
		CenterDTO dto=centerDao.centerOneDB(co_idx);
		List<UsetimeDTO> list = usetimeDao.usetimeDB(co_idx);
		List<ContentDTO> contentList=contentDao.contentListDB(co_idx);
		model.addAttribute("dto", dto);
		model.addAttribute("timelist", list);
		model.addAttribute("contentlist", contentList);
		return "/center/centerDetail";
	}
}
