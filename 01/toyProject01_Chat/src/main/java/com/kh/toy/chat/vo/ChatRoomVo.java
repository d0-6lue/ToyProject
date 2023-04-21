package com.kh.toy.chat.vo;

public class ChatRoomVo {
	
	private String chatRoomNo;
	private String chatRoomName;
	private String chatRoomMax;
	
	
	public ChatRoomVo() {
		super();
	}
	
	public ChatRoomVo(String chatRoomNo, String chatRoomName, String chatRoomMax) {
		super();
		this.chatRoomNo = chatRoomNo;
		this.chatRoomName = chatRoomName;
		this.chatRoomMax = chatRoomMax;
	}
	
	public String getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(String chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public String getChatRoomName() {
		return chatRoomName;
	}
	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}
	public String getChatRoomMax() {
		return chatRoomMax;
	}
	public void setChatRoomMax(String chatRoomMax) {
		this.chatRoomMax = chatRoomMax;
	}
	
	@Override
	public String toString() {
		return "ChatRoomVo [chatRoomNo=" + chatRoomNo + ", chatRoomName=" + chatRoomName + ", chatRoomMax="
				+ chatRoomMax + "]";
	}

}
