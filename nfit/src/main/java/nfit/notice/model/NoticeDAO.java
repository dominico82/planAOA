package nfit.notice.model;

import java.util.*;

public interface NoticeDAO {
	public List<NoticeDTO> noticeList(int cp, int ls);
	public NoticeDTO getNoticeContents(int idx);
	public int getTotalCnt();
}
