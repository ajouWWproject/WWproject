package org.ajou.ww.model;

public interface MemberService {

	//MemberVO findMemberById(String id);

	public MemberVO login(MemberVO memberVO);

	public void register(MemberVO memberVO);
//
//	int idcheck(String id);

}
