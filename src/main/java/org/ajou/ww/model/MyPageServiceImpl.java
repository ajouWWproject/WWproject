package org.ajou.ww.model;

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
}
