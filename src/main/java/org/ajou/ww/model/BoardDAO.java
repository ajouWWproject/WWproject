package org.ajou.ww.model;

import java.util.List;

public interface BoardDAO {

	public  void write(BoardVO bvo);		

	public  BoardVO showContent(int no);

	public  void updateCount(int no);

	public  void deleteBoard(int no);

	public  void updateBoard(BoardVO bvo);

	public  int getTotalContentCount();
	
	public List<BoardVO> getBoardList();

	public List<BoardVO> getBoardList(MemberVO mvo);

}