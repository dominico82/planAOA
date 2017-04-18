package nfit.notice.model;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;

public class NoticeDAOImple implements NoticeDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<NoticeDTO> noticeList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map param=new HashMap();
		param.put("startnum", startnum);
		param.put("endnum", endnum);
		List<NoticeDTO> list=sqlMap.selectList("getNoticeList", param);
		
		return list;
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
		String savePath="C:/Users/Administrator/Documents/AOA_Enfit/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/nfit/resources/file/upload/";
		
		int count=sqlMap.insert("setNoticeContents", dto);
		for(int i=0; i<files.size(); i++){
//			System.out.println("사진 이름: "+files.get(i).getOriginalFilename());
			String fileName=files.get(i).getOriginalFilename();//파일을 저장하기 위해 이름을 가져온다.
			files.get(i).transferTo(new File(savePath+fileName));//파일을 업로드한다.
			int fcount=sqlMap.insert("setNoticePics", fileName);//DB에 사진 이름을 저장한다.
		}

		
		
		return count;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count;
	}

}
