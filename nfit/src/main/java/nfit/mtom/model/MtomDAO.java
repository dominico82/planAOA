package nfit.mtom.model;

import java.util.List;

import nfit.notice.model.NoticeDTO;

public interface MtomDAO {
	public List<MtomDTO> getHelpMtom(String id);
	public int setHelpMtom(MtomDTO dto);
	public int getTotalMtomCnt();
	public List<MtomDTO> getHelpMtomList(int cp, int ls);
	public MtomDTO getHelpMtomContents(int idx);
	public int setHelpMtomReply(MtomDTO dto);
	public int helpMtomDel(int idx);
	public int setHelpMtomUpdate(MtomDTO dto);
}
