package org.ajou.ww.model;

public class BoardVO {
	private int no;
	
	private String title;
	private String content;
	private int hits;
	private int likes;

	private String timePosted;
	private MemberVO memberVO;	
	private CategoryVO categoryVO;
	
	public BoardVO() {
		super();		
	}

	public BoardVO(int no, String title, String content, int hits, int likes, String timePosted, MemberVO memberVO,
			CategoryVO categoryVO) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.likes = likes;
		this.timePosted = timePosted;
		this.memberVO = memberVO;
		this.categoryVO = categoryVO;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", content=" + content + ", hits=" + hits + ", likes=" + likes
				+ ", timePosted=" + timePosted + ", memberVO=" + memberVO + ", categoryVO=" + categoryVO + "]";
	}	
	
	
}
