package com.toy.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toy.member.service.MemberService;
import com.toy.member.vo.MemberVo;

@WebServlet("/member/join")
public class MemberJoinController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/member/memberJoin.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String joinId = req.getParameter("joinId");
		String joinPw = req.getParameter("joinPw");
		String joinNick = req.getParameter("joinNick");
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMemberId(joinId);
		memberVo.setMemberPw(joinPw);
		memberVo.setMemberNick(joinNick);
		memberVo.setMemberProfile("null");
		
		MemberService ms = new MemberService();
		int result = ms.join(memberVo);
		
		if(result == 1) {
			
			req.getSession().setAttribute("alertMsg", "회원가입 성공");
			
			String root = req.getContextPath();
			resp.sendRedirect( root + "/home");
		}
		else {
			
			req.getSession().setAttribute("alertMsg", "회원가입 실패");
			
			String root = req.getContextPath();
			resp.sendRedirect( root + "/member/join");
			
		}
	
	}
	
}
