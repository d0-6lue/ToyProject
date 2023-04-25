package com.toy.websocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;


// WebSocket 의 호스트 주소 설정
@ServerEndpoint("/websocket")
public class WebSocket {
	
	// WebSocket 으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen() {
		System.out.println("client is now connected .. ");
	}
	
	// WebSocekt 으로 메시지가 오면 요청되는 함수
	@OnMessage
	public String handleMessage(String message) {
		System.out.println("receive form client : " + message );
		
		String replymessage = "reply ~~ ";
		
		System.out.println("send to client : " + replymessage );
		
		return replymessage;
	}
	
	// WebSocket 과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose() {
		System.out.println("client is now disconnected ..");
	}
	
	// WebSocket 과 브라우저 간에 통신 에어락 발생하면 요청되는 함수
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}

}
