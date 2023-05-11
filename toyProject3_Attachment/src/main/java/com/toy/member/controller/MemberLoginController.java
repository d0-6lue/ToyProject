package com.toy.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toy.member.vo.MemberVo;
import com.toy.member.service.MemberService;

@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/member/memberLogin.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String loingId = req.getParameter("loginId");
		String loingPw = req.getParameter("loginPw");
		
		MemberVo memberVo = new MemberVo();
		memberVo.setMemberId(loingId);
		memberVo.setMemberPw(loingPw);
		
		MemberService memberSerivce = new MemberService();
		MemberVo loginMember = memberSerivce.login(memberVo);
	
	}
	
}
