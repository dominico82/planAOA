package nfit.center2.model;

public class CompanyUseTimeDTO {
	
	private int usetime_idx;
	private int co_idx;
	private String usetime_day;
	private String usetime_time;
	
	
	public CompanyUseTimeDTO() {
		super();
	}


	public CompanyUseTimeDTO(int usetime_idx, int co_idx, String usetime_day, String usetime_time) {
		super();
		this.usetime_idx = usetime_idx;
		this.co_idx = co_idx;
		this.usetime_day = usetime_day;
		this.usetime_time = usetime_time;
	}


	public int getUsetime_idx() {
		return usetime_idx;
	}


	public void setUsetime_idx(int usetime_idx) {
		this.usetime_idx = usetime_idx;
	}


	public int getCo_idx() {
		return co_idx;
	}


	public void setCo_idx(int co_idx) {
		this.co_idx = co_idx;
	}


	public String getUsetime_day() {
		return usetime_day;
	}


	public void setUsetime_day(String usetime_day) {
		this.usetime_day = usetime_day;
	}


	public String getUsetime_time() {
		return usetime_time;
	}


	public void setUsetime_time(String usetime_time) {
		this.usetime_time = usetime_time;
	}
	
	
	
	
}
