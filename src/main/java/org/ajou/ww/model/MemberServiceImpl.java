package org.ajou.ww.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO memberVO){
		return memberDAO.login(memberVO);
	}
	
	@Override
	public void register(MemberVO memberVO) {
		memberDAO.register(memberVO);
	}
	
//	@Override
//	public MemberVO findMemberById(String id) {		
//		return memberDAO.findMemberById(id);
//	}

//	@Override
//	public int idcheck(String id) {		
//		return memberDAO.idcheck(id);
//	}
}
