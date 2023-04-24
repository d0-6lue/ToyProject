package com.kh.toy.chat.vo;

public class ChatVo {
	
	private String chatNo;
	private String chatRoomNo;
	private String chatSender;
	private String chatSenderNick;
	private String chatContent;	
	private String chatEnrollDate;
	
	public ChatVo() {
		super();
	}

	public ChatVo(String chatNo, String chatRoomNo, String chatSender, String chatSenderNick, String chatContent,
			String chatEnrollDate) {
		super();
		this.chatNo = chatNo;
		this.chatRoomNo = chatRoomNo;
		this.chatSender = chatSender;
		this.chatSenderNick = chatSenderNick;
		this.chatContent = chatContent;
		this.chatEnrollDate = chatEnrollDate;
	}

	public String getChatNo() {
		return chatNo;
	}
	public void setChatNo(String chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(String chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public String getChatSender() {
		return chatSender;
	}
	public void setChatSender(String chatSender) {
		this.chatSender = chatSender;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatEnrollDate() {
		return chatEnrollDate;
	}
	public void setChatEnrollDate(String chatEnrollDate) {
		this.chatEnrollDate = chatEnrollDate;
	}
	public String getChatSenderNick() {
		return chatSenderNick;
	}
	public void setChatSenderNick(String chatSenderNick) {
		this.chatSenderNick = chatSenderNick;
	}

	@Override
	public String toString() {
		return "ChatVo [chatNo=" + chatNo + ", chatRoomNo=" + chatRoomNo + ", chatSender=" + chatSender
				+ ", chatSenderNick=" + chatSenderNick + ", chatContent=" + chatContent + ", chatEnrollDate="
				+ chatEnrollDate + "]";
	}

}
