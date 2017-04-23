package nfit.center.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ContentDAOImple implements ContentDAO {

	private SqlSessionTemplate sqlMap;

	public ContentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public List<ContentDTO> contentListDB(int co_idx) {
		List<ContentDTO> list = sqlMap.selectList("contentListSQL", co_idx);
		return list;
	}
	public List<ContentDTO> contentAllListDB(){
		List<ContentDTO> allList = sqlMap.selectList("contentAllListSQL");
		return allList;
	}
}
