package nfit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		List<ContentDTO> clist = contentDao.contentAllListDB();
		model.addAttribute("list", list);
		model.addAttribute("clist", clist);
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
		response.setContentType("text/html;charset=UTF-8");
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
		response.setContentType("text/html;charset=UTF-8"); 
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
		response.setContentType("text/html;charset=UTF-8");
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
	@RequestMapping(value="centerCompanyList.do", method=RequestMethod.GET)
	public void companyListAjax(HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		String comListJson = "{center_list:[";
		List<CenterDTO> companyList = centerDao.centerListDB();
		if(companyList!=null){
			for(int i=0; i<companyList.size(); i++){
				if(i<companyList.size()-1){
				comListJson +="{\"co_idx\":\""+companyList.get(i).getCo_idx()
						+"\",\"co_name\":\""+companyList.get(i).getCo_name()
						+"\",\"co_address\":\""+companyList.get(i).getCo_address()
						+"\",\"co_class\":\""+companyList.get(i).getCo_class()
						+"\",\"co_phone\":\""+companyList.get(i).getCo_phone()
						+"\",\"co_regul\":\""+companyList.get(i).getCo_regul()
						+"\",\"co_extra\":\""+companyList.get(i).getCo_extra()
						+"\",\"co_view\":\""+companyList.get(i).getCo_view()
						+"\",\"co_usecount\":\""+companyList.get(i).getCo_usecount()
						+"\",\"co_lat\":\""+companyList.get(i).getCo_lat()
						+"\",\"co_lng\":\""+companyList.get(i).getCo_lng()
						+"\",\"co_avail\":\""+companyList.get(i).getCo_avail()+"\"},";
				}else if(i==companyList.size()-1){
					comListJson +="{\"co_idx\":\""+companyList.get(i).getCo_idx()
							+"\",\"co_name\":\""+companyList.get(i).getCo_name()
							+"\",\"co_address\":\""+companyList.get(i).getCo_address()
							+"\",\"co_class\":\""+companyList.get(i).getCo_class()
							+"\",\"co_phone\":\""+companyList.get(i).getCo_phone()
							+"\",\"co_regul\":\""+companyList.get(i).getCo_regul()
							+"\",\"co_extra\":\""+companyList.get(i).getCo_extra()
							+"\",\"co_view\":\""+companyList.get(i).getCo_view()
							+"\",\"co_usecount\":\""+companyList.get(i).getCo_usecount()
							+"\",\"co_lat\":\""+companyList.get(i).getCo_lat()
							+"\",\"co_lng\":\""+companyList.get(i).getCo_lng()
							+"\",\"co_avail\":\""+companyList.get(i).getCo_avail()+"\"}";
				}
			}
			comListJson+="]}";
			System.out.println(comListJson);
		}else{
			comListJson="null";
		}
		try{
			response.getWriter().print(comListJson);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="centerLatLng.do", method=RequestMethod.GET)
	public void centerLatLngAjax(
			@RequestParam(value="latlngData") String latlngData,  HttpServletResponse response){
	response.setContentType("text/html;charset=UTF-8");
	StringTokenizer st = new StringTokenizer(latlngData, "/");
	String array[]=new String[st.countTokens()];
	int i=0;
	while(st.hasMoreTokens()){
		array[i++]=st.nextToken();
	}
	String co_idxs=array[0];
	String co_lats=array[1];
	String co_lngs=array[2];
	System.out.println(co_idxs+"/"+co_lats+"/"+co_lngs);
	int co_idx=Integer.parseInt(co_idxs);
	double co_lat=Double.parseDouble(co_lats);
	double co_lng=Double.parseDouble(co_lngs);
	System.out.println(co_idx+"/"+co_lat+"/"+co_lng);
	String latlngJson;
	CenterDTO latlngdto=centerDao.centerOneDB(co_idx);
	latlngdto.setCo_lat(co_lat);
	latlngdto.setCo_lng(co_lng);
	System.out.println("latlngdto="+latlngdto.getCo_lat()+", "+latlngdto.getCo_lng());
	centerDao.InsertLatLngDB(latlngdto);
	if(latlngdto!=null){
		latlngJson="{\"co_idx\":\""+latlngdto.getCo_idx()
		+"\",\"co_lat\":\""+latlngdto.getCo_lat()
		+"\",\"co_lng\":\""+latlngdto.getCo_lng()+"\"}";
	}else{
		latlngJson="null";
	}
	try{
		response.getWriter().print(latlngJson);
	}catch(IOException e){
		e.printStackTrace();
	}
}
	@RequestMapping("/centerLoad.do")
	public String centerLoad(){
		return "/center/centerLoad";
	}
	
	@RequestMapping(value="/centerSearch.do", method=RequestMethod.GET)
	public void centerSearch(@RequestParam("keyword")String keyword, HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("keyword="+keyword);
		StringTokenizer st = new StringTokenizer(keyword);
		String strArr[]=new String[st.countTokens()];
		int n=0;
		while(st.hasMoreTokens()){
			strArr[n]=st.nextToken();
			n++;
		}
		List<String> list = new ArrayList<String>();
		for(int i=0; i<strArr.length; i++){
			list.add(i, strArr[i]);
			System.out.println("list("+i+")="+list.get(i).substring(0));
		}
		List<CenterDTO> searchResult = centerDao.centerSearchDB(keyword);
		
		
//		List<CenterDTO> co=centerDao.centerSearch(keyword);
		
	}
}
