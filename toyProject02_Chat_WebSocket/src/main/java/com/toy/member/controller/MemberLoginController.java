package com.toy.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toy.member.service.*;
import com.toy.member.vo.*;

@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/member/member_login_page.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String loginInputId = req.getParameter("loginInputId");
		String loginInputPwd = req.getParameter("loginInputPwd");
		
		MemberVo vo = new MemberVo();
		vo.setMemberId(loginInputId);
		vo.setMemberPwd(loginInputPwd);
		
		MemberService ms = new MemberService();
		MemberVo loginMember = ms.login(vo);
		
		if(loginMember != null) {
			HttpSession session = req.getSession();
			session.setAttribute("alertMsg", "로그인 성공");
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("nick", loginMember.getMemberNick() );
			
			ServletContext application = req.getServletContext();
			List<MemberVo> loginMemberList = new ArrayList<>();
			
			if(application.getAttribute("loginMemberList") != null) {
				loginMemberList.addAll((List<MemberVo>) application.getAttribute("loginMemberList"));
			}
			
			loginMemberList.add(loginMember);
			
			application.setAttribute("loginMemberList", loginMemberList);
			
			
			String root = req.getContextPath();
			resp.sendRedirect(root + "/home");
		}
		else {
			req.setAttribute("errorMsg", "회원가입 실패");
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
		
		
	}
	
}
