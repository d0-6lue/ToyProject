package com.toy.member.service;

import java.sql.Connection;

import com.toy.common.JDBCTemplate;
import com.toy.member.dao.MemberDao;
import com.toy.member.vo.MemberVo;

public class MemberService {

	public int join(MemberVo memberVo) {
		
		int result = 0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		MemberDao memberDao = new MemberDao();
		result = memberDao.join(conn, memberVo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	} // join

	public MemberVo login(MemberVo memberVo) {
		
		MemberVo loginMember = null;
		
		
		return loginMember;
	}

}
