package nfit.center2.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import nfit.center2.model.*;

public interface CompanyDAO {

	//회사 목록 나열 
	public List<CompanyListDTO> companyList(); 
	//회사 리스트 나열 목록
	public List<CompanyListDTO> companyListborad(int start,int end); 
	//회서 목록 검색
	public List<CompanyListDTO> companySearch(String keyword);
	//업체등록 
	public int company_add(CompanyListDTO vo,String menu,String filename);
	//업체 상세정보보기
	public CompanyListDTO companydetail(int co_idx);
	//업체 이미지 수정
	public void companyco_view(int co_idx,String co_view);
	//업체 이미지제외 수정
	public void co_listupdate(CompanyListDTO vo);
	//업체 정보삭제
	public void co_listdelete(int co_idx);
	//총 업체 숫자
	public int companyListcount();
	//업체별 이용시간 목록
	public List<CompanyUseTimeDTO> usetime_table(int co_idx);
	//업체별 이용가능 컨텐츠 목록
	public List<CompanyContentDTO> content_list(int co_idx);
	//업체별 이용시간 수정
	public void usetime_table_update(int usetime_idx ,String usetime_time);
	//수정하기전 co_idx값 총값구하기 
	public int content_list_count(int co_idx);
	//업체 컨텐츠 수정하기
	public void content_list_update(int content_idx,int content_coin,String content1,String content2,
			String content3,String content4,String content5,String content6);
	
}
