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
	
	@Resource
	private BoardService boardService;

	@RequestMapping("login.do")
	public String login(MemberVO mvo, HttpServletRequest request) {
		System.out.println("login.do 실행!!");
		System.out.print("넘어온 값 " + mvo);
		String path = "";

		MemberVO loginVO = memberService.login(mvo);
		System.out.print("로그인 값 " + loginVO);
		HttpSession session = request.getSession();

		if (loginVO != null) {
			session.setAttribute("mvo", loginVO);
			System.out.println("로그인성공");

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
