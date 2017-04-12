package nfit.member.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	public static final int NOT_ID=1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap=sqlMap;
	}
	
	public int memberJoin(MemberDTO dto){
		int count=sqlMap.insert("memberJoin",dto);
		return count;
	}
	
	public int loginCheck(String member_id,String member_pwd){
		MemberDTO dto = sqlMap.selectOne("memberLogin", member_id);
		try{
			if(dto!=null){
				if(member_pwd.equals(dto.getMember_pwd())) {
					return LOGIN_OK;
				}else{
					return NOT_PWD;
				}
			}else{
				return NOT_ID;
			}
		}catch(Exception e){
			e.printStackTrace();
			return  ERROR;
		}
		/*if(member_pwd.equals(dto.getMember_pwd())) {
			return LOGIN_OK;
		}else if(!member_pwd.equals(dto.getMember_pwd())){
			return NOT_PWD;
		}else if(!member_id.equals(dto.getMember_id())){
			return NOT_ID;
		}else{
			return ERROR;
		}*/
		
	}
	
	public String getUserInfo(String member_id){
		String userInfo=sqlMap.selectOne("getUserInfo",member_id);
		return userInfo;
	}
	
	public MemberDTO getMemberInfo(String userid){
		MemberDTO dto = sqlMap.selectOne("memberInfo", userid);
		return dto;
	}
	public String idCheck(String member_id){
		String result=sqlMap.selectOne("idCheck",member_id);
//		System.out.println(result);
		return result;
		
	}
	
}





























