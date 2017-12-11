package org.ajou.ww.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MyPageDAOImpl implements MyPageDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public MemberVO getMemberInfo(MemberVO memberVO) {
		return template.selectOne("mypage.getMemberInfo", memberVO);
	}
	
	@Override
	public int editMemberInfo(MemberVO memberVO) {
		return template.update("mypage.editMemberInfo", memberVO);
	}

	@Override
	public List<BoardVO> getMyBoardList(MemberVO memberVO) {
		return template.selectList("mypage.getMyBoardList", memberVO);
	}

	@Override
	public List<BoardVO> getLikeBoardList(MemberVO memberVO) {
		return template.selectList("mypage.getLikeBoardList", memberVO);
	}
	
	/*@Override
	public CategoryVO findCategoryVOByNo(int categoryNo) {
		return template.selectOne("mypage.findCategoryVOByNo", categoryNo);
	}

	@Override
	public FolderVO findFolderByNo(int folderNo) {
		return template.selectOne("mypage.findFolderByNo", folderNo);
	}

	@Override
	public BoardVO findBoardByNo(String boardNo) {
		return template.selectOne("mypage.findBoardByNo", boardNo);
	}*/
}
