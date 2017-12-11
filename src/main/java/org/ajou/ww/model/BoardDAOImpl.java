package org.ajou.ww.model;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;	
	
	@Override
	public int write(BoardVO bvo){
		return sqlSessionTemplate.insert("board.write",bvo);
	}

	@Override
	public void insertFile(FileVO fvo) {
		sqlSessionTemplate.insert("board.insertFile",fvo);
	}

	@Override
	public List<CategoryVO> findCategoryList() {
		
		return sqlSessionTemplate.selectList("board.findCategoryList");
	}

	@Override
	public List<FolderVO> findFolderList() {
		
		return sqlSessionTemplate.selectList("board.findFolderList");
	}			
	
	@Override
	public List<BoardVO> getBoardList() {
		return sqlSessionTemplate.selectList("board.getBoardList");
	}

	@Override
	public CategoryVO findCategoryVOByNo(int categoryNo) {
		
		return sqlSessionTemplate.selectOne("board.findCategoryVOByNo", categoryNo);
	}

	@Override
	public FolderVO findFolderByNo(int folderNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("board.findFolderByNo", folderNo);
	}

	@Override
	public BoardVO findBoardByNo(String boardNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("board.findBoardByNo", boardNo);
	}

	@Override
	public void updateHit(String boardNo) {
		sqlSessionTemplate.update("board.updateHit", boardNo);
		
	}

	@Override
	public List<FileVO> findFileByBoardNo(String boardNo) {
		return sqlSessionTemplate.selectList("board.findFileByBoardNo", boardNo);
	}

	@Override
	public List<BoardVO> getBoardListByKeyword(String keyword) {
		
		return sqlSessionTemplate.selectList("board.getBoardListByKeyword", keyword);
	}

	@Override
	public List<BoardVO> getBoardListByCategory(String categoryNo) {
		return sqlSessionTemplate.selectList("board.getBoardListByCategoryNo", categoryNo);
	}

	@Override
	public void insertComment(CommentVO cvo) {
		sqlSessionTemplate.insert("board.insertComment", cvo);
		
	}

	@Override
	public List<CommentVO> findCommentVOByBoardNo(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("board.findCommentVOByBoardNo", boardNo);
	}
	
//	@Override
//	public BoardVO showContent(int no){
//		return (BoardVO)sqlSessionTemplate.selectOne("board.showContent",no);
//	}
//	
//	@Override
//	public void updateCount(int no){
//		sqlSessionTemplate.update("board.updateCount",no);
//	}
//	
//	@Override
//	public void deleteBoard(int no){
//		sqlSessionTemplate.delete("board.deleteBoard", no);
//	}
//	
//	@Override
//	public void updateBoard(BoardVO bvo){
//		sqlSessionTemplate.update("board.updateBoard", bvo);
//	}
//	
//	@Override
//	public int getTotalContentCount(){
//		return sqlSessionTemplate.selectOne("board.getTotalContentCount");
//	}
//	
//	

//
//	@Override
//	public List<BoardVO> getBoardList(MemberVO mvo) {
//		return sqlSessionTemplate.selectList("board.getBoardList", mvo);
//	}

}














