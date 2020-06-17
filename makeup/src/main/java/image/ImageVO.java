package image;

import java.util.List;

public class ImageVO {
	private int product_no;
	private int image_no;
	private String imagepath;
	private List<ImageVO> imgList;
	
	
	public List<ImageVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ImageVO> imgList) {
		this.imgList = imgList;
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
	public String setImagepath(String imagepath) {
		return this.imagepath = imagepath;
	}
}
