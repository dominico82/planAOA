package nfit.mtom.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MtomDAOImple implements MtomDAO {
	
private SqlSessionTemplate sqlMap;
	
	public MtomDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}

	public List<MtomDTO> getHelpMtom(String id) {
		List<MtomDTO> dtos=sqlMap.selectList("getHelpMtom", id);
		return dtos;
	}
	
	public int setHelpMtom(MtomDTO dto) {
		int result=sqlMap.insert("setHelpMtom", dto);
		return result;
	}
	
	public int getTotalMtomCnt() {
		int count=sqlMap.selectOne("totalMtomCnt");
		return count;
	}
	
	public List<MtomDTO> getHelpMtomList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map param=new HashMap();
		param.put("startnum", startnum);
		param.put("endnum", endnum);
		List<MtomDTO> list=sqlMap.selectList("getHelpMtomList", param);
		
		return list;
	}
	
	public MtomDTO getHelpMtomContents(int idx) {
		MtomDTO dto=sqlMap.selectOne("getHelpMtomContents", idx);
		return dto;
	}
	
	public int setHelpMtomReply(MtomDTO dto) {
		int count=sqlMap.update("setHelpMtomReply", dto);
		return count;
	}
	
	public int helpMtomDel(int idx) {
		System.out.println("삭제할 1:1문의게시판 idx:"+idx);
		int result=sqlMap.delete("helpMtomDel", idx);
		return result;
	}

	public int setHelpMtomUpdate(MtomDTO dto) {
		int result=sqlMap.update("setHelpMtomUpdate", dto);
		return result;
	}
}
