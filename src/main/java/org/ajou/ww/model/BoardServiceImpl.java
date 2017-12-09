package org.ajou.ww.model;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAOImpl")
	private BoardDAO boardDAO;	
	@Override
	public void write(BoardVO bvo){
		boardDAO.write(bvo);
	}	
	/*@Override
	public ListVO getBoardList(){				
		return getBoardList("1");
	}*/
	@Override
	public ListVO getBoardList() {
		return new ListVO(boardDAO.getBoardList());
	}
	
	
	
	@Override
	public ListVO getBoardList(MemberVO mvo){			
		int totalCount = boardDAO.getTotalContentCount();
		return new ListVO(boardDAO.getBoardList(mvo));
	}
	
	
	
	@Override
	public BoardVO showContent(int no){
		boardDAO.updateCount(no);
		return boardDAO.showContent(no);
	}
	@Override
	public void updateCount(int no){
		boardDAO.updateCount(no);
	}
	@Override
	public BoardVO showContentNoHit(int no){		
		return boardDAO.showContent(no);
	}	
	
	@Override
	public void deleteBoard(int no){
		boardDAO.deleteBoard(no);
	}
	
	@Override
	public void updateBoard(BoardVO bvo){
		boardDAO.updateBoard(bvo);
	}
	
	
	
		
}








