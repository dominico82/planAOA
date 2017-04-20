package nfit.help.model;

import java.util.List;

public interface HelpDAO {
	public String faqTop5();
	public int setHelpContents(HelpDTO dto);
	public List<HelpDTO> getHelpList();
	public List<HelpDTO> getHelpSerch(String category, String keyword, String tag);
	public HelpDTO getHelpContents(int idx);
	public int helpUpdate(HelpDTO dto);
	public int helpDel(int idx);
}
