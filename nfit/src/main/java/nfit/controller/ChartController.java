package nfit.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


import nfit.center2.model.CompanyDAO;
import util.MediaUtils;
import nfit.center.model.*;
//nfit

@Controller
public class ChartController {
	//파일경로 리소스설정
	@Resource(name="uploadPath")
	String uploadPath;
	@Autowired
	private CompanyDAO companyDao;
	
	@RequestMapping(value="chart.do",method=RequestMethod.GET)
	public String view(){
		return "center/admin/admin";
	}
	//json 표기법 , 구글 차트 이용 한것
	//{"변수명":[{0},{1}],"변수명":"값"}
	@RequestMapping("company_list.do")
	@ResponseBody
	public JSONObject chartTest3(){
		List<CenterDTO> list =companyDao.companyList();
		//리턴 할 json 객체
		JSONObject data = new JSONObject(); // {}
		//json의 컬럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		//json 배열 객체
		JSONArray title = new JSONArray();
		col1.put("label","업체명");
		col1.put("type","string");
		col2.put("label", "누적이용수");
		col2.put("type", "number");
		//타이틀에 컬럼 추가
		title.add(col1);
		title.add(col2);
		//json 객채에 타이틀행 추가 
		data.put("cols", title);
		//{"cols":[{"label":"업체명","type","string"},{"lable":"누적이용수","type":"number"}]}
		JSONArray body = new JSONArray();
		for(CenterDTO vo : list ){
			JSONObject co_name= new JSONObject();
			co_name.put("v", vo.getCo_name());//업체이름
			JSONObject co_usecount = new JSONObject();
			co_usecount.put("v", vo.getCo_usecount());//업체 누적 사용수
			JSONArray row =new JSONArray();
			row.add(co_name);
			row.add(co_usecount);
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell);//레코드1개 추가 
		}
		data.put("rows",body);
		return data;
	}
	//ajax 를 이용  1.insert 하고 2.이미지upload 하기 
	@RequestMapping(value="uploadAjax.do",method=RequestMethod.POST,produces="text/plan;charset=utf-8")
	@ResponseBody//view 가아니라 data 리턴
	public ResponseEntity<String> uploadAjax(@RequestParam("checkbox")int checkbox,
			@ModelAttribute CenterDTO vo,MultipartHttpServletRequest mreq,
			HttpServletRequest request){
			String menu="";
		ResponseEntity<String> entity= null;
		try{
			switch(checkbox){
			case 1: menu="헬스"; break;
			case 2: menu="뷰티"; break;
			case 3: menu="필라테스"; break;
			case 4: menu="탁구"; break;
			case 5: menu="복싱"; break;
			case 6: menu="검도"; break;
			case 7: menu="격투기"; break;
			case 8: menu="크로스핏"; break;
			case 9: menu="골프"; break;
			case 10: menu="기타"; break;
			}
			String root_path = request.getSession().getServletContext().getRealPath("/");
			System.out.println("컨트롤러에서본 root_path::"+root_path);
			String attach_path = "resources/centerImage";
			//서비스등록 
			companyDao.company_add2(vo, menu);
			//방금 등록한 업체 idx값 가져오기 
			int co_idx = companyDao.sonnco_idx(vo.getCo_phone());
			//실제 우리가 파일을 저장할 하위 폴더
			String originalPath=co_idx+"_"+vo.getCo_phone();
			//상위폴더와 하위폴더의 결합 
			String maxPath=uploadPath+originalPath;
			File mkdir=new File(uploadPath+originalPath);
			//폴더생성
			if(!mkdir.exists()){
				mkdir.mkdirs();
			}
			companyDao.updatenewfile(co_idx,originalPath);
			//폴더 생성끝
			//파일생성 해야함 -------
			List<MultipartFile> mfile = mreq.getFiles("files"); 
			//확장자 검사
			for(int i =0;i<mfile.size();i++){
				String fileName=mfile.get(i).getOriginalFilename();
				String formatName=fileName.substring(
						fileName.lastIndexOf(".")+1);
			/*	if(formatName.equals("jpg")){
				}else if(formatName.equals("gif")){
					 fileName=co_idx+"_"+vo.getCo_phone()+"_"+i+".gif";
				}else if(formatName.equals("png")){
					 fileName=co_idx+"_"+vo.getCo_phone()+"_"+i+".png";
				}*/
				//확장자 강제설정
				
				fileName=co_idx+"_"+vo.getCo_phone()+"_"+i+".jpg";
				System.out.println("파일이름찍어보세요:"+fileName);
				//파일 이름 j
				File target = new File(maxPath,fileName);
				FileCopyUtils.copy(mfile.get(i).getBytes(),target);
			}
			entity = new ResponseEntity<String>("success" ,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
			return entity;
	}
	/*관리자 페이지에넣을 업체 리스트 페이지이동폼*/
	@RequestMapping("co_list.do")
	public String co_list(Map map,@RequestParam(value="pagenum",defaultValue="1")String pagenum_o,
			@RequestParam(value="keyword",required=false)String keyword ,
			@RequestParam(value="keyfield",required=false)String keyfield){
		//페이징 로직
		int pagenum=Integer.parseInt(pagenum_o);
		//시작,끝 게시글번호
		int start=((pagenum-1)*10)+1;
		int end=pagenum*10;
		
		int startpage=(pagenum/10*10)+1;
		
		if(pagenum%10==0){
			startpage=startpage-10;
		}
		//마지막페이지
		int endpage=startpage+9;
		//실제 게시물의 갯수의 변수
		int datacount = companyDao.companyListcount();
				
		//총 페이지가 될 변수
		int totalpage=0;	
		//총게시물 조건식
		if(datacount%10!=0){
			totalpage=datacount/10+1;
		}else{
			totalpage=datacount/10;
		}	
		//최종 게시물 조건식
		if(totalpage<endpage){
			endpage=totalpage;
		}
		//List<CompanyListDTO> list = companyDao.companyListborad(start, end);
		//업체검색 메소드호출
		List<CenterDTO> list=companyDao.companySearch(keyword, keyfield, start, end);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("totalpage", totalpage);
		map.put("list", list);
		return "admin/center/co_list";
	}
	//모달 팝업에 데이터 넘기기
	@RequestMapping("co_update.do")
	public String co_update(@RequestParam("co_idx")int co_idx,Map map){
		//idx 로 업체 리스트 가져오기 
		CenterDTO dto =companyDao.companydetail(co_idx);
		map.put("list", dto);
		return "admin/center/co_Detail";
	}
	////////////////////////////////////
	@ResponseBody //view가 아닌 data 리턴
	@RequestMapping("displayFile.do")
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName")String fileName) throws Exception {
		//서버의 파일을 다운로드하기 위한 스트림
		InputStream in=null; //java.io
		//이미지파일은 리턴값은 모두 바이트로 해야함 
		ResponseEntity<byte[]> entity=null;
		try{
			//확장자 검사
			String formatName=fileName.substring(
					fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtils.getMediaType(formatName);
			//헤더 구성 객체
			HttpHeaders headers=new HttpHeaders();
			// InputStream 생성
			in=new FileInputStream(uploadPath+fileName);
			if(mType != null){ //이미지 파일이면
				headers.setContentType(mType);
			}else{ //이미지가 아니면
					fileName=fileName.substring(fileName.indexOf("_")+1);
			//다운로드용 컨텐트 타입
			headers.setContentType(
					MediaType.APPLICATION_OCTET_STREAM);
			// 큰 따옴표 내부에  "  \"   "
			//바이트배열을 스트링으로
			//iso-8859-1 서유럽언어
			headers.add("Content-Disposition","attachment; filename=\""+new String(fileName.getBytes("utf-8"),"iso-8859-1")+"\"");
			}
			// 바이트배열, 헤더
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close(); //스트림 닫기
		}
		return entity;
	}
	//업로드 파일삭제
	@ResponseBody
	@RequestMapping("deleteFile.do")
	public ResponseEntity<String> deleteFile(@RequestParam("fileName")String fileName){
		//확장자 검사 
		String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
		//이미지 여부검사
		MediaType mType = MediaUtils.getMediaType(formatName);
		//이미지의 경우(이미지의경우 썸네일과 원본 두가지를 삭제 )
		//이미지가아닐경우 원본파일만 삭제 
		if(mType !=null){//이미지파일이면
			//썸네일 추출
			String front = fileName.substring(0,12);
			String end=fileName.substring(14);
			//썸네일 삭제
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		//원본파일 삭제
		new File(uploadPath+fileName.replace('/', File.separatorChar)).delete();
		//데이터와 http 상태 코드 전송
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	//업체정보 수정
	@RequestMapping(value="centerUpdate.do",method=RequestMethod.POST)
	public ResponseEntity<String> centerUpdate(@RequestBody CenterDTO vo){
		ResponseEntity<String> entity=null;
		try{
			//서비스추가
			companyDao.co_listupdate(vo);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//업체정보삭제
	@ResponseBody
	@RequestMapping(value="co_listdelete.do",method=RequestMethod.POST)
	public ResponseEntity<String> co_listdelete(@RequestParam("co_idx") int co_idx){
		ResponseEntity<String> entity = null;
		try{
			//서비스추가
			companyDao.co_listdelete(co_idx);
			entity=new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//업체별 이용시간 목록
	@RequestMapping("usetime_table_list.do")
	public String usetime_table(@RequestParam("co_idx")int co_idx,Map map){
		
		List<UsetimeDTO> list= companyDao.usetime_table(co_idx);
		map.put("list", list);
		map.put("usetime_co_idx", co_idx);
		return "admin/center/usetime_table_list";
	}
	//업체별 컨텐츠 목록보기 
	@RequestMapping("content_list.do")
	public String content_list(@RequestParam("co_idx")int co_idx,Map map){
		List<ContentDTO> list = companyDao.content_list(co_idx);
		int count = companyDao.content_list_count(co_idx);
		map.put("count", count);
		map.put("list",list);
		map.put("co_idx", co_idx);
		return "admin/center/content_list";
	}
	//이용시간 바꾸기(수정)
	@ResponseBody
	@RequestMapping(value="usetimeupdate.do",method=RequestMethod.POST)
	public ResponseEntity<String> usetimeupdate(HttpServletRequest req/*@RequestBody String arr11*/){
		ResponseEntity<String> entity= null;
			String arr1[]=req.getParameterValues("arr1");
			String arr3[]=req.getParameterValues("arr3");
			int usetime_idx=0;
			String usetime_time="";
			//배열조작
		try{
			for(int i =0;i<arr1.length;i++){
				usetime_idx=Integer.parseInt(arr1[i]);
				usetime_time = arr3[i];
				companyDao.usetime_table_update(usetime_idx, usetime_time);
			}//end for
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity= new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//컨텐츠 바꾸기 (수정)
	@ResponseBody
	@RequestMapping(value="content_list_update.do",method=RequestMethod.POST)
	public ResponseEntity<String> content_list_update(HttpServletRequest req){
		ResponseEntity<String> entity = null;
		String arr1[]=req.getParameterValues("arr1");// int 로형변환해야함
		String arr2[]=req.getParameterValues("arr2");
		String arr3[]=req.getParameterValues("arr3");
		String arr4[]=req.getParameterValues("arr4");
		String arr5[]=req.getParameterValues("arr5");
		String arr6[]=req.getParameterValues("arr6");
		String arr7[]=req.getParameterValues("arr7");
		String arr8[]=req.getParameterValues("arr8");
		String arr9[]=req.getParameterValues("arr9");
		try{
				for(int i=0;i<arr9.length;i++){
					int content_idx=Integer.parseInt(arr1[i]); //content_idx 형변환후 변수에담기
					int content_coin=Integer.parseInt(arr2[i]);//content_coin 형변환후 변수에담기
					String content1=arr3[i];
					String content2=arr4[i];
					String content3=arr5[i];
					String content4=arr6[i];
					String content5=arr7[i];
					String content6=arr8[i];
					companyDao.content_list_update(content_idx, content_coin, content1, content2, content3, content4, content5, content6);
				}
			entity =new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//이미지만 수정하는로직
	@ResponseBody
	@RequestMapping(value="ajaxUpload.do")
	public ResponseEntity<String[]> ajaxUpload(@RequestParam("co_idx")int co_idx,
			MultipartHttpServletRequest mreq){
		ResponseEntity<String[]> entity=null;
		try{
			//co_idx값으로 리스트 훍고 업체 핸드폰 번호 구하기 
			CenterDTO dto = companyDao.companydetail(co_idx);
			//실제 우리가 파일을 저장할 하위 폴더
			String originalPath=co_idx+"_"+dto.getCo_phone();
			//상위폴더와 하위폴더의 결합 
			String maxPath=uploadPath+originalPath;
			//상위 폴더 하위폴더 생성
			File mkdir=new File(maxPath);
			//폴더생성
			if(!mkdir.exists()){
				mkdir.mkdirs();
			}
			//폴더생성끝
			companyDao.companyco_view(co_idx, originalPath);
			//썸네일 작업하기 
			String uploadFileName=null;
			List<MultipartFile> mlist=mreq.getFiles("files");
			String data[]=new String[mlist.size()];
			for(int i=0;i<mlist.size();i++){
				String fileName=mlist.get(i).getOriginalFilename();
				/*확장자 검사 마지막 맞침표 찾기 */
				String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
				//파일 이름
//				if(formatName.equals("gif")){
//					fileName=co_idx+"_"+dto.getCo_phone()+"_"+i+".gif";
//				}else if(formatName.equals("jpg")){
//				}else if(formatName.equals("png")){
//					fileName=co_idx+"_"+dto.getCo_phone()+"_"+i+".png";
//				}
				fileName=co_idx+"_"+dto.getCo_phone()+"_"+i+".jpg";
				//이미지 파일은 썸네일을 사용한다.
				File target =new File(maxPath,fileName);
				FileCopyUtils.copy(mlist.get(i).getBytes(), target);
				if(MediaUtils.getMediaType(formatName)!=null){
					uploadFileName= makeThumbnail(uploadPath, originalPath, fileName);
					data[i]=uploadFileName;
				}
				entity =new ResponseEntity<String[]>(data,HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return entity;
	}
	//썸네일 생성 메소드
	public String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		//이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일의 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		//썸네일의 이름을 리턴함
		return thumbnailName.substring(
				uploadPath.length()).replace(File.separatorChar, '/');
	}
	//컨텐츠 삭제 메소드
	@ResponseBody
	@RequestMapping("content_delete.do")
	public ResponseEntity<String> content_delete(@RequestParam("content_co_idx")int co_idx){
		ResponseEntity<String> entity = null;
		try{
			//DAO실행
			companyDao.content_delete(co_idx);
			entity =new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//이용시간삭제메소드
	@RequestMapping("usetime_delete.do")
	public ResponseEntity<String> usetime_delete(@RequestParam("usetime_co_idx")int co_idx){
		ResponseEntity<String> entity=null;
		try{
			//Dao실행
			companyDao.usetime_delete(co_idx);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//이용시간 등록 메소드
	@RequestMapping("usetime_insert.do")
	public ResponseEntity<String> usetime_insert(@ModelAttribute UsetimeDTO vo){
		ResponseEntity<String> entity =null;
		try{
			//최신 idx값가져오는 Dao호출
			int co_idx= companyDao.max_co_idx();
			//최신 idx값 담기
			vo.setCo_idx(co_idx);
			//insert 서비스 호출
			companyDao.usetime_insert(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//컨탠츠 등록 메소드
	@RequestMapping("content_insert.do")
	public ResponseEntity<String> content_insert(@ModelAttribute ContentDTO vo){
		ResponseEntity<String> entity=null;
		try{
			//최신 idx값 가져오는 Dao호출
			int co_idx=companyDao.max_co_idx();
			vo.setCo_idx(co_idx);
			companyDao.content_insert(vo);
			entity =new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity =new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//기존 업체 컨텐츠 등록 
	@ResponseBody
	@RequestMapping("oldCompanycon.do")
	public ResponseEntity<String> oldCompanycon(
			@ModelAttribute ContentDTO vo,@RequestParam("co_phone")String co_phone){
		ResponseEntity<String> entity=null;
		try{
			//기존 업체 idx갑구하기
			int co_idx =companyDao.oldCompany(co_phone);
			vo.setCo_idx(co_idx);
			
			companyDao.oldCompanyin(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	//키워드 자동완성 Json 객체 생성후 리턴
	@RequestMapping("autocomplete.do")
	public @ResponseBody JSONObject autocomplete(@RequestParam("value")String value,
			@RequestParam("keyword")String keyword){
		JSONObject head = new JSONObject();
		JSONArray body= new JSONArray();
		List<CenterDTO> list = companyDao.searchAuto(keyword, value);
		
		for(int i=0;i<list.size();i++){
			//데이터삽입
			String max=list.get(i).getCo_name()+","+list.get(i).getCo_class();
			JSONObject head2 = new JSONObject();
			if(keyword.equals("co_name")){
				head2.put("co_list",list.get(i).getCo_name());
			}else if(keyword.equals("co_address")){
				head2.put("co_list", list.get(i).getCo_address());
			}
			body.add(head2);
		}
		head.put("data", body);
		return head;
	}
}
	
	
	