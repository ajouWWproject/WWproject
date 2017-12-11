package org.ajou.ww.model;

import java.util.ArrayList;
import java.util.List;

public interface BoardDAO {

	public int write(BoardVO bvo);

	public void insertFile(FileVO fvo);

	public List<CategoryVO> findCategoryList();

	public List<FolderVO> findFolderList();		

	public List<BoardVO> getBoardList();

	public CategoryVO findCategoryVOByNo(int categoryNo);

	public FolderVO findFolderByNo(int folderNo);

	public BoardVO findBoardByNo(String boardNo);

	public void updateHit(String boardNo);

	public List<FileVO> findFileByBoardNo(String boardNo);

	public List<BoardVO> getBoardListByKeyword(String keyword);

	public List<BoardVO> getBoardListByCategory(String categoryNo);
	
	public void insertComment(CommentVO cvo);

	public List<CommentVO> findCommentVOByBoardNo(int boardNo);
	
//	public  BoardVO showContent(int no);
//
//	public  void updateCount(int no);
//
//	public  void deleteBoard(int no);
//
//	public  void updateBoard(BoardVO bvo);
//
//	public  int getTotalContentCount();
	
	

//	public List<BoardVO> getBoardList(MemberVO mvo);

}