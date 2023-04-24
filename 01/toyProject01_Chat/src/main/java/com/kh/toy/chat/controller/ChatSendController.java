package com.kh.toy.chat.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.toy.chat.vo.ChatVo;
import com.kh.toy.chat.service.*;
import com.kh.toy.member.vo.*;

import com.google.gson.Gson;

@WebServlet("/chat/send")
public class ChatSendController extends  HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		BufferedReader br = req.getReader();
		
		StringBuilder sb = new StringBuilder();
		
		String s = "";
		
		while( (s = br.readLine()) != null ) {
			sb.append(s);
		}
		
		String str = sb.toString();
		
		Gson gson = new Gson();
		Map<String, String> map = gson.fromJson(str, Map.class);
		
		String roomNo = String.valueOf(map.get("roomNo"));
		String chatContent = String.valueOf(map.get("chatContent"));
		
		MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
		String sender = loginMember.getMemberNo();
		
		ChatVo chatVo = new ChatVo();
		chatVo.setChatRoomNo(roomNo);
		chatVo.setChatContent(chatContent);
		chatVo.setChatSender(sender);
		
		ChatService cs = new ChatService();
		int result = cs.sendChat(chatVo);
		
		PrintWriter out = resp.getWriter();
		if(result == 1) {
			
			out.write("1");
			
		}
		else {
			
			out.write("0");
			
		}
		
		
	}
	
}
