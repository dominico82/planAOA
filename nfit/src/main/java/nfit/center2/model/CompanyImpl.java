package nfit.center2.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;
import nfit.center.model.*;

public class CompanyImpl implements CompanyDAO {

	//리모콘
	private SqlSessionTemplate sqlMap;
	// 핸들러
	public CompanyImpl(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//업체 내열
	public List<CenterDTO> companyList() {
		return sqlMap.selectList("centerList");
	}
	//업체 검색하기
	public List<CenterDTO> companySearch(String keyword) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("centerKeyword", keyword);
	}
	//업체 등록
	public int company_add(CenterDTO vo, String menu, String filename) {
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
	public CenterDTO companydetail(int co_idx) {
		
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
	public void co_listupdate(CenterDTO vo) {
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
	public List<CenterDTO> companyListborad(int start, int end) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlMap.selectList("companyListboard", map);
	}
	//업체별 이용시간
	public List<UsetimeDTO> usetime_table(int co_idx) {
		return sqlMap.selectList("usetime_table", co_idx);
	}
	//업체별 컨텐츠목록
	 public List<ContentDTO> content_list(int co_idx) {
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
	 // ajax로구현한 업체등록 
	 public void company_add2(CenterDTO vo, String menu) {
		 HashMap<String ,Object> map = new HashMap<String, Object>();
		map.put("co_name",vo.getCo_name());
		map.put("co_address", vo.getCo_address());
		map.put("co_class", menu);
		map.put("co_phone", vo.getCo_phone());
		map.put("co_regul", vo.getCo_regul());
		map.put("co_extra", vo.getCo_extra());
		map.put("co_avail", vo.getCo_avail());
		map.put("co_lat", vo.getCo_lat());
		map.put("co_lng", vo.getCo_lng());
		
		sqlMap.insert("insertPath", map);
	 }
	 //업체 이미지파일만 등록
	 public void updatenewfile(int co_idx, String co_view) {
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("co_idx", co_idx);
		map.put("co_view", co_view);
		 sqlMap.update("Newupdate", map);
	}
	public int sonnco_idx(String co_phone) {
		return sqlMap.selectOne("soonco_idx", co_phone);
	}
	//컨탠츠 테이블 로우삭제
	public void content_delete(int co_idx) {
		sqlMap.delete("content_delete", co_idx);
	}
	//usetime 테이블 로우삭제
	public void usetime_delete(int co_idx) {
		sqlMap.delete("usetime_delete", co_idx);
	}
	//max 함수이용 co_idx값 구하는 것
	public int max_co_idx() {
		return sqlMap.selectOne("maxco_idx");
	}
	//이용시간 등록 메소드
	public void usetime_insert(UsetimeDTO vo) {
		sqlMap.insert("usetime_low_insert", vo);
	}
	//컨텐츠 등록메소드
	public void content_insert(ContentDTO vo) {
		sqlMap.insert("content_low_insert", vo);
	}
	//전화번호로 기존업체 조회
	public int oldCompany(String co_phone) {
		return sqlMap.selectOne("oldCompanycon", co_phone);
	}
	public void oldCompanyin(ContentDTO vo) {
		sqlMap.insert("oldCompanyin", vo);
	}
	@Override
	//업체검색
	public List<CenterDTO> companySearch(String keyword, String keyfield, int start, int end) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("keyfield", keyfield);
		map.put("start", start);
		map.put("end", end);
		return sqlMap.selectList("companySearch",map);
	}
	
	//업체 자동완성 보류
	public List<CenterDTO> searchAuto(String keyword, String keyfield) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("keyfield", keyfield);
		return sqlMap.selectList("searchAuto", map);
	}
}
