package nfit.help.model;

import java.util.List;

import nfit.mtom.model.MtomDTO;

public interface HelpDAO {
	public List<HelpDTO> getFaqTop5();
	public int setHelpContents(HelpDTO dto);
	public List<HelpDTO> getHelpList();
	public List<HelpDTO> getHelpSerch(String category, String keyword, String tag, int cp, int ls);
	public HelpDTO getHelpContents(int idx);
	public int helpUpdate(HelpDTO dto);
	public int helpDel(int idx);
	public int increaseReadnum(int idx, int readnum);	
	public int getTotalSearchCnt(String category, String keyword, String tag);
}
