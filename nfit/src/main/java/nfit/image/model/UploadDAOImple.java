package nfit.image.model;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.MultipartFile;

import nfit.member.model.MemberDTO;
import nfit.notice.model.NoticeDTO;

public class UploadDAOImple implements UploadDAO {

	private SqlSessionTemplate sqlMap;
	
	public int setImage(MemberDTO member_idx, List<MultipartFile> files) throws IllegalStateException, IOException {
		
		String savePath = "C:/Users/wonjun/git/planAOA/nfit/src/main/webapp/resources/upload_images";
		
		int count = sqlMap.insert("setUpload", member_idx);
		
		for(int i=0; i<files.size(); i++){
//			System.out.println("사진 이름: "+files.get(i).getOriginalFilename());
			String fileName=files.get(i).getOriginalFilename();//파일을 저장하기 위해 이름을 가져온다.
			files.get(i).transferTo(new File(savePath+fileName));//파일을 업로드한다.
			int fcount=sqlMap.insert("setNoticePics", fileName);//DB에 사진 이름을 저장한다.
		}
		 return count;
	}

}
