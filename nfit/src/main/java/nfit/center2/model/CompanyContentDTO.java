package nfit.center2.model;

public class CompanyContentDTO {


	private int content_idx;
	private int co_idx;
	private int content_coin;
	private String content1;
	private String content2;
	private String content3;
	private String content4;
	private String content5;
	private String content6;
	
	public CompanyContentDTO() {
		super();
	}
	public CompanyContentDTO(int content_idx, int co_idx, int content_coin, String content1, String content2,
			String content3, String content4, String content5, String content6) {
		super();
		this.content_idx = content_idx;
		this.co_idx = co_idx;
		this.content_coin = content_coin;
		this.content1 = content1;
		this.content2 = content2;
		this.content3 = content3;
		this.content4 = content4;
		this.content5 = content5;
		this.content6 = content6;
	}
	public int getContent_idx() {
		return content_idx;
	}
	public void setContent_idx(int content_idx) {
		this.content_idx = content_idx;
	}
	public int getCo_idx() {
		return co_idx;
	}
	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
	}
	public int getContent_coin() {
		return content_coin;
	}
	public void setContent_coin(int content_coin) {
		this.content_coin = content_coin;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public String getContent4() {
		return content4;
	}
	public void setContent4(String content4) {
		this.content4 = content4;
	}
	public String getContent5() {
		return content5;
	}
	public void setContent5(String content5) {
		this.content5 = content5;
	}
	public String getContent6() {
		return content6;
	}
	public void setContent6(String content6) {
		this.content6 = content6;
	}
}
