package nfit.center.model;

public class CenterDTO {

	private int co_idx;
	private String co_name;
	private String co_address;
	private String co_class;
	private String co_phone;
	private String co_regul;
	private String co_extra;
	private String co_view;
	private int co_usecount;
	private double co_lat;
	private double co_lng;
	private String co_avail;
	public CenterDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CenterDTO(int co_idx, String co_name, String co_address, String co_class, String co_phone, String co_regul,
			String co_extra, String co_view, int co_usecount, double co_lat, double co_lng, String co_avail) {
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
	public String getCo_view() {
		return co_view;
	}
	public void setCo_view(String co_view) {
		this.co_view = co_view;
	}
	public int getCo_usecount() {
		return co_usecount;
	}
	public void setCo_usecount(int co_usecount) {
		this.co_usecount = co_usecount;
	}
	public double getCo_lat() {
		return co_lat;
	}
	public void setCo_lat(double co_lat) {
		this.co_lat = co_lat;
	}
	public double getCo_lng() {
		return co_lng;
	}
	public void setCo_lng(double co_lng) {
		this.co_lng = co_lng;
	}
	public String getCo_avail() {
		return co_avail;
	}
	public void setCo_avail(String co_avail) {
		this.co_avail = co_avail;
	}
	
}
