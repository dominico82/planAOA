package nfit.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class memberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public memberDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	public int memberJoin(memberDTO dto){
		int count=sqlMap.insert("memberJoin", dto);
		return count;
	}
}
