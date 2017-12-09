package org.ajou.ww.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.BoardService;
import org.ajou.ww.model.BoardVO;
import org.ajou.ww.model.FileVO;
import org.ajou.ww.model.ListVO;
import org.ajou.ww.model.MemberVO;
import org.ajou.ww.model.MyPageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/myPage/")
public class MyPageController {
	
	@Resource
	private MyPageService myPageService;

	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO membervo = myPageService.getMemberInfo((MemberVO)session.getAttribute("mvo"));
		/*ListVO myBoardList = boardService.getBoardList();
		ListVO likeBoardList = boardService.getBoardList();*/

		request.setAttribute("mvo", membervo);
		/*model.addAttribute("myBoardList", myBoardList);
		model.addAttribute("likeBoardList", likeBoardList);*/
		return "mypage";
	}
}
