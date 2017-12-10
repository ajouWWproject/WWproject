package org.ajou.ww.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.BoardService;
import org.ajou.ww.model.BoardVO;
import org.ajou.ww.model.CategoryVO;
import org.ajou.ww.model.FileVO;
import org.ajou.ww.model.FolderVO;
import org.ajou.ww.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource(name = "boardServiceImpl")
	private org.ajou.ww.model.BoardService boardService;

	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request) {
		// ListVO lvo = boardService.getReportList(pageNo);
		// request.setAttribute("lvo", lvo);
		
		ArrayList<BoardVO> bvoList = boardService.getBoardList();
		for(int i = 0; i<bvoList.size();i++) {
			BoardVO bvo = bvoList.get(i);
			bvo.setCategoryVO(boardService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(boardService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}
		//System.out.print("bvoList" + bvoList);
		request.setAttribute("bvoList", bvoList);
		
		

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
	@RequestMapping("board/moveToDetail.do")
	public String moveToDetail(String boardNo, HttpServletRequest request) {
		//System.out.println("boarNo" + boardNo);
		
		BoardVO bvo = boardService.findBoardByNo(boardNo);
		boardService.updateHit(boardNo);
		System.out.println(bvo);
		CategoryVO cvo =new CategoryVO();
		cvo = boardService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo());
		bvo.setCategoryVO(cvo);
		
		FolderVO foldervo = new FolderVO();
		foldervo = boardService.findFolderByNo(bvo.getFolderVO().getFolderNo());
		bvo.setFolderVO(foldervo);
		
		request.setAttribute("bvo", bvo);
		
		
		return "board/opensource_detail";
	}
	@RequestMapping(value = "opensouce_register.do", method = RequestMethod.POST)
	public String write(HttpServletRequest request, BoardVO bvo, MemberVO mvo, CategoryVO cvo, FolderVO foldervo) {
		// boardService.write(bvo);
	

		String uploadPath = "";
		uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		// 개발시에는 워크스페이스 업로드 경로로 준다

		// 소영
		//uploadPath = "/Users//imsoyeong//ww-workspace//WWproject/src/main/webapp/resources/upload/";

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator fileNameIter = multipartRequest.getFileNames();
		bvo.setMemberVO(mvo);
		
		cvo = boardService.findCategoryVOByNo(cvo.getCategoryNo());
		bvo.setCategoryVO(cvo);
		
		foldervo = boardService.findFolderByNo(foldervo.getFolderNo());
		bvo.setFolderVO(foldervo);
		
		System.out.print(bvo);
		
		
		while (fileNameIter.hasNext()) {
			try {
				String fileName = (String) fileNameIter.next();
				MultipartFile file = multipartRequest.getFile(fileName);

				String getFileName[] = file.getOriginalFilename().split("\\.");

				String reNameFile = mvo.getId() + getFileName[0] + "." + getFileName[1];

				file.transferTo(new File(uploadPath +"/"+ reNameFile));
				FileVO filevo = new FileVO();
				
				filevo.setFile(reNameFile);
				filevo.setBoardNo(boardService.write(bvo));
				boardService.insertFile(filevo);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
			
		}

		

		return "redirect:home.do";

	}

	@RequestMapping("findCategoryList.do")
	@ResponseBody
	public ArrayList<CategoryVO> findCategoryList(HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		ArrayList<CategoryVO> cvoList = boardService.findCategoryList();
		// System.out.println("cvoList" + cvoList);
		return cvoList;
	}

	@RequestMapping("findFolderList.do")
	@ResponseBody
	public ArrayList<FolderVO> findFolderList(HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		ArrayList<FolderVO> fvoList = boardService.findFolderList();
		System.out.println("cvoList" + fvoList);
		return fvoList;
	}

	@RequestMapping("insertFolder.do")
	public String insertFolder(HttpServletRequest request, FolderVO fvo) {
		System.out.println("folderName : " + fvo);

		// boardService.write(bvo);

		return "redirect:opensource_write.do";

	}

}
