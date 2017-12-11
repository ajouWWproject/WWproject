package org.ajou.ww.model;

import java.util.List;

public interface MyPageService {

	public MemberVO getMemberInfo(MemberVO memberVO);
	
	public int editMemberInfo(MemberVO memberVO);
	
	public List<BoardVO> getMyBoardList(MemberVO memberVO);
	
	public List<BoardVO> getLikeBoardList(MemberVO memberVO);

	public CategoryVO findCategoryVOByNo(int categoryNo);

	public FolderVO findFolderByNo(int folderNo);

	public BoardVO findBoardByNo(String boardNo);

}
