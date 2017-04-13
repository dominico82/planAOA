package nfit.member.model;

import java.util.List;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	public int loginCheck(String member_id,String member_pwd);
	public String getUserInfo(String member_id);
	public MemberDTO getMemberInfo(String userid);
	public String idCheck(String member_id);
	public int memberModify(MemberDTO dto);
}
