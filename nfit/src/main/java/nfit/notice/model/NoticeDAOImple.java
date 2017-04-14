package nfit.notice.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

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
	
	public int setNoticeContents(NoticeDTO dto) {
		int count=sqlMap.insert("setNoticeContents", dto);
		return count;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count;
	}

}
