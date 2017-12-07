package org.ajou.ww.model;

public class CategoryVO {
	private int categoryNo;
	private String categoryName;
	private String photo_path;
	
	
	
	public CategoryVO() {
		super();
	}


	public CategoryVO(int categoryNo, String categoryName, String photo_path) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.photo_path = photo_path;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getPhoto_path() {
		return photo_path;
	}


	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}


	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", photo_path=" + photo_path
				+ "]";
	}
	
	
	
	
	
}
