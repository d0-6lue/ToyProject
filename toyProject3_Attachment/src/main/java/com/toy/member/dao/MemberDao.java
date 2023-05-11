package com.toy.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.toy.common.JDBCTemplate;
import com.toy.member.vo.MemberVo;

public class MemberDao {

	public int join(Connection conn, MemberVo memberVo) {
		
		int result = 0;
		
		String memberJoinSql = "INSERT INTO MEMBER \r\n"
				+ "(MEMBER_NO, MEMBER_ID, MEMBER_PW, MEMBER_NICK, MEMBER_PROFILE, MEMBER_STATUS, MEMBER_ENROLL_DATE, MEMBER_MODIFY_DATE)\r\n"
				+ "VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		
		PreparedStatement pstmt = null;
		try {
			
			pstmt = conn.prepareStatement(memberJoinSql);
			
			pstmt.setString(1, memberVo.getMemberId());
			pstmt.setString(2, memberVo.getMemberPw());
			pstmt.setString(3, memberVo.getMemberNick());
			pstmt.setString(4, memberVo.getMemberProfile());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	} // join

}
