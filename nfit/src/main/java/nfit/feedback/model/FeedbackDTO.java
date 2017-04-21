package nfit.feedback.model;

import java.util.Date;

public class FeedbackDTO {

	private int feedback_index;
	private int co_idx;
	private String member_id;
	private Date feedback_date;
	private int feedback_score;
	private String feedback_content;
	
	
	public FeedbackDTO() {
		super();
	}
	public FeedbackDTO(int feedback_index, int co_idx, String member_id, Date feedback_date, int feedback_score,
			String feedback_content) {
		super();
		this.feedback_index = feedback_index;
		this.co_idx = co_idx;
		this.member_id = member_id;
		this.feedback_date = feedback_date;
		this.feedback_score = feedback_score;
		this.feedback_content = feedback_content;
	}
	public int getFeedback_index() {
		return feedback_index;
	}
	public void setFeedback_index(int feedback_index) {
		this.feedback_index = feedback_index;
	}
	public int getCo_idx() {
		return co_idx;
	}
	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getFeedback_date() {
		return feedback_date;
	}
	public void setFeedback_date(Date feedback_date) {
		this.feedback_date = feedback_date;
	}
	public int getFeedback_score() {
		return feedback_score;
	}
	public void setFeedback_score(int feedback_score) {
		this.feedback_score = feedback_score;
	}
	public String getFeedback_content() {
		return feedback_content;
	}
	public void setFeedback_content(String feedback_content) {
		this.feedback_content = feedback_content;
	}
	
}
