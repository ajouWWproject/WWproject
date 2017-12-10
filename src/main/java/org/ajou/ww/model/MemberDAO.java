package org.ajou.ww.model;

public interface MemberDAO {
	//public MemberVO findMemberById(String id);

	public MemberVO login(MemberVO memberVO);

	public void register(MemberVO vo);

	public int checkId(String id);
	
	
	
}
