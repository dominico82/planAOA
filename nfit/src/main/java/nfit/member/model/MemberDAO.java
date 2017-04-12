package nfit.member.model;

import java.util.List;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	public int loginCheck(String member_id,String member_pwd);
	public String getUserInfo(String member_id);
	public List<MemberDTO> getMemberInfo(String member_id);
}
