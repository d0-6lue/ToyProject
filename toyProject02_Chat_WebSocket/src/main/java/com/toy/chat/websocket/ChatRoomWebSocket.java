package com.toy.chat.websocket;

import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.*;
import com.toy.chat.service.ChatService;
import com.toy.chat.vo.ChatVo;

@ServerEndpoint("/chat/socket")
public class ChatRoomWebSocket {
	
	// WebSocket 으로 브라우저가 접속하며 요청되는 함수
	@OnOpen
	public void handleOpen() {
		System.out.println("client is connected ..");
	}
	
	
	// WebSocket 으로 메시지가 오면 요청되는 함수
	@OnMessage
	public String handleMessage(String message) {
		
		System.out.println(message);
		
		Gson gson = new Gson();
		Map<String, String> map = gson.fromJson(message, Map.class);
		String sender = String.valueOf(map.get("sender"));
		String receiver = String.valueOf(map.get("receiver"));
		String chatContent = String.valueOf(map.get("chatMsg"));
		
		ChatVo chatVo = new ChatVo();
		chatVo.setChatSender(sender);
		chatVo.setChatReceiver(receiver);
		chatVo.setChatContent(chatContent);
		
		ChatService cs = new ChatService();
		int result = cs.sendChat(chatVo);
		
		if(result == 1) {
			
			return "db 저장 성공";
			
		}
		else {
			
			return "db 저장 실패";
		}
		
		
	}
	
	
	// WebSocket 과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose( ) {
		System.out.println("client is disconnected ..");
	}
	
	
	// WebSocket 과 브라우저 간에 통신 에러가 발생하면 요청되는 함수
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	

}
