package image;

import java.util.List;

public class ImageVO {
	private int product_no;
	private int image_no;
	private String imagepath;
	
	private List<ImageVO> list;
	
	
	public List<ImageVO> getList() {
		return list;
	}
	public void setList(List<ImageVO> list) {
		this.list = list;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getImage_no() {
		return image_no;
	}
	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
}
