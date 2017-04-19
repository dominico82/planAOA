package nfit.help.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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
	
	public List<HelpDTO> getHelpSerch(String category, String keyword, String tag) {
		HashMap<String, String> search=new HashMap<String, String >();
		if(!(category.equals("0"))){
			search.put("key", "faq_category");
			search.put("value", category);
		}else if(!(keyword.equals("0"))){
			search.put("key", "faq_content");
			search.put("value", "%"+keyword+"%");
		}else if(!(tag.equals("0"))){
			search.put("key", "faq_tag");
			search.put("value", tag);
		}
		System.out.println(category);
		List<HelpDTO> dtos=sqlMap.selectList("getHelpSearch", search);
		
		return dtos;
	}
	
	public String faqTop5() {
		return null;
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
		System.out.println(dto.getFaq_idx());
		System.out.println(dto.getFaq_category());
		System.out.println(dto.getFaq_tag());
		System.out.println(dto.getFaq_subject());
		System.out.println(dto.getFaq_content());
		int count=sqlMap.update("helpUpdate", dto);
		return count;
	}
}  

