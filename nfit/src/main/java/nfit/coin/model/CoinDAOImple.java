package nfit.coin.model;

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

	public String setPayInfo() {

		return null;
	}

}
