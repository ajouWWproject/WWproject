package org.ajou.ww.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.MemberService;
import org.ajou.ww.model.MemberVO;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

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

	// @RequestMapping("findMemberById.do")
	// public String findMemberById(String id,Model model){
	// MemberVO vo=memberService.findMemberById(id);
	// if(vo!=null)
	// model.addAttribute("result", vo);
	// return "member/findbyid_result.tiles";
	// }
	// @RequestMapping(method=RequestMethod.POST,value="login.do")
	// public String login(MemberVO memberVO,HttpServletRequest request){
	// MemberVO vo=memberService.login(memberVO);
	// if(vo==null)
	// return "member/login_fail";
	// else{
	// HttpSession session=request.getSession();
	// session.setAttribute("mvo",vo);
	// return "redirect:home";
	// }
	// }

	// @RequestMapping(value="registerMember.do", method = RequestMethod.POST)
	// public String register(MemberVO vo) {
	// memberService.registerMember(vo);
	// return "redirect:registerResultView.do?id=" + vo.getId();
	// }
	// @RequestMapping("registerResultView.do")
	// public ModelAndView registerResultView(String id) {
	// MemberVO vo = memberService.findMemberById(id);
	// return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	// }
	// @RequestMapping("idcheckAjax.do")
	// @ResponseBody
	// public String idcheckAjax(String id) {
	// int count=memberService.idcheck(id);
	// return (count==0) ? "ok":"fail";
	// }
}
