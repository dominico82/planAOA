package nfit.use.model;

import java.util.Date;

public class UseDTO {

	private int paid_idx;
	private String member_id;
	private int co_idx;
	private String co_name;
	private int usemember_coin;
	private String use_date;
	
	public UseDTO() {
		super();
	}

	public UseDTO(int paid_idx, String member_id, int co_idx, String co_name, int usemember_coin, String use_date) {
		super();
		this.paid_idx = paid_idx;
		this.member_id = member_id;
		this.co_idx = co_idx;
		this.co_name = co_name;
		this.usemember_coin = usemember_coin;
		this.use_date = use_date;
	}

	public int getPaid_idx() {
		return paid_idx;
	}

	public void setPaid_idx(int paid_idx) {
		this.paid_idx = paid_idx;
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

	public int getUsemember_coin() {
		return usemember_coin;
	}

	public void setUsemember_coin(int usemember_coin) {
		this.usemember_coin = usemember_coin;
	}

	public String getUse_date() {
		return use_date;
	}

	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}
	
	
	
	
}
