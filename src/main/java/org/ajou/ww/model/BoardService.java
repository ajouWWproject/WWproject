package org.ajou.ww.model;




public interface BoardService {
	public  void write(BoardVO bvo);	
	public  ListVO getBoardList();
	public  BoardVO showContent(int no);	
	public BoardVO showContentNoHit(int no);
	public  void deleteBoard(int no);
	public  void updateBoard(BoardVO bvo);
	public  void updateCount(int no);
	public ListVO getBoardList(MemberVO mvo);	
}