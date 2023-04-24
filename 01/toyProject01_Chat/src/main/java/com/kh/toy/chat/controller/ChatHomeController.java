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
import javax.servlet.http.HttpSession;

import com.google.gson.*;

import com.kh.toy.chat.vo.*;
import com.kh.toy.chat.service.*;

@WebServlet("/chat/home")
public class ChatHomeController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		if(session.getAttribute("loginMember") != null ) {
			req.getRequestDispatcher("/WEB-INF/views/chat/chat-home.jsp").forward(req, resp);
		}
		else {
			session.setAttribute("alertMsg", "로그인하셔야 합니다.");
			req.getRequestDispatcher("/WEB-INF/views/home/home.jsp").forward(req, resp);
		}
	
	}
	
}
