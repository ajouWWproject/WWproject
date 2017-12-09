package org.ajou.ww.model;

public class FolderVO {
	private int folderNo;
	private String folderName;
	public FolderVO() {
		super();
	}
	public FolderVO(int folderNo, String folderName) {
		super();
		this.folderNo = folderNo;
		this.folderName = folderName;
	}
	public int getFolderNo() {
		return folderNo;
	}
	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	@Override
	public String toString() {
		return "FolderVO [folderNo=" + folderNo + ", folderName=" + folderName + "]";
	}
	
	
}
