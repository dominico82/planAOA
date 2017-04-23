package nfit.help.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfit.mtom.model.MtomDTO;
import nfit.notice.model.NoticeDTO;

public class HelpDAOImple implements HelpDAO {

private SqlSessionTemplate sqlMap;
	
	public HelpDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<HelpDTO> getHelpList() {
		List<HelpDTO> dtos=sqlMap.selectList("getHelpList");
		return dtos;
	}
	
	public List<HelpDTO> getHelpSerch(String category, String keyword, String tag, int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		HashMap search=new HashMap<>();
		if(!(category.equals("0"))){
			search.put("key", "faq_category");
			search.put("value", category);
		}else if(!(keyword.equals("0"))){
			search.put("key", "faq_content");
			search.put("value", keyword);
		}else if(!(tag.equals("0"))){
			search.put("key", "faq_tag");
			search.put("value", tag);
		}

		search.put("startnum", startnum);
		search.put("endnum", endnum);
		
		List<HelpDTO> dtos=sqlMap.selectList("getHelpSearch", search);
		
		return dtos;
	}
	
	public List<HelpDTO> getFaqTop5() {
		List<HelpDTO> top5=sqlMap.selectList("getFaqTop5");
		return top5;
	}
	
	public int setHelpContents(HelpDTO dto) {
		int count=sqlMap.insert("setHelpContents", dto);
		return count;
	}

	public HelpDTO getHelpContents(int idx) {
		HelpDTO dto=sqlMap.selectOne("getHelpContents", idx);
		return dto;
	}
	
	public int helpUpdate(HelpDTO dto) {
//		System.out.println("faq_idx는:"+dto.getFaq_idx());
//		System.out.println(dto.getFaq_category());
//		System.out.println(dto.getFaq_tag());
//		System.out.println(dto.getFaq_subject());
//		System.out.println(dto.getFaq_content());
		int count=sqlMap.update("helpUpdate", dto);
//		System.out.println("업데이트된 갯수:"+count);
		return count;
	}
	
	public int helpDel(int idx) {
		int result=sqlMap.delete("helpDel", idx);
		return result;
	}
	
	public int increaseReadnum(int idx, int readnum) {
		HashMap map=new HashMap();
		map.put("faq_idx", idx);
		map.put("faq_readnum", readnum);
		int result=sqlMap.update("increaseReadnum", map);
		return result;
	}
	
	public int getTotalSearchCnt(String category, String keyword, String tag) {
		HashMap<String, String> search=new HashMap<String, String >();
		if(!(category.equals("0"))){
			search.put("key", "faq_category");
			search.put("value", category);
		}else if(!(keyword.equals("0"))){
			search.put("key", "faq_content");
			search.put("value", keyword);
		}else if(!(tag.equals("0"))){
			search.put("key", "faq_tag");
			search.put("value", tag);
		}
		int count=sqlMap.selectOne("totalSearchCnt", search);
		return count;
	}
	
	
}  






















