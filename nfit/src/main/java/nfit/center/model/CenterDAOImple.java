package nfit.center.model;

import java.util.List;
import java.util.StringTokenizer;

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
	public void InsertLatLngDB(CenterDTO latlngdto) {
		sqlMap.update("centerLatLngSQL", latlngdto);
	}
	public List<CenterDTO> centerSearchDB(String keyword) {
		List<CenterDTO> list=sqlMap.selectList("centerSearchSQL", keyword);
		return list;
	}
}
