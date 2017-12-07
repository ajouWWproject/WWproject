package org.ajou.ww.model;

public class FileVO {
	private int boardNo;
	private int fileNo;
	private String file_path;
	public FileVO() {
		super();
	}
	public FileVO(int boardNo, int fileNo, String file_path) {
		super();
		this.boardNo = boardNo;
		this.fileNo = fileNo;
		this.file_path = file_path;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	@Override
	public String toString() {
		return "FileVO [boardNo=" + boardNo + ", fileNo=" + fileNo + ", file_path=" + file_path + "]";
	}
	
	
}
