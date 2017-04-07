package nfit.coin.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import nfit.member.model.MemberDTO;

public class CoinDAOImple implements CoinDAO {
		
	private SqlSessionTemplate sqlMap;
	
	public CoinDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}

	public MemberDTO getPayInfo(String userid) {
		MemberDTO dto=sqlMap.selectOne("getCoinInfo", userid);
		return dto;
	}

	public int setPayInfo(String userid, int coin) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_id", userid);
		map.put("member_coin", coin);
		int count=sqlMap.update("setCoinInfo", map);
		return count;
	}

}
