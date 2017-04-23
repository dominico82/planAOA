package nfit.center.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SearchDAOImple implements SearchDAO {

	private SqlSessionTemplate sqlMap;

	public SearchDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<SearchDTO> centerSearchListDB() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
