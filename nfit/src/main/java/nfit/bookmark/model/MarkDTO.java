package nfit.bookmark.model;

public class MarkDTO {

	String member_id;
	int co_idx;
	String co_name;
	
	
	public MarkDTO() {
		super();
	}


	public MarkDTO(String member_id, int co_idx, String co_name) {
		super();
		this.member_id = member_id;
		this.co_idx = co_idx;
		this.co_name = co_name;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getCo_idx() {
		return co_idx;
	}


	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
	}


	public String getCo_name() {
		return co_name;
	}


	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	
	
}
