package org.ajou.ww.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private int boardNo;
	private int fileNo;
	private String file;
	public FileVO() {
		super();
	}
	public FileVO(int boardNo, int fileNo, String file) {
		super();
		this.boardNo = boardNo;
		this.fileNo = fileNo;
		this.file = file;
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "FileVO [boardNo=" + boardNo + ", fileNo=" + fileNo + ", file=" + file + "]";
	}
	
	
	
	
	
	
	
}
