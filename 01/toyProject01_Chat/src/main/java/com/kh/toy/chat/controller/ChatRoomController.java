package com.kh.toy.chat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/chat/room")
public class ChatRoomController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginMember") != null )
			req.getRequestDispatcher("/WEB-INF/views/chat/chat-room.jsp").forward(req, resp);
		else {
			session.setAttribute("alertMsg", "로그인하셔야 합니다.");
			req.getRequestDispatcher("/WEB-INF/views/home/home.jsp").forward(req, resp);
		}
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	
	}
}
