package com.toy.member.vo;

public class MemberVo {
	
	private String memberNo;
	private String memberId;
	private String memberPw;
	private String memberNick;
	private String memberProfile;
	
	private String memberStatus;
	
	private String memberEnrollDate;
	private String memberModifyDate;
	
	
	public MemberVo() {
		super();
	}
	
	public MemberVo(String memberNo, String memberId, String memberPw, String memberNick, String memberProfile,
			String memberStatus, String memberEnrollDate, String memberModifyDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberNick = memberNick;
		this.memberProfile = memberProfile;
		this.memberStatus = memberStatus;
		this.memberEnrollDate = memberEnrollDate;
		this.memberModifyDate = memberModifyDate;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getMemberEnrollDate() {
		return memberEnrollDate;
	}
	public void setMemberEnrollDate(String memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}
	public String getMemberModifyDate() {
		return memberModifyDate;
	}
	public void setMemberModifyDate(String memberModifyDate) {
		this.memberModifyDate = memberModifyDate;
	}

	public String getMemberNo() {
		return memberNo;
	}

	@Override
	public String toString() {
		return "MemberVo [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberNick="
				+ memberNick + ", memberProfile=" + memberProfile + ", memberStatus=" + memberStatus
				+ ", memberEnrollDate=" + memberEnrollDate + ", memberModifyDate=" + memberModifyDate + "]";
	}

}
