package nfit.center.model;

public class SearchDTO {

	private CenterDTO centerdto;
	private ContentDTO contentdto;
	public SearchDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchDTO(CenterDTO centerdto, ContentDTO contentdto) {
		super();
		this.centerdto = centerdto;
		this.contentdto = contentdto;
	}
	public CenterDTO getCenterdto() {
		return centerdto;
	}
	public void setCenterdto(CenterDTO centerdto) {
		this.centerdto = centerdto;
	}
	public ContentDTO getContentdto() {
		return contentdto;
	}
	public void setContentdto(ContentDTO contentdto) {
		this.contentdto = contentdto;
	}
	
	
	
}
