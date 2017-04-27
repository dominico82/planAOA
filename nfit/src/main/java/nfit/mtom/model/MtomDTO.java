package nfit.mtom.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MtomDTO {
	
	int qa_idx;
	String member_id;
	String qa_subject;
	String qa_content;
	String qa_answer;
	String qa_checked;
	
	//제이슨으로 date타입을 불러올때 사용
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm", timezone="GMT+9")
	java.util.Date qa_date;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm", timezone="GMT+9")
	java.util.Date qa_adate;
	
	public MtomDTO() {
		super();
	}

	public MtomDTO(int qa_idx, String member_id, String qa_subject, String qa_content, String qa_answer,
			String qa_checked, Date qa_date, Date qa_adate) {
		super();
		this.qa_idx = qa_idx;
		this.member_id = member_id;
		this.qa_subject = qa_subject;
		this.qa_content = qa_content;
		this.qa_answer = qa_answer;
		this.qa_checked = qa_checked;
		this.qa_date = qa_date;
		this.qa_adate = qa_adate;
	}

	public int getQa_idx() {
		return qa_idx;
	}

	public void setQa_idx(int qa_idx) {
		this.qa_idx = qa_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQa_subject() {
		return qa_subject;
	}

	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getqa_answer() {
		return qa_answer;
	}

	public void setqa_answer(String qa_answer) {
		this.qa_answer = qa_answer;
	}

	public String getQa_checked() {
		return qa_checked;
	}

	public void setQa_checked(String qa_checked) {
		this.qa_checked = qa_checked;
	}

	public java.util.Date getQa_date() {
		return qa_date;
	}

	public void setQa_date(java.util.Date qa_date) {
		this.qa_date = qa_date;
	}

	public java.util.Date getQa_adate() {
		return qa_adate;
	}

	public void setQa_adate(java.util.Date qa_adate) {
		this.qa_adate = qa_adate;
	}
	
	
}
