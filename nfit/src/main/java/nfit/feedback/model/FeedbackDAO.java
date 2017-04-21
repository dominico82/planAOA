package nfit.feedback.model;

import java.util.List;



public interface FeedbackDAO {

	//댓글 추가
	public void feedbackinsert(FeedbackDTO dto);
	//댓글 삭제
	public void feedbackDelete(int feedback_index);
	//댓글 수정
	public void feedbackUpdate(FeedbackDTO dto);
	//댓글 리스트
	public List<FeedbackDTO> feedbackList(int co_idx);
	//댓글 상세정보
	public FeedbackDTO feebackDetail(int feedback_index);
	//업체별 댓글 갯수
	public int feedbackcount(int co_idx);
}
