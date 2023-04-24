package com.kh.toy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.toy.member.vo.MemberVo;

import com.google.gson.*;

@WebServlet("/login_member_list")
public class LoginMemberListLoadController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletContext application = req.getServletContext();
		List<MemberVo> loginMemberList = (List<MemberVo>) application.getAttribute("loginMemberList");
		
		Gson gson = new Gson();
		
		String loginMemberListJson = gson.toJson(loginMemberList);
		
		PrintWriter out = resp.getWriter();
		out.write(loginMemberListJson);
	
	}
	
}
