package nfit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import nfit.center2.model.CompanyContentDTO;
import nfit.center2.model.CompanyDAO;
import nfit.center2.model.CompanyListDTO;
import nfit.center2.model.CompanyUseTimeDTO;
import util.MediaUtils;
import util.UploadFileUtils;

@Controller
public class ChartController {
	//파일경로 리소스설정
	@Resource(name="uploadPath")
	String uploadPath;
	@Autowired
	CompanyDAO companyDao;
	
	@RequestMapping(value="chart.do",method=RequestMethod.GET)
	public String view(){
		return "center/admin/admin";
	}
	//업로드 버튼 =>임시디렉토리에 업로드 => 지정된 디렉토리로옴겨준다.
	@RequestMapping(value="chart.do",method=RequestMethod.POST)
	public String company_add(@RequestParam("co_class2")String[] co_class2,
			Map map,@ModelAttribute CompanyListDTO vo,@RequestParam("co_view2")MultipartFile co_view2) throws Exception{
			String menu="";
			int check_box=0;	
				for(int i=0;i<co_class2.length;i++){
					check_box = Integer.parseInt(co_class2[i]);  
				}
			switch(check_box){
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
			//파일 오리지널 이름
			String filename=co_view2.getOriginalFilename();	
			//중복 해결 메소드 호출
			filename = uploadFile(filename, co_view2.getBytes());
			File target = new File(uploadPath,filename);
			FileCopyUtils.copy(co_view2.getBytes(),target);
			
			
			//업체등록 서비스
			int count = companyDao.company_add(vo,menu,filename);
			
			String result = count>0?"등록완료":"Error";
			map.put("result", result);
		return "center/admin/msg";
	}
	//파일명 중복 해결 
	private String uploadFile(String originalName, byte[] fileData)throws Exception{
		//uuid생성 (Universal Unique IDentifier ,범용 고유 식별자)
		UUID uid= UUID.randomUUID();
		String saveName =uid.toString()+"_"+originalName;
		File target=new File(uploadPath,saveName);
		FileCopyUtils.copy(fileData, target);
		return saveName;
	}
	//json 표기법
	//{"변수명":[{0},{1}],"변수명":"값"}
	@RequestMapping("company_list.do")
	@ResponseBody
	public JSONObject chartTest3(){
		List<CompanyListDTO> list =companyDao.companyList();
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
		for(CompanyListDTO vo : list ){
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
	//ajax 를 이용하여 업로드하기
	@RequestMapping(value="uploadAjax.do",method=RequestMethod.POST,produces="text/plan;charset=utf-8")
	@ResponseBody//view 가아니라 data 리턴
	public ResponseEntity<String> uploadAjax(MultipartFile file,@RequestParam("co_idx")int co_idx){
		ResponseEntity<String> entity= null;
		System.out.println("컨트롤러에서찍은 co_idx ::::"+co_idx);
		try{
			//uuid 발급
			UUID uid = UUID.randomUUID();
			String savedName=uid.toString()+"_"+file.getOriginalFilename();
			//서비스추가
			companyDao.companyco_view(co_idx, savedName);
			entity=new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, savedName, file.getBytes(), file.getOriginalFilename()),HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
			return entity;
	}
	/*관리자 페이지에넣을 업체 리스트 페이지이동폼*/
	@RequestMapping("co_list.do")
	public String co_list(Map map,@RequestParam(value="pagenum",defaultValue="1")String pagenum_o){
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
		List<CompanyListDTO> list = companyDao.companyListborad(start, end);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("totalpage", totalpage);
		map.put("list", list);
		return "center/admin/co_list";
	}
	//모달 팝업에 데이터 넘기기
	@RequestMapping("co_update.do")
	public String co_update(@RequestParam("co_idx")int co_idx,Map map){
		//idx 로 업체 리스트 가져오기 
		CompanyListDTO dto =companyDao.companydetail(co_idx);
		map.put("list", dto);
		return "center/admin/co_Detail";
	}
	
	////////////////////////////////////
	@ResponseBody //view가 아닌 data 리턴
	@RequestMapping("displayFile.do")
	public ResponseEntity<byte[]> displayFile(
			@RequestParam("fileName")String fileName) throws Exception {
		//서버의 파일을 다운로드하기 위한 스트림
		InputStream in=null; //java.io
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
	@ResponseBody
	@RequestMapping(value="centerUpdate.do",method=RequestMethod.POST)
	public ResponseEntity<String> centerUpdate(@RequestBody CompanyListDTO vo){
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
		
		List<CompanyUseTimeDTO> list= companyDao.usetime_table(co_idx);
		map.put("list", list);
		return "center/admin/usetime_table_list";
	}
	//업체별 컨텐츠 목록보기 
	@RequestMapping("content_list.do")
	public String content_list(@RequestParam("co_idx")int co_idx,Map map){
		List<CompanyContentDTO> list = companyDao.content_list(co_idx);
		int count = companyDao.content_list_count(co_idx);
		System.out.println("컨트롤러에서찍은 count::::"+count);
		map.put("count", count);
		map.put("list",list);
		return "center/admin/content_list";
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
				System.out.println("arr1 : : : : :"+arr1[i]);
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
}
