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
		System.out.println("i reached here~2");
		List<CenterDTO> list = sqlMap.selectList("centerListSQL");
		if(list.size()>0){
			System.out.println("data load success");
		}else{
			System.out.println("data load fail");
		}
		return list;
	}
	
	public CenterDTO centerOneDB(int co_idx) {
		CenterDTO dto = sqlMap.selectOne("centerOneSQL", co_idx);
		return dto;
	}

}
