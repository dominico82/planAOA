package nfit.notice.model;

import java.io.IOException;
import java.util.*;
import org.springframework.web.multipart.MultipartFile;

public interface NoticeDAO {
	public static final String SAVEPATH="C:/Users/Administrator/Documents/AOA_Enfit/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/nfit/resources/file/upload/";
	
	public List<NoticeDTO> noticeList(int cp, int ls);
//	public Map noticeList(Map param);
	public NoticeDTO getNoticeContents(int idx);
	public List<String> getNoticePics(int idx);
	public int setNoticeContents(NoticeDTO dto, List<MultipartFile> files) throws IllegalStateException, IOException;
	public int getTotalCnt();
	public int noticeUpdate(NoticeDTO dto, List<MultipartFile> files) throws IllegalStateException, IOException;
	public int noticeDel(int idx);
}
