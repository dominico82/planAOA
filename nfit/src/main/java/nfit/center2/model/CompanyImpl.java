package nfit.center2.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

public class CompanyImpl implements CompanyDAO {

	//리모콘
	private SqlSessionTemplate sqlMap;
	// 핸들러
	public CompanyImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//업체 내열
	public List<CompanyListDTO> companyList() {
		return sqlMap.selectList("centerList");
	}
	//업체 검색하기
	public List<CompanyListDTO> companySearch(String keyword) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("centerKeyword", keyword);
	}
	//업체 등록
	public int company_add(CompanyListDTO vo, String menu, String filename) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("co_name",vo.getCo_name());
		map.put("co_address", vo.getCo_address());
		map.put("co_class", menu);
		map.put("co_phone", vo.getCo_phone());
		map.put("co_regul", vo.getCo_regul());
		map.put("co_extra", vo.getCo_extra());
		map.put("co_avail", vo.getCo_avail());
		map.put("co_view", filename);
		return  sqlMap.insert("companyadd", map);
	}
	//업체 상세보기
	public CompanyListDTO companydetail(int co_idx) {
		
		return sqlMap.selectOne("companydetail", co_idx);
	}
	//업체 이미지 수정
	public void companyco_view(int co_idx, String co_view) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("co_idx", co_idx);
		map.put("co_view", co_view);
		sqlMap.update("co_viewupdate", map);
	}
	//업체 이미지 제외수정
	public void co_listupdate(CompanyListDTO vo) {
		sqlMap.update("co_listupdate", vo);
	}
	//업체 정보삭제
	public void co_listdelete(int co_idx) {
		sqlMap.delete("co_listdelete", co_idx);
	}
	//총업체 숫자
	public int companyListcount() {
		return sqlMap.selectOne("companyListcount");
	}
	//업체 게시판뽑기
	public List<CompanyListDTO> companyListborad(int start, int end) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlMap.selectList("companyListboard", map);
	}
	//업체별 이용시간
	public List<CompanyUseTimeDTO> usetime_table(int co_idx) {
		return sqlMap.selectList("usetime_table", co_idx);
	}
	//업체별 컨텐츠목록
	 public List<CompanyContentDTO> content_list(int co_idx) {
		 return sqlMap.selectList("content_list", co_idx);
	 }
	 //업체별 이용시간 수정하기 
	 public void usetime_table_update(int usetime_idx, String usetime_time) {
		 	HashMap<String, Object> map = new HashMap<String, Object>();
		 	map.put("usetime_idx", usetime_idx);
		 	map.put("usetime_time", usetime_time);
		 	sqlMap.update("usetime_table_update", map);
	}
	 //co_idx값 카운트
	 public int content_list_count(int co_idx) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("content_list_count", co_idx);
	}
	 //업체 컨텐츠 수정하기 
	 public void content_list_update(int content_idx, int content_coin, String content1, String content2,
			String content3, String content4, String content5, String content6) {
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("content_idx", content_idx);
		 map.put("content_coin", content_coin);
		 map.put("content1", content1);
		 map.put("content2", content2);
		 map.put("content3", content3);
		 map.put("content4", content4);
		 map.put("content5", content5);
		 map.put("content6", content6);
		 
		 sqlMap.update("content_list_update",map);
	}
}
