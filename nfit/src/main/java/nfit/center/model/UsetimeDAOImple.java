package nfit.center.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class UsetimeDAOImple implements UsetimeDAO {

	private SqlSessionTemplate sqlMap;

	public UsetimeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<UsetimeDTO> usetimeDB(int co_idx) {
		List<UsetimeDTO> list = sqlMap.selectList("usetimeSQL", co_idx);
		return list;
	}
	
}
