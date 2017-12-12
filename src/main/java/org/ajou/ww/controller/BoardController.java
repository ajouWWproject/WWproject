package org.ajou.ww.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ajou.ww.model.BoardVO;
import org.ajou.ww.model.CategoryVO;
import org.ajou.ww.model.CommentVO;
import org.ajou.ww.model.FileVO;
import org.ajou.ww.model.FolderVO;
import org.ajou.ww.model.LikeVO;
import org.ajou.ww.model.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardController {
	@Resource(name = "boardServiceImpl")
	private org.ajou.ww.model.BoardService boardService;
	
	private org.ajou.ww.model.MyPageService myPageService;

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
		
		ArrayList<FileVO> filevoList = new ArrayList<FileVO>();
		filevoList = boardService.findFileByBoardNo(boardNo);
		request.setAttribute("fList", filevoList);
		request.setAttribute("bvo", bvo);
		
		ArrayList<CommentVO> cvoList = new ArrayList<CommentVO>();
		
		cvoList = boardService.findCommentVOByBoardNo(Integer.parseInt(boardNo));
		
		request.setAttribute("cvoList", cvoList);
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
		List<MultipartFile> files = multipartRequest.getFiles("file");
		System.out.println("!!!!!" +files.size());

		
		bvo.setMemberVO(mvo);
		
		cvo = boardService.findCategoryVOByNo(cvo.getCategoryNo());
		bvo.setCategoryVO(cvo);
		
		foldervo = boardService.findFolderByNo(foldervo.getFolderNo());
		bvo.setFolderVO(foldervo);
		
		
		
		System.out.print(bvo);
		int idx = boardService.write(bvo);
		
		for(int i=0;i<files.size();i++){
			try {
				System.out.println("fileNameIter");
				String fileName = (String) files.get(i).getOriginalFilename();
//				MultipartFile file = multipartRequest.getFile(fileName);

				String getFileName[] = fileName.split("\\.");

				String reNameFile = mvo.getId() + getFileName[0] + "." + getFileName[1];

				files.get(i).transferTo(new File(uploadPath +"/"+ reNameFile));
				FileVO filevo = new FileVO();
				
				filevo.setFile(reNameFile);
				filevo.setBoardNo(idx);
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
	public String insertFolder(HttpServletRequest request,String folderName) {
		boardService.insertFolder(folderName);
		return "redirect:opensource_write.do";

	}
	@RequestMapping("board/fileDownload.do")
	public String fileDownload(String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception{		
		String path=request.getSession().getServletContext().getRealPath("/resources/upload/");
		  
		  request.getSession().getServletContext().getRealPath("/resources/upload/");
		  System.out.println("DownloadView 실행 "+path+fileName);
		  // 업로드 파일 객체 
		  File file=new File(path+"/"+fileName);
		  // 파일 다운로드 
		     response.setContentType("application/octet-stream");
		     response.setContentLength((int)file.length());//파일 크기 설정 
		     // 다운로드 파일에 대한 설정 
		     response.setHeader("Content-Disposition", 
		       "attachment; fileName="
		     +new String(file.getName().getBytes("UTF-8"),"8859_1"));
		     //데이터 인코딩이 바이너리 파일임을 명시
		     response.setHeader("Content-Transfer-encoding", "binary");
		  
		     //response에 연결된 OutputStream
		     OutputStream os=response.getOutputStream();
		     //업로드된 파일을 입력받기 위한 입력스트림 
		     FileInputStream fis=new FileInputStream(file);
		     FileCopyUtils.copy(fis, os);
		     System.out.println("다운로드 ok:"+file.getName());
		     return "redirect:board/opensource_detail";
		
	}
	
	@RequestMapping(value="Like.do", method=RequestMethod.GET)
	public @ResponseBody String likeChange(HttpServletRequest request, @RequestParam int board_no, @RequestParam String borad_like) {
		
		
		HttpSession session = request.getSession();
		
		MemberVO mvo = myPageService.getMemberInfo((MemberVO)session.getAttribute("mvo"));
		LikeVO lvo = new LikeVO(0, mvo, board_no);
		
		String change = "";
		
		if(borad_like.equals("true")){
			boardService.deleteLike(lvo);
		//	routePostscriptservice.downLikeNum(routePostscriptLike);
			change = "tTf"; //true to false
		}else{
			boardService.insertLike(lvo);
		//	routePostscriptservice.upLikeNum(routePostscriptLike);
			change = "fTt"; //false to true
		}
		
		return change;
	}
	

	@RequestMapping("board/updateBoard.do")
	public String updateBoard(HttpServletRequest request, String boardNo) {
		
		BoardVO bvo = boardService.findBoardByNo(boardNo);
		boardService.updateHit(boardNo);
		System.out.println(bvo);
		CategoryVO cvo =new CategoryVO();
		cvo = boardService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo());
		bvo.setCategoryVO(cvo);
		
		FolderVO foldervo = new FolderVO();
		foldervo = boardService.findFolderByNo(bvo.getFolderVO().getFolderNo());
		bvo.setFolderVO(foldervo);
		
		ArrayList<FileVO> filevoList = new ArrayList<FileVO>();
		filevoList = boardService.findFileByBoardNo(boardNo);
		request.setAttribute("fList", filevoList);
		request.setAttribute("bvo", bvo);
		return "board/opensource_update";
	}
	
	
	@RequestMapping("searchByKeyword.do")
	public String searchByKeyword(String keyword, HttpServletRequest request) {
		
		ArrayList<CategoryVO> cvoList = boardService.findCategoryList();
		
		ArrayList<BoardVO> swBvoList = boardService.getBoardListByKeywordOnWriter(keyword);
		ArrayList<BoardVO> spBvoList = boardService.getBoardListByKeywordOnProject(keyword);
		
		for(int i = 0; i < swBvoList.size();i++) {
			BoardVO bvo = swBvoList.get(i);
			bvo.setCategoryVO(boardService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(boardService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}
		
		for(int i = 0; i < spBvoList.size();i++) {
			BoardVO bvo = spBvoList.get(i);
			bvo.setCategoryVO(boardService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(boardService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}
		
		request.setAttribute("cvoList", cvoList);
		request.setAttribute("swBvoList", swBvoList);
		request.setAttribute("spBvoList", spBvoList);

		return "board/search_board_list";
	}
	
	@RequestMapping("searchByCategory.do")
	public String searchByCategory(String categoryNo, HttpServletRequest request) {
		ArrayList<BoardVO> bvoList = boardService.getBoardListByCategoryNo(categoryNo);
		for(int i = 0; i<bvoList.size();i++) {
			BoardVO bvo = bvoList.get(i);
			bvo.setCategoryVO(boardService.findCategoryVOByNo(bvo.getCategoryVO().getCategoryNo()));
			bvo.setFolderVO(boardService.findFolderByNo(bvo.getFolderVO().getFolderNo()));
		}
		//System.out.print("bvoList" + bvoList);
		request.setAttribute("bvoList", bvoList);
		return "board/opensource_list";
	}
	
	@RequestMapping("insertComment.do")
	public String insertComment(int boardNo, String content, HttpServletRequest request) {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("mvo");
		CommentVO cvo = new CommentVO();
		cvo.setMemberVO(memberVO);
		cvo.setBoardNo(boardNo);
		cvo.setContent(content);
		System.out.println("cvo!!!" + cvo);
		boardService.insertComment(cvo);
		return "redirect:board/moveToDetail.do?boardNo="+boardNo;
	}
	
	@RequestMapping("updateComment.do")
	public String updateComment(int commentNo, int boarNo){
		return "redirect:board/moveToDetail.do?="+boarNo;
	}

}
