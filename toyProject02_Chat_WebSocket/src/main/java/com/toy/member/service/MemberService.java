package com.toy.member.service;

import java.sql.Connection;

import com.toy.member.dao.MemberDao;
import com.toy.member.vo.MemberVo;
import com.toy.util.JDBCTemplate;

public class MemberService {

	public int join(MemberVo vo) {
		
		int result = 0;
		
		Connection conn = null;
		try{
			
			conn = JDBCTemplate.getConnection();
			
			MemberDao dao = new MemberDao();
			result = dao.join(conn, vo);
			
			if(result == 1) {
				JDBCTemplate.commit(conn);
			}
			else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (Exception e) {
			System.out.println("[error] MemberSerivce.join() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);			
		}
		
		return result;
		
	} // join()

	public MemberVo login(MemberVo vo) {
		
		MemberVo loginMember = new MemberVo();
		
		Connection conn = null;
		try {
			
			conn = JDBCTemplate.getConnection();
			
			MemberDao dao = new MemberDao();
			loginMember = dao.login(conn, vo);
			
		} catch (Exception e) {
			System.out.println("[error] MemberSerivce.login() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return loginMember;
		
	} // login();

}
