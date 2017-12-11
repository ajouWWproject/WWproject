package org.ajou.ww.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.BoardService;
import org.ajou.ww.model.BoardVO;
import org.ajou.ww.model.CategoryVO;
import org.ajou.ww.model.FileVO;
import org.ajou.ww.model.FolderVO;
import org.ajou.ww.model.ListVO;
import org.ajou.ww.model.MemberVO;
import org.ajou.ww.model.MyPageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/myPage/")
public class MyPageController {
	
	@Resource
	private MyPageService myPageService;

	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");

		HttpSession session = request.getSession();
		MemberVO mvo = myPageService.getMemberInfo((MemberVO)session.getAttribute("mvo"));
		
		ArrayList<BoardVO> myBoardList = (ArrayList<BoardVO>) myPageService.getMyBoardList(mvo);
		
		ArrayList<BoardVO> likeBoardList = (ArrayList<BoardVO>) myPageService.getLikeBoardList(mvo);
		
		for(BoardVO bvo : myBoardList) {
			bvo.setCategoryVO(myPageService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(myPageService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}
		
		for(BoardVO bvo : likeBoardList) {
			bvo.setCategoryVO(myPageService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(myPageService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}
		
		if(!mvo.getProfile_path().equals("")) {
			String filePath = uploadPath.replace("\\", "/") + "/" + mvo.getProfile_path();
			request.setAttribute("filePath", filePath);
		}
		
		request.setAttribute("mvo", mvo);
		request.setAttribute("myBoardList", myBoardList);
		request.setAttribute("likeBoardList", likeBoardList);
		return "mypage";
	}
	
	@RequestMapping(value = "editInfo.do", method = RequestMethod.POST)
	public String editInfo(HttpServletRequest request, MemberVO mvo) {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFiles("file").get(0);
		
		
		try {
			String fileName = (String) file.getOriginalFilename();
			System.out.println("filename : " + fileName);
			if(!fileName.equals("")) {
				String reNameFile = mvo.getId() + fileName;
				file.transferTo(new File(uploadPath + File.separator + reNameFile));
				mvo.setProfile_path(reNameFile);
			} else {
				mvo.setProfile_path(myPageService.getMemberInfo(mvo).getProfile_path());
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		myPageService.editMemberInfo(mvo);
		request.setAttribute("mvo", mvo);
		return "redirect:mypage.do";
	}
	
	/*@RequestMapping(value = "myBoardList.do")
	public @ResponseBody ArrayList<BoardVO> list(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO mvo = myPageService.getMemberInfo((MemberVO)session.getAttribute("mvo"));
		
		ArrayList<BoardVO> bvoList = (ArrayList<BoardVO>) myPageService.getMyBoardList(mvo);
		
		for(BoardVO bvo : bvoList) {
			bvo.setCategoryVO(myPageService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(myPageService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}

		return bvoList;
	}*/
	

	
}
