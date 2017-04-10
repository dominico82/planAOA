package nfit.center.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CenterDAOImple implements CenterDAO {
	
	private SqlSessionTemplate sqlMap;

	public CenterDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List<CenterDTO> centerListDB() {
		List<CenterDTO> list = sqlMap.selectList("centerListSQL");
		return list;
	}
	
	public CenterDTO centerOneDB(int co_idx) {
		CenterDTO dto = sqlMap.selectOne("centerOneSQL", co_idx);
		return dto;
	}

}
