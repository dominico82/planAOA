package nfit.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeSet;

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
	public String centerPage(ModelMap model,HttpServletRequest request){
		List<CenterDTO> list=centerDao.centerListDB();
		List<ContentDTO> clist = contentDao.contentAllListDB();
		String root_path = request.getSession().getServletContext().getRealPath("/");
		System.out.println("프로젝트경로::::"+root_path);
		model.addAttribute("list", list);
		model.addAttribute("clist", clist);
		return "/center/centerMap";
	}
	
	@RequestMapping("/centerDetail.do")
	public String centerDetail(ModelMap model, HttpServletRequest req, @RequestParam(value="co_idx",required=false, defaultValue="0") int co_idx){
		if(co_idx==0){
			String msg = "잘못된 접근입니다.";
			model.addAttribute("msg", msg);
			return "center/centerMsg";
		}
		CenterDTO dto=centerDao.centerOneDB(co_idx);
		List<UsetimeDTO> list = usetimeDao.usetimeDB(co_idx);
		List<ContentDTO> contentList=contentDao.contentListDB(co_idx);
		
		/*coin 소수점 처리*/
		List coinList = new ArrayList();
		for(int i=0; i<contentList.size(); i++){
			DecimalFormat df=new DecimalFormat();
			double coin = contentList.get(i).getContent_coin();
			if(coin < 10){
				df.applyLocalizedPattern("0.#"); 
			}else if(coin >=10){
				df.applyLocalizedPattern("00.#"); 
			}//if(coin < 10){
			String coinStr = df.format(coin);
			coinList.add(coinStr);
		}//for(int i=0; i<contentList.size(); i++){
		/*ends coin 소수점 처리*/
		
		/*image file 찾기*/
		String  testPath2 = req.getSession().getServletContext().getRealPath("/");
		String path = testPath2.replace("\\", "/");
		String imgPath2 = path + "resources/centerImage";
		String viewPath = dto.getCo_view();
		String fullPath = imgPath2+"/"+viewPath;
		File f = new File(fullPath);
		File files[] = f.listFiles();
		List fileList = new ArrayList();
		String srcPath="resources/centerImage/"+viewPath;
		for(int i=0; i<files.length; i++){
			String fileName=srcPath+"/"+files[i].getName();
			fileList.add(fileName);
		}
		String firstImg = fileList.get(0).toString();
		System.out.println(firstImg);
		/*ends image file 찾기*/
		
		CenterDTO centerList=centerDao.centerOneDB(co_idx);
		model.addAttribute("co_idx",co_idx);//요거 지우지마세요-재혁
		model.addAttribute("dto", dto);
		model.addAttribute("timelist", list);
		model.addAttribute("contentlist", contentList);
		model.addAttribute("centerlist", centerList);
		model.addAttribute("coinlist", coinList);
		model.addAttribute("filelist", fileList);
		model.addAttribute("firstimg", firstImg);
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
	public void centerSearch(@RequestParam("keyword")String keyword, HttpServletResponse resp){
		resp.setContentType("text/html;charset=UTF-8");
		/*검색어 tokenizer*/
		StringTokenizer st = new StringTokenizer(keyword);
		String strArr[]=new String[st.countTokens()];
		int n=0;
		while(st.hasMoreTokens()){
			strArr[n]=st.nextToken();
			n++;
		}
		/*end*/
		/*검색어에 따른 배열 구성*/
		
		List<CenterDTO> companyList=new ArrayList<CenterDTO>();
		TreeSet ts = new TreeSet();
		for(int i=0; i<n; i++){
			companyList = centerDao.centerSearchDB(strArr[i]);
			for(int j=0; j<companyList.size(); j++){
				ts.add(companyList.get(j).getCo_idx());
			}
		}
		Iterator it = ts.iterator();
		
		/*중복된 리스트 항목 제거*/
		int idxNum[] = new int[ts.size()];
		int cnt=0;
		while(it.hasNext()){
			idxNum[cnt]= (Integer) it.next();
			cnt++;
		}
		
		/*최종 리스트를 토대로 DTO 호출*/
		List<CenterDTO> wholeList = new ArrayList<CenterDTO>(); //전체 list
		CenterDTO finalList = new CenterDTO();
		for(int i=0; i<idxNum.length; i++){
			finalList=centerDao.centerOneDB(idxNum[i]);
			wholeList.add(finalList);
		}
		
		/*JSON형성*/
		String searchJson="{company_list:[";
		for(int i=0; i<wholeList.size(); i++){
	           searchJson += "{\"co_idx\":\""+wholeList.get(i).getCo_idx()
	               	+"\",\"co_name\":\""+wholeList.get(i).getCo_name()
	       			+"\",\"co_address\":\""+wholeList.get(i).getCo_address()
	       			+"\",\"co_class\":\""+wholeList.get(i).getCo_class()
	       			+"\",\"co_phone\":\""+wholeList.get(i).getCo_phone()
	       			+"\",\"co_regul\":\""+wholeList.get(i).getCo_regul()
	       			+"\",\"co_extra\":\""+wholeList.get(i).getCo_extra()
	       			+"\",\"co_view\":\""+wholeList.get(i).getCo_view()
	       			+"\",\"co_usecount\":\""+wholeList.get(i).getCo_usecount()
	       			+"\",\"co_lat\":\""+wholeList.get(i).getCo_lat()
	       			+"\",\"co_lng\":\""+wholeList.get(i).getCo_lng();
	                  if(i<wholeList.size()-1){
	               	   searchJson+="\",\"co_avail\":\""+wholeList.get(i).getCo_avail()+"\"},";
	                  }else if(i==wholeList.size()-1){
	               	   searchJson+="\",\"co_avail\":\""+wholeList.get(i).getCo_avail()+"\"}";
	                  }
	       		}
	       		searchJson+="]}";
	       		System.out.println("searchJson="+searchJson);
	       		try{
	       			resp.getWriter().print(searchJson);
	       		}catch(IOException e){
	       			e.printStackTrace();
	       		}
		}
	}




