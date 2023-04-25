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
		
		String chatRoomNo = req.getParameter("no");
		
		String lastChatNo = (String) req.getSession().getAttribute("lastChatNo");
		if(lastChatNo == null) {
			lastChatNo = "0";
		}
		
		ChatService cs = new ChatService();
		List<ChatVo> chatVoList = new ArrayList<>();
		
		chatVoList = cs.loadChatList(chatRoomNo, lastChatNo);
		
		Gson gson = new Gson();
		
		String chatVoListJson = gson.toJson(chatVoList);
		
		if( !("[]".equals(chatVoListJson)) ) {
			req.getSession().setAttribute("lastChatNo", (chatVoList.get( chatVoList.size() - 1 )).getChatNo() );	
		
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.write(chatVoListJson);
		}
		
	}
	
}
