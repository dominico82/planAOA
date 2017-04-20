package nfit.member.model;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import nfit.coin.model.CoinDTO;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	public int loginCheck(String member_id,String member_pwd);
	public String getUserInfo(String member_id);
	public MemberDTO getMemberInfo(String userid);
	public String idCheck(String member_id);
	public int memberModify(MemberDTO dto);
	public String memberIdFind(String member_name,String member_email);
	public String membmerPwdFind(String member_id,String member_name,String member_email);
	public int setImage(String id, MultipartFile files) throws IllegalStateException, IOException;
	public List<MemberDTO>memberList(int cp,int ls);
	public List<CoinDTO> getPayInfo(int member_idx);
	public String getImage(int member_idx);
	public int getTotalCnt();
	public int memberDelete(String member_id);
}
