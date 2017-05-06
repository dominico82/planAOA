package nfit.center.model;

import java.util.List;

import nfit.bookmark.model.MarkDTO;

public interface CenterDAO {

	public List<CenterDTO> centerListDB();
	public CenterDTO centerOneDB(int co_idx);
	public void InsertLatLngDB(CenterDTO latlngdto);
	public List<CenterDTO> centerSearchDB(String keyword);
	public List<MarkDTO> markDB(String user_id);
}
