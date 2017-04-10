package nfit.center.model;

import java.util.List;

public interface CenterDAO {

	public List<CenterDTO> centerListDB();
	public CenterDTO centerOneDB(int co_idx);
}
