package com.kh.toy.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.*;

import com.kh.toy.chat.vo.*;
import com.kh.toy.chat.service.*;

@WebServlet("/chat/load/chatlist")
public class ChatListLoadController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("method called..");
		
		String chatRoomNo = req.getParameter("no");
		
		ChatService cs = new ChatService();
		List<ChatVo> chatVoList = new ArrayList<>();
		
		chatVoList = cs.loadChatList(chatRoomNo);
		
		Gson gson = new Gson();
		
		String chatVoListJson = gson.toJson(chatVoList);
		
		PrintWriter out = resp.getWriter();
		out.write(chatVoListJson);
	
	}
	
}
