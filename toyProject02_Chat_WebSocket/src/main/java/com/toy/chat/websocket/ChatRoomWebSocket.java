package com.toy.chat.websocket;

import java.util.Collections;
import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.*;
import com.toy.chat.service.ChatService;
import com.toy.chat.vo.*;

@ServerEndpoint("/chat/socket")
public class ChatRoomWebSocket {
	
	// WebSocekt session 리스트
	private static List<Session> users = Collections.synchronizedList(new ArrayList<>());
	// WebSocket session 맵. 원하는 session을 찾기 위해
	private static Map<String, Object> usersMap = new HashMap<>();
	
	// WebSocket 으로 브라우저가 접속하며 요청되는 함수
	@OnOpen
	public void handleOpen(Session session) {
		System.out.println("client is connected ..");
		users.add(session);
	}
	
	
	// WebSocket 으로 메시지가 오면 요청되는 함수
	@OnMessage
	public void handleMessage(String message, Session session) {
		
		ChatWebSocketMsgVo msg = new ChatWebSocketMsgVo();
		
		ChatService cs = new ChatService();
		
		// WebSocket 으로 온 메시지를 JSON으로
		Gson gson = new Gson();
		Map<String, String> map = gson.fromJson(message, Map.class);
		
		// 메시지에서 "type" 얻기
		String type = String.valueOf(map.get("type"));
		
		// 메시지에서 "sender" 와 "receiver" 얻기
		String sender = String.valueOf(map.get("sender"));
		String receiver = String.valueOf(map.get("receiver"));
		
		
		// 세션 구분을 위한 객체		--	굳이 객체로 했어야 했나.. toString 으로 이용하는데.. 적당한 문자열로 변경해도 될듯
		ChatParticipantsVo chatParticipantVo = new ChatParticipantsVo();
		chatParticipantVo.setSender(sender);
		chatParticipantVo.setReceiver(receiver);
		
		ChatParticipantsVo otherParticipantVo = new ChatParticipantsVo();
		otherParticipantVo.setSender(receiver);
		otherParticipantVo.setReceiver(sender);
		
		// type 이 resgister 면 usersMap에 추가
		if(type != null && "register".equals(type)) {
			
			usersMap.put(chatParticipantVo.toString(), session);
			
		}
		// type 이 load 처음 채팅방 들어왔을때 채팅방 두사람에게 맞는 모든 메시지 받아와서 보내기
		else if(type != null && "load".equals(type)) {
			
			// 마지막 채팅번호 0 으로 들어옴.
			String lastChatNo = String.valueOf(map.get("lastChatNo"));
			
			// 읽은 메시지들 읽음으로 UPDATE		-- 어디서 실행하는게 옳을까???
			int result = cs.readCheck(chatParticipantVo);
			
			// 채팅리스트
			List<ChatVo> chatList = new ArrayList<>();
			
			// ChatService.loadChatList() 실행
			chatList = cs.loadChatList(chatParticipantVo, lastChatNo);
			
			msg.setType("load");
			msg.setChatVoList(chatList);
			
			// JSON 으로 변환
			String reply_msg = gson.toJson(msg);
			
			// 요청한 session ( sender값과 receiver값이 일치하는 sender)
			Session s = (Session) usersMap.get(chatParticipantVo.toString());
			// getOther() : 받는사람 Session 키값 얻는 함수
			String other = getOther(sender, receiver);
			// 받는 사람의 Session
			Session r = (Session) usersMap.get(other);
			
			
			// session에 보내기
			try {
				
				s.getBasicRemote().sendText(reply_msg);
				
				// 받는 사람 Session의 클라이언트에 전송( 지금 연결 되어 있다면 )
				if(r != null && r.isOpen()) {
					
					result = cs.readCheck(otherParticipantVo);
					
					// ChatService.loadChatList() 실행
					chatList = cs.loadChatList(chatParticipantVo, lastChatNo);
					
					msg.setChatVoList(chatList);
					
					// JSON 으로 변환
					reply_msg = gson.toJson(msg);
					
					// session에 보내기
					try {
						
						r.getBasicRemote().sendText(reply_msg);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
											
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		// 채팅 보냈을 때
		else if(type != null && "chat".equals(type)) {
			
			// 채팅 내용
			String chatContent = String.valueOf(map.get("chatMsg"));
			// 마지막 채팅 번호
			String lastChatNo = String.valueOf(map.get("lastChatNo"));
			
			ChatVo chatVo = new ChatVo();
			chatVo.setChatSender(sender);
			chatVo.setChatReceiver(receiver);
			chatVo.setChatContent(chatContent);
			
			// result = 1 or 0
			int result = cs.sendChat(chatVo);
			
			// DB에 INSERT 성공했을때
			if(result == 1) {
				
				try {
					// 보낸 사람의 Session
					Session s = (Session) usersMap.get(chatParticipantVo.toString());
					// getOther() : 받는사람 Session 키값 얻는 함수
					String other = getOther(sender, receiver);
					// 받는 사람의 Session
					Session r = (Session) usersMap.get(other);
					
					List<ChatVo> chatList = new ArrayList<>();
					
					
					// 받는 사람 Session의 클라이언트에 전송( 지금 연결 되어 있다면 )
					if(r != null && r.isOpen()) {
						
						result = cs.readCheck(otherParticipantVo);
						
						// 마지막 채팅 번호 이후 채팅 리스트
						chatList = cs.loadChatList(chatParticipantVo, lastChatNo);
						
						msg.setType("newChat");
						msg.setChatVoList(chatList);
						
						// JSON 변환
						String reply_msg = gson.toJson(msg);
						
						// 보낸 사람 Session의 클라이언트에 전송
						s.getBasicRemote().sendText(reply_msg);
						
						// ChatService.loadChatList() 실행
						chatList = cs.loadChatList(chatParticipantVo, lastChatNo);
						
						msg.setChatVoList(chatList);
						
						// JSON 으로 변환
						reply_msg = gson.toJson(msg);
						
						// session에 보내기
						try {
							
							r.getBasicRemote().sendText(reply_msg);
							
						} catch (Exception e) {
							e.printStackTrace();
						}
												
					}
					else {
						
						// 마지막 채팅 번호 이후 채팅 리스트
						chatList = cs.loadChatList(chatParticipantVo, lastChatNo);
						
						msg.setType("newChat");
						msg.setChatVoList(chatList);
						
						// JSON 변환
						String reply_msg = gson.toJson(msg);
						
						// 보낸 사람 Session의 클라이언트에 전송
						s.getBasicRemote().sendText(reply_msg);
						
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
			}
			else {
				
			}
			
		}
		
	}
	
	
	// WebSocket 과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose(Session session ) {
		System.out.println("client is disconnected ..");
		users.remove(session);
		usersMap.remove(session);
	}
	
	
	// WebSocket 과 브라우저 간에 통신 에러가 발생하면 요청되는 함수
	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	public String getOther(String sender, String receiver) {
		
		
		return "ChatParticipantsVo [sender=" + receiver + ", receiver=" + sender + "]";
	}

}
