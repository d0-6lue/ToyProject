package com.kh.toy.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.toy.chat.service.ChatService;
import com.kh.toy.chat.vo.ChatRoomVo;

@WebServlet("/chat/load/room")
public class ChatRoomLoadController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<ChatRoomVo> chatRoomList = new ArrayList<>();

		ChatService cs = new ChatService();
		chatRoomList = cs.loadChatRoom();
	
		Gson gson = new Gson();
		String chatRoomListJson = gson.toJson(chatRoomList);
		
		PrintWriter out = resp.getWriter();
		out.write(chatRoomListJson);
	
	}
	
}
