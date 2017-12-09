package org.ajou.ww.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.BoardService;
import org.ajou.ww.model.BoardVO;
import org.ajou.ww.model.FileVO;
import org.ajou.ww.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource(name = "boardServiceImpl")
	private org.ajou.ww.model.BoardService boardService;

	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request) {
		// ListVO lvo = boardService.getReportList(pageNo);
		// request.setAttribute("lvo", lvo);
		return "board/opensource_list";
		/*
		 * 헤더 레이아웃에 있는 신고 게시판을 누르면 board_list.do를 통해 리스트페이지로 넘어가게 되는데 ListVO에는
		 * ReportVO(신고게시판VO), PagingBean이 has a 관계로 있다 boardService에 있는 getReportList라는
		 * 메소드 부분을 보면 리턴값이 1로 되어있다. 그 리턴값 1을 lvo에 담아서 board_list로 리턴해주게 되면 1페이지가 뜨게 된다.
		 */
	}

	@RequestMapping("opensource_write.do")
	public String moveToWrite(HttpServletRequest request) {

		return "board/opensource_write";

	}

	@RequestMapping(value = "opensouce_register.do", method = RequestMethod.POST)
	public String write(HttpServletRequest request, BoardVO bvo, FileVO fvo) {
		//boardService.write(bvo);
		System.out.println("bvo : " + bvo);
		System.out.println("fvo : " + fvo);
		boardService.write(bvo);
		return "redirect:home.do";

	}
	
	


	}
