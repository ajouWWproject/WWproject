package org.ajou.ww.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Resource
	private MyPageDAO mypageDAO;
	
	@Override
	public MemberVO getMemberInfo(MemberVO memberVO){
		return mypageDAO.getMemberInfo(memberVO);
	}
	
	@Override
	public int editMemberInfo(MemberVO memberVO){
		return mypageDAO.editMemberInfo(memberVO);
	}

	@Override
	public List<BoardVO> getMyBoardList(MemberVO memberVO) {
		return mypageDAO.getMyBoardList(memberVO);
	}

	@Override
	public List<BoardVO> getLikeBoardList(MemberVO memberVO) {
		return mypageDAO.getLikeBoardList(memberVO);
	}

	/*@Override
	public CategoryVO findCategoryVOByNo(int categoryNo) {
		
		return mypageDAO.findCategoryVOByNo(categoryNo);
	}
	@Override
	public FolderVO findFolderByNo(int folderNo) {
		// TODO Auto-generated method stub
		return mypageDAO.findFolderByNo(folderNo);
	}
	@Override
	public BoardVO findBoardByNo(String boardNo) {
		
		return mypageDAO.findBoardByNo(boardNo);
	}*/
}
