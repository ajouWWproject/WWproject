package org.ajou.ww.model;



import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAOImpl")
	private BoardDAO boardDAO;	
	@Override
	public int write(BoardVO bvo){
		return boardDAO.write(bvo);
	}
	@Override
	public void insertFile(FileVO fvo) {
		boardDAO.insertFile(fvo);
		
	}
	@Override
	public ArrayList<CategoryVO> findCategoryList() {
		
		return (ArrayList<CategoryVO>) boardDAO.findCategoryList();
	}
	@Override
	public ArrayList<FolderVO> findFolderList() {
		
		return (ArrayList<FolderVO>) boardDAO.findFolderList();
	}
	@Override
	public ArrayList<BoardVO> getBoardList() {
		return (ArrayList<BoardVO>) boardDAO.getBoardList();
	}
	@Override
	public CategoryVO findCategoryVOByNo(int categoryNo) {
		
		return boardDAO.findCategoryVOByNo(categoryNo);
	}
	@Override
	public FolderVO findFolderByNo(int folderNo) {
		// TODO Auto-generated method stub
		return boardDAO.findFolderByNo(folderNo);
	}
	@Override
	public BoardVO findBoardByNo(String boardNo) {
		
		return boardDAO.findBoardByNo(boardNo);
	}
	@Override
	public void updateHit(String boardNo) {
		boardDAO.updateHit(boardNo);
		
	}
	@Override
	public ArrayList<FileVO> findFileByBoardNo(String boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList<FileVO>) boardDAO.findFileByBoardNo(boardNo);
	}
	@Override
	public ArrayList<BoardVO> getBoardListByCategoryNo(String categoryNo) {
		return (ArrayList<BoardVO>)boardDAO.getBoardListByCategory(categoryNo);
	}
	
	@Override
	public ArrayList<BoardVO> getBoardListByKeywordOnWriter(String keyword) {
		return (ArrayList<BoardVO>)boardDAO.getBoardListByKeywordOnWriter(keyword);
	}
	@Override
	public ArrayList<BoardVO> getBoardListByKeywordOnProject(String keyword) {
		return (ArrayList<BoardVO>)boardDAO.getBoardListByKeywordOnProject(keyword);
	}	
	
	

		
//	@Override
//	public ListVO getBoardList(){				
//		return getBoardList("1");
//	}
//	@Override
//	public ListVO getBoardList(String pageNo){			
//		int totalCount=boardDAO.getTotalContentCount();
//		PagingBean pagingBean=null;
//		if(pageNo==null)
//			pagingBean=new PagingBean(totalCount);
//		else
//			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));		
//		/*HashMap<String,Integer> paramMap=new HashMap<String,Integer>();
//		paramMap.put("startRowNumber",pagingBean.getStartRowNumber());
//		paramMap.put("endRowNumber", pagingBean.getEndRowNumber());*/
//		return new ListVO(boardDAO.getBoardList(pagingBean),pagingBean);
//	}
//	
//	@Override
//	public BoardVO showContent(int no){
//		boardDAO.updateCount(no);
//		return boardDAO.showContent(no);
//	}
//	@Override
//	public void updateCount(int no){
//		boardDAO.updateCount(no);
//	}
//	@Override
//	public BoardVO showContentNoHit(int no){		
//		return boardDAO.showContent(no);
//	}	
//	
//	@Override
//	public void deleteBoard(int no){
//		boardDAO.deleteBoard(no);
//	}
//	
//	@Override
//	public void updateBoard(BoardVO bvo){
//		boardDAO.updateBoard(bvo);
//	}
	
}








