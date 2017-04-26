package nfit.use.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class UseDAOImple implements UseDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public UseDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count;
	}
	
	public List<UseDTO> useList(int cp,int ls){
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map param=new HashMap<>();
		param.put("startnum", startnum);
		param.put("endnum", endnum);
		List<UseDTO>list=sqlMap.selectList("useCoinList",param);
		return list;
	}
}
