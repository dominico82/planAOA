package nfit.notice.model;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;

import nfit.page.AjaxPageModule;

public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

//	public List<NoticeDTO> noticeList(int cp, int ls) {
//		int startnum=(cp-1)*ls+1;
//		int endnum=cp*ls;
//		Map param=new HashMap();
//		param.put("startnum", startnum);
//		param.put("endnum", endnum);
//		List<NoticeDTO> list=sqlMap.selectList("getNoticeList", param);
//		
//		return list;
//	}
	
	//ajax 페이징
	public Map noticeList(Map param) {
		Map resultObject = new HashMap();
		List result = new ArrayList(); 
		
		int totalCnt = getTotalCnt(param); // DB연동_ 총 갯수 구해오기 
		int searchNo = 10; 
		int searchCntPerPage = 10; 
		int searchUnitPage = 10; 
		
		if (totalCnt > 0) { 
			AjaxPageModule.setPageInfo(param, 10); //param에 Page정보 파라미터 정보 put 해주기 
			List ls = sqlMap.selectList("getNoticeList", param); // 게시판 목록 data 페이징 처리 갯수만큼 가져오기 
			result=ls;
			//dataList와 pageInfo 셋팅 해주고 return 하기 
			resultObject.put("result", result); 
			resultObject.put("page", AjaxPageModule.getPageObject(totalCnt, searchNo, searchCntPerPage, searchUnitPage )); 
		} else { 
			resultObject.put("result", result); // 빈값 
			resultObject.put("page", AjaxPageModule.getPageObject(totalCnt, 0)); } 
		return resultObject;
	}
	
	public NoticeDTO getNoticeContents(int idx) {
		NoticeDTO dto=sqlMap.selectOne("getNoticeContents", idx);
		return dto;
	}
	
	public List<String> getNoticePics(int idx) {
		List<String> pics=sqlMap.selectList("getNoticePics", idx);
		return pics;
	}
	
	public int setNoticeContents(NoticeDTO dto, List<MultipartFile> files) throws IllegalStateException, IOException {
		//저장경로
		String savePath="C:/Users/wonjun/git/planAOA/nfit/src/main/webapp/resources/upload_images";
		
		int count=sqlMap.insert("setNoticeContents", dto);
		for(int i=0; i<files.size(); i++){
//			System.out.println("사진 이름: "+files.get(i).getOriginalFilename());
			String fileName=files.get(i).getOriginalFilename();//파일을 저장하기 위해 이름을 가져온다.
			files.get(i).transferTo(new File(savePath+fileName));//파일을 업로드한다.
			int fcount=sqlMap.insert("setNoticePics", fileName);//DB에 사진 이름을 저장한다.
		}

		
		
		return count;
	}
	
//	public int getTotalCnt() {
//		int count=sqlMap.selectOne("totalCnt");
//		return count;
//	}
	
	//ajax페이징용 게시판 갯수 가져오기
	public int getTotalCnt(Map param) {
		int result = sqlMap.selectOne("totalCnt", param);
		return result;
	}

}
