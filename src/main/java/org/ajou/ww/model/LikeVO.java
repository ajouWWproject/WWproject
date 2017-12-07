package org.ajou.ww.model;

public class LikeVO {
	private MemberVO memberVO;
	private int boardNo;
	public LikeVO() {
		super();
	}
	public LikeVO(MemberVO memberVO, int boardNo) {
		super();
		this.memberVO = memberVO;
		this.boardNo = boardNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "LikeVO [memberVO=" + memberVO + ", boardNo=" + boardNo + "]";
	}
	
}
