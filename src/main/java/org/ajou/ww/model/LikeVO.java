package org.ajou.ww.model;

public class LikeVO {
	private int like_no;
	private MemberVO memberVO;
	private int board_no;
	public LikeVO() {
		super();
	}
	public LikeVO(int like_no, MemberVO memberVO, int board_no) {
		super();
		this.like_no = like_no;
		this.memberVO = memberVO;
		this.board_no = board_no;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getBoardNo() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	@Override
	public String toString() {
		return "LikeVO [memberVO=" + memberVO + ", board_no =" + board_no + "]";
	}
	
}
