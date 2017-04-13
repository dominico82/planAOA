package nfit.notice.model;

import java.util.Date;

public class NoticeDTO {
	int notice_idx;
	String notice_subject;
	String notice_content;
	int notice_top;
	int notice_event;
	java.util.Date notice_date;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int notice_idx, String notice_subject, String notice_content, int notice_top, int notice_event,
			Date notice_date) {
		super();
		this.notice_idx = notice_idx;
		this.notice_subject = notice_subject;
		this.notice_content = notice_content;
		this.notice_top = notice_top;
		this.notice_event = notice_event;
		this.notice_date = notice_date;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_top() {
		return notice_top;
	}

	public void setNotice_top(int notice_top) {
		this.notice_top = notice_top;
	}

	public int getNotice_event() {
		return notice_event;
	}

	public void setNotice_event(int notice_event) {
		this.notice_event = notice_event;
	}

	public java.util.Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(java.util.Date notice_date) {
		this.notice_date = notice_date;
	}
	
	
}
