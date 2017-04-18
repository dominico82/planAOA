package nfit.image.model;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import nfit.member.model.MemberDTO;
import nfit.notice.model.NoticeDTO;

public interface UploadDAO {

	public int setImage(MemberDTO member_idx, List<MultipartFile> files) throws IllegalStateException, IOException;
}
