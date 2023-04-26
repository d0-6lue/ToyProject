package com.toy.chat.vo;

public class ChatVo {

	private String chatNo;
	private String chatSender;
	private String chatReceiver;
	private String chatContent;
	private String chatEnrollDate;
	private String chatRead;
	
	public ChatVo() {
		super();
	}
	
	public ChatVo(String chatNo, String chatSender, String chatReceiver, String chatContent, String chatEnrollDate,
			String chatRead) {
		super();
		this.chatNo = chatNo;
		this.chatSender = chatSender;
		this.chatReceiver = chatReceiver;
		this.chatContent = chatContent;
		this.chatEnrollDate = chatEnrollDate;
		this.chatRead = chatRead;
	}
	
	public String getChatNo() {
		return chatNo;
	}
	public void setChatNo(String chatNo) {
		this.chatNo = chatNo;
	}
	public String getChatSender() {
		return chatSender;
	}
	public void setChatSender(String chatSender) {
		this.chatSender = chatSender;
	}
	public String getChatReceiver() {
		return chatReceiver;
	}
	public void setChatReceiver(String chatReceiver) {
		this.chatReceiver = chatReceiver;
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
	public String getChatRead() {
		return chatRead;
	}
	public void setChatRead(String chatRead) {
		this.chatRead = chatRead;
	}
	
	@Override
	public String toString() {
		return "ChatVo [chatNo=" + chatNo + ", chatSender=" + chatSender + ", chatReceiver=" + chatReceiver
				+ ", chatContent=" + chatContent + ", chatEnrollDate=" + chatEnrollDate + ", chatRead=" + chatRead
				+ "]";
	}
	
}
