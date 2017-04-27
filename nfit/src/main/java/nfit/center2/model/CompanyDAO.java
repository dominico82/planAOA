package nfit.center2.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import nfit.center.model.*;

public interface CompanyDAO {

	//회사 목록 나열 
	public List<CenterDTO> companyList(); 
	//회사 리스트 나열 목록
	public List<CenterDTO> companyListborad(int start,int end); 
	//회서 목록 검색
	public List<CenterDTO> companySearch(String keyword);
	//업체등록 
	public int company_add(CenterDTO vo,String menu,String filename);
	//업체등록2
	public void company_add2(CenterDTO vo,String menu);

	//업체 상세정보보기
	public CenterDTO companydetail(int co_idx);
	//업체 이미지 수정
	public void companyco_view(int co_idx,String co_view);
	//업체 이미지제외 수정
	public void co_listupdate(CenterDTO vo);
	//업체 정보삭제
	public void co_listdelete(int co_idx);
	//총 업체 숫자
	public int companyListcount();
	//업체별 이용시간 목록
	public List<UsetimeDTO> usetime_table(int co_idx);
	//업체별 이용가능 컨텐츠 목록
	public List<ContentDTO> content_list(int co_idx);
	//업체별 이용시간 수정
	public void usetime_table_update(int usetime_idx ,String usetime_time);
	//수정하기전 co_idx값 총값구하기 
	public int content_list_count(int co_idx);
	//업체 컨텐츠 수정하기
	public void content_list_update(int content_idx,int content_coin,String content1,String content2,
			String content3,String content4,String content5,String content6);
	//업체 이미지파일만등록
	public void updatenewfile(int co_idx,String co_view);
	//바로등록한 업체 co_idx갑 가져오기 
	public int sonnco_idx(String co_phone);
	//content 삭제
	public void content_delete(int co_idx);
	//usetime 삭제
	public void usetime_delete(int co_idx);
	//max함수 적용 co_idx값 구하는 메소드
	public int max_co_idx();
	//이용시간등록 메소드작성
	public void usetime_insert(UsetimeDTO vo);
	//컨탠츠 등록 메소드작성
	public void content_insert(ContentDTO vo);
	//전화번호로 기존업체 조회 
	public int oldCompany(String co_phone);
	//기존업체 컨탠츠등록
	public void oldCompanyin(ContentDTO vo);
	//업체 검색
	public List<CenterDTO> companySearch(String keyword,String keyfield,int start,int end);
	//업체 자동완성 보류
	public List<CenterDTO> searchAuto(String keyword,String keyfield);
}
