package nfit.use.model;

import java.util.Date;

public class UseDTO {

	private String member_id;
	private int co_idx;
	private String co_name;
	private int usemember_coin;
	java.util.Date usepay_date;
	
	public UseDTO() {
		super();
	}
	public UseDTO(String member_id, int co_idx, String co_name, int usemember_coin, Date usepay_date) {
		super();
		this.member_id = member_id;
		this.co_idx = co_idx;
		this.co_name = co_name;
		this.usemember_coin = usemember_coin;
		this.usepay_date = usepay_date;
	}
	public String getmember_id() {
		return member_id;
	}
	public void setmember_id(String member_id) {
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
	public int getUsemember_coin() {
		return usemember_coin;
	}
	public void setUsemember_coin(int usemember_coin) {
		this.usemember_coin = usemember_coin;
	}
	public java.util.Date getUsepay_date() {
		return usepay_date;
	}
	public void setUsepay_date(java.util.Date usepay_date) {
		this.usepay_date = usepay_date;
	}
	
	
}
