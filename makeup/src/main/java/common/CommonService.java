package common;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {
	// 파일 업로드
	String fileUpload(MultipartFile file, HttpSession ss, String category);
	
	//응답 받는건 파일을 받는 처리 void -> File
	File fileDownload(String name, String path, HttpSession ss, HttpServletResponse response);
}
