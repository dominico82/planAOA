package nfit.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {


	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	public int memberJoin(MemberDTO dto){
		int count=sqlMap.insert("memberJoin", dto);
		return count;
	}

}
