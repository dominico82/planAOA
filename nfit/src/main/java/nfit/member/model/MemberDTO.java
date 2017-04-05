package nfit.member.model;

import java.sql.*;

public class MemberDTO {

	private String member_id;
	private int member_idx;
	private String member_pwd;
	private String member_name;
	private String member_addr;
	private String member_sex;
	private String member_birth;
	private String member_email;
	private String member_tel;
	private int member_tall;
	private int member_weight;
	private int member_type;
	private int member_coin;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public int getMember_tall() {
		return member_tall;
	}
	public void setMember_tall(int member_tall) {
		this.member_tall = member_tall;
	}
	public int getMember_weight() {
		return member_weight;
	}
	public void setMember_weight(int member_weight) {
		this.member_weight = member_weight;
	}
	public int getMember_type() {
		return member_type;
	}
	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}
	public int getMember_coin() {
		return member_coin;
	}
	public void setMember_coin(int member_coin) {
		this.member_coin = member_coin;
	}
	public MemberDTO() {
		super();
	}
	public MemberDTO(String member_id, int member_idx, String member_pwd, String member_name, String member_addr,
			String member_sex, String member_birth, String member_email, String member_tel, int member_tall,
			int member_weight, int member_type, int member_coin) {
		super();
		this.member_id = member_id;
		this.member_idx = member_idx;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_addr = member_addr;
		this.member_sex = member_sex;
		this.member_birth = member_birth;
		this.member_email = member_email;
		this.member_tel = member_tel;
		this.member_tall = member_tall;
		this.member_weight = member_weight;
		this.member_type = member_type;
		this.member_coin = member_coin;
	}

	
}
