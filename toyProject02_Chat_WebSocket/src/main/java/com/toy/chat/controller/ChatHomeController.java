package com.toy.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toy.member.vo.MemberVo;

@WebServlet("/chat/home")
public class ChatHomeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if( req.getSession().getAttribute("loginMember") != null ) {
			
			ServletContext application = req.getServletContext();
			List<MemberVo> loginMemberList = (List<MemberVo>) application.getAttribute("loginMemberList");
			req.setAttribute("loginMemberList", loginMemberList);
			
			req.getRequestDispatcher("/WEB-INF/views/chat/chat_home.jsp").forward(req, resp);
			
		}
		else {
			
			req.getSession().setAttribute("alertMsg", "로그인 하셔야합니다.");
			String root = req.getContextPath();
			resp.sendRedirect( root + "/home" );
			
		}
	
	}
}
