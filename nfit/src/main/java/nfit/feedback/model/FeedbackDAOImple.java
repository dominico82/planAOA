package nfit.feedback.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


public class FeedbackDAOImple implements FeedbackDAO {
	private SqlSessionTemplate sqlMap;
	
	
	public FeedbackDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	//댓글 추가
	public void feedbackinsert(FeedbackDTO dto) {
		sqlMap.insert("FeedBackinsert", dto);
	}
	//댓글 삭제
	public void feedbackDelete(int feedback_index) {
		sqlMap.delete("FeedBackdelete", feedback_index);
	}
	//댓글수정
	public void feedbackUpdate(FeedbackDTO dto) {
		sqlMap.update("FeedBackupdate", dto);
	}
	//댓글 목록
	public List<FeedbackDTO> feedbackList(int co_idx) {
		return sqlMap.selectList("FeedBacklist", co_idx);
	}
	//댓글 상세보기
	public FeedbackDTO feebackDetail(int feedback_index) {
			FeedbackDTO dto = sqlMap.selectOne("FeedBackdetail", feedback_index);
		return dto;
	}
	//업체별댓글갯수
	public int feedbackcount(int co_idx) {
		return sqlMap.selectOne("count", co_idx);
	}

}
