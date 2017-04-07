package nfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import nfit.file.model.FileDTO;

import java.io.*;

@Controller
public class FileController {

	@RequestMapping("fileUpload.do")
	public String fileUpload2(MultipartHttpServletRequest req){	//MultipartHttpServletRequest 를 이용한 업로드방식
		String writer = req.getParameter("writer");
		MultipartFile upload = req.getFile("upload");
		copyInto(writer, upload);
		return "file/fileSuccess";
	}
	/**파일 복사 관련 사용자 정의 메서드*/
	private void copyInto(String writer, MultipartFile upload){
		
		try {
			byte bytes[] = upload.getBytes();
			System.out.println("작성자:"+writer);
			System.out.println("파일명:"+upload.getOriginalFilename());
			File outFile = new File("c:/wonjun/upload/"+upload.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
