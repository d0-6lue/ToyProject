package com.toy.chat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chat/room")
public class ChatRoomController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if ( req.getSession().getAttribute("loginMember") != null ){
			
			req.getRequestDispatcher("/WEB-INF/views/chat/chat_room.jsp").forward(req, resp);
			
		}
		else {
			
			req.getSession().setAttribute("alertMsg", "로그인 하셔야합니다.");
			String root = req.getContextPath();
			resp.sendRedirect( root + "/home" );
			
		}
	}
	
}
