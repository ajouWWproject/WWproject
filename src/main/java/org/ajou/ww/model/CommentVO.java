package org.ajou.ww.model;

public class CommentVO {
	private int boardNo;
	private int commentNo;
	private MemberVO memberVO;
	private String content;
	private String timePosted;
	
	public CommentVO() {
		super();
	}

	public CommentVO(int boardNo, int commentNo, MemberVO memberVO, String content, String timePosted) {
		super();
		this.boardNo = boardNo;
		this.commentNo = commentNo;
		this.memberVO = memberVO;
		this.content = content;
		this.timePosted = timePosted;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTimePosted() {
		return timePosted;
	}

	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}

	@Override
	public String toString() {
		return "CommentVO [boardNo=" + boardNo + ", commentNo=" + commentNo + ", memberVO=" + memberVO + ", content="
				+ content + ", timePosted=" + timePosted + "]";
	}

	
	
	
}
