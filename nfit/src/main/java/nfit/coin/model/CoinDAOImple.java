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

	public MemberDTO getCoinInfo(String userid) {
		MemberDTO dto=sqlMap.selectOne("getCoinInfo", userid);
		return dto;
	}

	public int setCoinInfo(String userid, int coin) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_id", userid);
		map.put("member_coin", coin);
		int count=sqlMap.update("setCoinInfo", map);
		return count;
	}
	
	public int setPayInfo(int member_idx, String pmethod, int coin, int price, String pclass) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		map.put("pay_method", pmethod);
		map.put("pay_coin", coin);
		map.put("pay_price", price);
		map.put("pay_class", pclass);
		int result=sqlMap.insert("setPayInfo", map);
		return result;
	}

}
