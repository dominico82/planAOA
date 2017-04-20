package nfit.member.model;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import nfit.coin.model.CoinDTO;


public class MemberDAOImple implements MemberDAO {

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
	private SqlSessionTemplate sqlMap;

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(MemberDTO dto) {
		int count = sqlMap.insert("memberJoin", dto);
		return count;
	}

	public int loginCheck(String member_id, String member_pwd) {
		MemberDTO dto = sqlMap.selectOne("memberLogin", member_id);
		try {
			if (dto != null) {
				if (member_pwd.equals(dto.getMember_pwd())) {
					return LOGIN_OK;
				} else {
					return NOT_PWD;
				}
			} else {
				return NOT_ID;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		/*
		 * if(member_pwd.equals(dto.getMember_pwd())) { return LOGIN_OK; }else
		 * if(!member_pwd.equals(dto.getMember_pwd())){ return NOT_PWD; }else
		 * if(!member_id.equals(dto.getMember_id())){ return NOT_ID; }else{
		 * return ERROR; }
		 */

	}

	public String getUserInfo(String member_id) {
		String userInfo = sqlMap.selectOne("getUserInfo", member_id);
		return userInfo;
	}

	public MemberDTO getMemberInfo(String userid) {
		MemberDTO dto = sqlMap.selectOne("memberInfo", userid);
		return dto;
	}

	public String idCheck(String member_id) {
		String result = sqlMap.selectOne("idCheck", member_id);
		if (result == null) {
			result = "";
		}
		return result;

	}

	public int memberModify(MemberDTO dto) {
		int count = sqlMap.insert("memberUpdate", dto);
		return count;
	}

	public String memberIdFind(String member_name,String member_email) {
		MemberDTO dto = sqlMap.selectOne("membeIdFind", member_name);
		if(dto!=null){
			if(member_email.equals(dto.getMember_email())){
				String find = sqlMap.selectOne("memberIdfind2", member_email);
				if(find!=null){
					String result="찾으시는 아이디는 "+find+"입니다.";
					return result;
				}else{
					String result="잘못된 이메일 입니다.";
					return result;
				}
			}else{
				String result="이름과 이메일이 일치하지 않습니다.";
				return result;
			}
		}else{
			String result = "잘못 된 이름입니다.";
			return result;
		}
		
	}
	public String membmerPwdFind(String member_id,String member_name,String member_email){
		MemberDTO dto=sqlMap.selectOne("memberPw1",member_id);
		if(dto!=null){
			if(member_name.equals(dto.getMember_name())){
				if(member_email.equals(dto.getMember_email())){
					String id=sqlMap.selectOne("memberPw2",member_id);
					String result="찾으시는 ID의 비밀번호는 "+id+"입니다. 비밀번호를 변경해주세요";
					return result;
				}else{
					String result="이메일이 일치하지 않습니다.";
					return result;
				}
			}else{
				String result="이름이 일치하지 않습니다.";
				return result;
			}
		}else{
			String result="존재하지 않는 ID입니다.";
			return result;
		}
		
		
	}
	
	public int setImage(String id, MultipartFile files) throws IllegalStateException, IOException {
		
		String savePath = "C:/Users/wonjun/git/planAOA/nfit/src/main/webapp/resources/upload_images/";
		
		HashMap map = new HashMap();
		map.put("member_id", id);
		map.put("pic_name", files.getOriginalFilename());
		int count = sqlMap.insert("setUpload", map);
		
		files.transferTo(new File(savePath+files.getOriginalFilename()));//파일을 업로드한다.
		return count;
		
	}

	public List<MemberDTO>memberList(int cp,int ls){
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map param=new HashMap();
		param.put("startnum", startnum);
		param.put("endnum", endnum);
		List<MemberDTO> list=sqlMap.selectList("adminList",param);
		return list;
	}
	public int getTotalCnt() {
		int count=sqlMap.selectOne("membertotalCnt");
		return count;
	}
	
	public List<CoinDTO> getPayInfo(int member_idx){
		List<CoinDTO> dto = sqlMap.selectList("payInfo", member_idx);
		return dto;
	}
	
	public String getImage(int member_idx){
		String pic = sqlMap.selectOne("getPic", member_idx);
		return pic;
	}
	public int memberDelete(String member_id){
		int count=sqlMap.delete("memberDeleteAdmin",member_id);
		return count;
	}
}






















