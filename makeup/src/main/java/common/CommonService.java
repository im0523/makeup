package common;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {
	String fileUpload(MultipartFile file, HttpSession ss, String category); 
}
