package org.ajou.ww.model;

public class BoardVO {
	private int board_no;
	
	private String title;
	private String content_back;//기획배경/내용설명/
	private String content_detail;
	private int hits;
	private int likes;

	private String timePosted;
	private MemberVO memberVO;	
	private CategoryVO categoryVO;
	private FolderVO folderVO;
	
	public BoardVO() {
		super();		
	}

	public BoardVO(int board_no, String title, String content_back, String content_detail, int hits, int likes,
			String timePosted, MemberVO memberVO, CategoryVO categoryVO, FolderVO folderVO) {
		super();
		this.board_no = board_no;
		this.title = title;
		this.content_back = content_back;
		this.content_detail = content_detail;
		this.hits = hits;
		this.likes = likes;
		this.timePosted = timePosted;
		this.memberVO = memberVO;
		this.categoryVO = categoryVO;
		this.folderVO = folderVO;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent_back() {
		return content_back;
	}

	public void setContent_back(String content_back) {
		this.content_back = content_back;
	}

	public String getContent_detail() {
		return content_detail;
	}

	public void setContent_detail(String content_detail) {
		this.content_detail = content_detail;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getTimePosted() {
		return timePosted;
	}

	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	public FolderVO getFolderVO() {
		return folderVO;
	}

	public void setFolderVO(FolderVO folderVO) {
		this.folderVO = folderVO;
	}

	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", title=" + title + ", content_back=" + content_back
				+ ", content_detail=" + content_detail + ", hits=" + hits + ", likes=" + likes + ", timePosted="
				+ timePosted + ", memberVO=" + memberVO + ", categoryVO=" + categoryVO + ", folderVO=" + folderVO + "]";
	}


	


	
}
