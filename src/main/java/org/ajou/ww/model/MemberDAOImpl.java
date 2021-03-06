package org.ajou.ww.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO{
	@Resource
	private SqlSessionTemplate template;
//	@Override
//	public MemberVO findMemberById(String id) {
//		return template.selectOne("member.findMemberById", id);
//	}
	@Override
	public MemberVO login(MemberVO memberVO) {
		return template.selectOne("member.login", memberVO);
	}
	
	@Override
	public void register(MemberVO memberVO) {
		template.insert("member.register", memberVO);			
	}
	
	@Override
	public int checkId(String id) {
		return template.selectOne("member.checkId",id);				
	}	
}
