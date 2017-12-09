package org.ajou.ww.model;

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
}
