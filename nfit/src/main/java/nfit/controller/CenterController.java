package nfit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/centerCompany.do", method=RequestMethod.GET)
	public void companyAjax(
			@RequestParam("co_idx") int  co_idx, HttpServletResponse response){
		response.setContentType("text/html;charset=utf-8");
		String companyJson;
		CenterDTO company= centerDao.centerOneDB(co_idx);
		if(company !=null){
			companyJson="{\"co_idx\":\""+company.getCo_idx()
			+"\",\"co_name\":\""+company.getCo_name()
			+"\",\"co_address\":\""+company.getCo_address()
			+"\",\"co_class\":\""+company.getCo_class()
			+"\",\"co_phone\":\""+company.getCo_phone()
			+"\",\"co_regul\":\""+company.getCo_regul()
			+"\",\"co_extra\":\""+company.getCo_extra()
			+"\",\"co_view\":\""+company.getCo_view()
			+"\",\"co_usecount\":\""+company.getCo_usecount()
			+"\",\"co_lat\":\""+company.getCo_lat()
			+"\",\"co_lng\":\""+company.getCo_lng()
			+"\",\"co_avail\":\""+company.getCo_avail()+"\"}";
		}else{
			companyJson="null";
		}
		try{
			response.getWriter().print(companyJson);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/centerUsetime.do" , method=RequestMethod.GET)
	public void useAjax(@RequestParam("co_idx") int co_idx, HttpServletResponse response){
		response.setContentType("text/html;charset=utf-8"); 
		String useJson="{usetime:[";
		List<UsetimeDTO> usetime=usetimeDao.usetimeDB(co_idx);
		if(usetime!=null){
			for(int i=0; i<usetime.size(); i++){
				if(i<usetime.size()-1){
					useJson +="{\"usetime_idx\":\""+usetime.get(i).getUsetime_idx()
							+"\",\"co_idx\":\""+usetime.get(i).getCo_idx()
							+"\",\"usetime_day\":\""+usetime.get(i).getUsetime_day()
							+"\",\"usetime_time\":\""+usetime.get(i).getUsetime_time()+"\"},";
				}else if(i==usetime.size()-1){
					useJson +="{\"usetime_idx\":\""+usetime.get(i).getUsetime_idx()
							+"\",\"co_idx\":\""+usetime.get(i).getCo_idx()
							+"\",\"usetime_day\":\""+usetime.get(i).getUsetime_day()
							+"\",\"usetime_time\":\""+usetime.get(i).getUsetime_time()+"\"}";
				}
			}
			useJson+="]}";
			System.out.println(useJson);
		}else{
			useJson="null";
		}
		try{
			response.getWriter().print(useJson);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	@RequestMapping(value="centerContent.do", method=RequestMethod.GET)
	public void contentAjax(@RequestParam("co_idx") int co_idx, HttpServletResponse response){
		response.setContentType("text/html;charset=utf-8");
		String contentJson="{content:[";
		List<ContentDTO> content=contentDao.contentListDB(co_idx);
		if(content!=null){
			for(int i=0; i<content.size(); i++){
				if(i<content.size()-1){
							contentJson += "{\"content_idx\":\""+content.get(i).getContent_idx()
							+"\",\"co_idx\":\""+content.get(i).getCo_idx()
							+"\",\"content_coin\":\""+content.get(i).getContent_coin()
							+"\",\"content1\":\""+content.get(i).getContent1()
							+"\",\"content2\":\""+content.get(i).getContent2()
							+"\",\"content3\":\""+content.get(i).getContent3()
							+"\",\"content4\":\""+content.get(i).getContent4()
							+"\",\"content5\":\""+content.get(i).getContent5()
							+"\",\"content6\":\""+content.get(i).getContent6()+"\"},";
				}else if(i==content.size()-1){
							contentJson += "{\"content_idx\":\""+content.get(i).getContent_idx()
							+"\",\"co_idx\":\""+content.get(i).getCo_idx()
							+"\",\"content_coin\":\""+content.get(i).getContent_coin()
							+"\",\"content1\":\""+content.get(i).getContent1()
							+"\",\"content2\":\""+content.get(i).getContent2()
							+"\",\"content3\":\""+content.get(i).getContent3()
							+"\",\"content4\":\""+content.get(i).getContent4()
							+"\",\"content5\":\""+content.get(i).getContent5()
							+"\",\"content6\":\""+content.get(i).getContent6()+"\"}";
					}
			}
			contentJson+="]}";
			System.out.println(contentJson);
		}else{
			contentJson="null";
		}
		try{
			response.getWriter().print(contentJson);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}
