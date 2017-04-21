package nfit.center2.model;

public class CompanyListDTO {

	private int co_idx;
	private String co_name;
	private String co_address;
	private String co_class;
	private String co_phone;
	private String co_regul;
	private String co_extra;
	private String co_view;
	private int co_usecount;
	private int co_lat;
	private int co_lng;
	private String co_avail;
	
	
	public CompanyListDTO() {
		super();
	}
public CompanyListDTO(int co_idx, String co_name, String co_address, String co_class, String co_phone,
			String co_regul, String co_extra, String co_view, int co_usecount, int co_lat, int co_lng,
			String co_avail) {
		super();
		this.co_idx = co_idx;
		this.co_name = co_name;
		this.co_address = co_address;
		this.co_class = co_class;
		this.co_phone = co_phone;
		this.co_regul = co_regul;
		this.co_extra = co_extra;
		this.co_view = co_view;
		this.co_usecount = co_usecount;
		this.co_lat = co_lat;
		this.co_lng = co_lng;
		this.co_avail = co_avail;
	}
/*
public CompanyListDTO(int co_idx, String co_name, String co_address, String co_class, String co_phone,
			String co_regul, String co_extra, int co_usecount, int co_lat, int co_lng, String co_avail) {
		super();
		this.co_idx = co_idx;
		this.co_name = co_name;
		this.co_address = co_address;
		this.co_class = co_class;
		this.co_phone = co_phone;
		this.co_regul = co_regul;
		this.co_extra = co_extra;
		this.co_usecount = co_usecount;
		this.co_lat = co_lat;
		this.co_lng = co_lng;
		this.co_avail = co_avail;
	}
*/

	public String getCo_view() {
		return co_view;
	}

	public void setCo_view(String co_view) {
		this.co_view = co_view;
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
	public String getCo_address() {
		return co_address;
	}
	public void setCo_address(String co_address) {
		this.co_address = co_address;
	}
	public String getCo_class() {
		return co_class;
	}
	public void setCo_class(String co_class) {
		this.co_class = co_class;
	}
	public String getCo_phone() {
		return co_phone;
	}
	public void setCo_phone(String co_phone) {
		this.co_phone = co_phone;
	}
	public String getCo_regul() {
		return co_regul;
	}
	public void setCo_regul(String co_regul) {
		this.co_regul = co_regul;
	}
	public String getCo_extra() {
		return co_extra;
	}
	public void setCo_extra(String co_extra) {
		this.co_extra = co_extra;
	}

	public int getCo_usecount() {
		return co_usecount;
	}
	public void setCo_usecount(int co_usecount) {
		this.co_usecount = co_usecount;
	}
	public int getCo_lat() {
		return co_lat;
	}
	public void setCo_lat(int co_lat) {
		this.co_lat = co_lat;
	}
	public int getCo_lng() {
		return co_lng;
	}
	public void setCo_lng(int co_lng) {
		this.co_lng = co_lng;
	}
	public String getCo_avail() {
		return co_avail;
	}
	public void setCo_avail(String co_avail) {
		this.co_avail = co_avail;
	}
	
	
}