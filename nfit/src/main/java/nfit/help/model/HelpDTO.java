package nfit.help.model;

public class HelpDTO {
	int faq_idx;
	String faq_category;
	String faq_tag;
	String faq_subject;
	String faq_content;
	int faq_readnum;
	
	public HelpDTO() {
		super();
	}

	public HelpDTO(int faq_idx, String faq_category, String faq_tag, String faq_subject, String faq_content,
			int faq_readnum) {
		super();
		this.faq_idx = faq_idx;
		this.faq_category = faq_category;
		this.faq_tag = faq_tag;
		this.faq_subject = faq_subject;
		this.faq_content = faq_content;
		this.faq_readnum = faq_readnum;
	}

	public int getFaq_idx() {
		return faq_idx;
	}

	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

	public String getFaq_tag() {
		return faq_tag;
	}

	public void setFaq_tag(String faq_tag) {
		this.faq_tag = faq_tag;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public int getFaq_readnum() {
		return faq_readnum;
	}

	public void setFaq_readnum(int faq_readnum) {
		this.faq_readnum = faq_readnum;
	}

	
	
}
