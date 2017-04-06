package nfit.member.model;

import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	
	public int memberJoin(MemberDTO dto){
		int count=sqlMap.insert("memberJoin",dto);
		return count;
	}
	/*public int loginCheck(String member_id,String member_pwd){
		int count=sqlMap.select("memberLogin", member_id, member_pwd);
	}
*/
	
}
