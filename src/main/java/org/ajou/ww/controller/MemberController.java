package org.ajou.ww.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.BoardService;
import org.ajou.ww.model.MemberService;
import org.ajou.ww.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;


	@RequestMapping("login.do")
	public String login(MemberVO mvo, HttpServletRequest request) {
		String path = "";

		MemberVO loginVO = memberService.login(mvo);
		HttpSession session = request.getSession();

		if (loginVO != null) {
			session.setAttribute("mvo", loginVO);

			if (session != null) {
				MemberVO vo = (MemberVO) session.getAttribute("mvo");
			}

			path = "redirect:home.do";
		} else {
			path = "member/login_fail";
		}

		return path;
	}
	
	@RequestMapping("register.do")
	public String register(MemberVO mvo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("register.do 실행!!");
		System.out.print("넘어온 값 " + mvo);
		String path = "";

		memberService.register(mvo); // 회원가입
		MemberVO loginVO = memberService.login(mvo); // 바로 로그인

		if (loginVO != null) {
			session.setAttribute("mvo", loginVO);

			if (session != null) {
				MemberVO vo = (MemberVO) session.getAttribute("mvo");
			}

			path = "redirect:home.do";
		} else {
			path = "member/login_fail";
		}
		return path;
	}
	

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		return "home";
	}
	
}
