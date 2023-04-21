package com.kh.toy.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.toy.member.service.MemberService;
import com.kh.toy.member.vo.MemberVo;

@WebServlet("/member/join")
public class MemberJoinController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/member/member-join-page.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String joinInputId = req.getParameter("joinInputId");
		String joinInputPwd = req.getParameter("joinInputPwd1");
		String joinInputNick = req.getParameter("joinInputNick");
	
		
		String ip = req.getHeader("X-Forwarded-For");
		if (ip == null) ip = req.getRemoteAddr();
		
		MemberVo vo = new MemberVo();
		vo.setMemberId(joinInputId);
		vo.setMemberPwd(joinInputPwd);
		vo.setMemberNick(joinInputNick);
		vo.setAddress(ip);
		
		
		MemberService ms = new MemberService();
		int result = ms.join(vo);
		
		
		if(result == 1) {
			req.getSession().setAttribute("alertMsg", "회원가입 성공");
			String root = req.getContextPath();
			resp.sendRedirect(root + "/home");
		}
		else {
			req.setAttribute("errorMsg", "회원가입 실패");
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
		
	}
	
}
