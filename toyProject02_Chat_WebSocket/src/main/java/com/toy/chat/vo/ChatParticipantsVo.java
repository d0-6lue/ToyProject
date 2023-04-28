package com.toy.chat.vo;

public class ChatParticipantsVo {
	
	private String sender;
	private String receiver;
	
	public ChatParticipantsVo() {
		super();
	}
	
	public ChatParticipantsVo(String sender, String receiver) {
		super();
		this.sender = sender;
		this.receiver = receiver;
	}
	
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	@Override
	public String toString() {
		return "ChatParticipantsVo [sender=" + sender + ", receiver=" + receiver + "]";
	}
	
}
