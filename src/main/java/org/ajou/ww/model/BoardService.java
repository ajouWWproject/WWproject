package org.ajou.ww.model;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	public int write(BoardVO bvo);

	public void insertFile(FileVO fvo);

	public ArrayList<CategoryVO> findCategoryList();

	public ArrayList<FolderVO> findFolderList();	
	
	public  ArrayList<BoardVO> getBoardList();

	public CategoryVO findCategoryVOByNo(int categoryNo);

	public FolderVO findFolderByNo(int folderNo);

	public BoardVO findBoardByNo(String boardNo);

	public void updateHit(String boardNo);
	

	
//	public  ListVO getBoardList(String pageNo);
//	public  BoardVO showContent(int no);	
//	public BoardVO showContentNoHit(int no);
//	public  void deleteBoard(int no);
//	public  void updateBoard(BoardVO bvo);
//	public  void updateCount(int no);	

	
}