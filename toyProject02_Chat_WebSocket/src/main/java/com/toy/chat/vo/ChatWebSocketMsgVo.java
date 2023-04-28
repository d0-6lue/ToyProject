package com.toy.chat.vo;

import java.util.List;

public class ChatWebSocketMsgVo {
	
	private String type;
	private List<ChatVo> chatVoList;
	
	public ChatWebSocketMsgVo() {
		super();
	}
	
	public ChatWebSocketMsgVo(String type, List<ChatVo> chatVoList) {
		super();
		this.type = type;
		this.chatVoList = chatVoList;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<ChatVo> getChatVoList() {
		return chatVoList;
	}
	public void setChatVoList(List<ChatVo> chatVoList) {
		this.chatVoList = chatVoList;
	}
	
	@Override
	public String toString() {
		return "ChatWebSocektMsgVo [type=" + type + ", chatVoList=" + chatVoList + "]";
	}

}
