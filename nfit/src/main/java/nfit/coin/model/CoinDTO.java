package nfit.coin.model;

import java.sql.Date;

public class CoinDTO {
	int member_idx;
	String pay_method;
	int pay_coin;
	int pay_price;
	java.sql.Date pay_date;
	String pay_class;
	
	public CoinDTO() {
		super();
	}

	public CoinDTO(int member_idx, String pay_method, int pay_coin, int pay_price, Date pay_date, String pay_class) {
		super();
		this.member_idx = member_idx;
		this.pay_method = pay_method;
		this.pay_coin = pay_coin;
		this.pay_price = pay_price;
		this.pay_date = pay_date;
		this.pay_class = pay_class;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public int getPay_coin() {
		return pay_coin;
	}

	public void setPay_coin(int pay_coin) {
		this.pay_coin = pay_coin;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public java.sql.Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(java.sql.Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_class() {
		return pay_class;
	}

	public void setPay_class(String pay_class) {
		this.pay_class = pay_class;
	}

	
}
