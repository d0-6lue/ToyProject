package com.gametree.blue.websocket;

import java.util.Collections;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint("/websocket")
public class WebSocket {
	
	private static List<Session> users = Collections.synchronizedList(new ArrayList<>());
	
	private static Map<String, Object> usersMap = new HashMap<>();
	
	@OnOpen
	public void handleOpen(Session session) {
		users.add(session);
	}
	
	@OnMessage
	public void handleMessage(String message, Session session) {
		
		
		Gson gson = new Gson();
		Map<String, String> map = gson.fromJson(message, Map.class);
		
		String type = String.valueOf(map.get("type"));
		
		// 등록하기
		if("register".equals(type)) {
			String userNo = String.valueOf(map.get("userNo"));
			usersMap.put(userNo, session);
		}
		// 점령
		else if("occupation".equals(type)) {
			String coordinate = String.valueOf(map.get("coordinate"));
			
			// 
			
			try {
				session.getBasicRemote().sendText(coordinate);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
