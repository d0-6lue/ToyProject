package com.kh.toy.chat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.toy.chat.service.ChatService;
import com.kh.toy.chat.vo.ChatRoomVo;

@WebServlet("/chat/create")
public class ChatRoomCreateController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String chatRoomName = req.getParameter("chatRoomName");
		String chatRoomMax = req.getParameter("chatRoomMax");
		
		ChatRoomVo vo = new ChatRoomVo();
		vo.setChatRoomName(chatRoomName);
		vo.setChatRoomMax(chatRoomMax);
		
		ChatService cs = new ChatService();
		int result = cs.createChatRoom(vo);
		
		if(result == 1) {
			String root = req.getContextPath();
			resp.sendRedirect( root + "/chat/home");
		}
		else {
			req.setAttribute("errorMsg", "채팅방 만들기 실패");
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	
	}
	
}
