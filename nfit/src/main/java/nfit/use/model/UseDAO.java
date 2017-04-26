package nfit.use.model;

import java.util.List;

public interface UseDAO {

	public int getTotalCnt();
	public List<UseDTO> useList(int cp,int ls);
}
