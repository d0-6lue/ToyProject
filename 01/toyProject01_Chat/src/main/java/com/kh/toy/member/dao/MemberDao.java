package com.kh.toy.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kh.toy.member.vo.MemberVo;
import com.kh.toy.util.JDBCTemplate;

public class MemberDao {

	public int join(Connection conn, MemberVo vo) {
		
		int result = 0;
		
		String sql = "INSERT INTO MEMBER "
				+ "(MEMBER_NO, MEMBER_ID, MEMBER_PWD, MEMBER_NICK, ADDRESS) "
				+ "VALUES (SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?)";
		try(
				PreparedStatement pstmt = conn.prepareStatement(sql);
				)
		{
			
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getMemberPwd());
			pstmt.setString(3, vo.getMemberNick());
			pstmt.setString(4, vo.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[error] MemberDao.join() 중 문제 발생.");
			e.printStackTrace();
		}
		
		return result;
		
	} // join()
	

	public MemberVo login(Connection conn, MemberVo vo) {
		
		MemberVo loginMember = new MemberVo();
		
		String sql = "SELECT MEMBER_NO, MEMBER_ID, MEMBER_NICK FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ? ";
		
		ResultSet rs = null;
		try(
				PreparedStatement pstmt = conn.prepareStatement(sql);
				)
		{
			
			pstmt.setString(1, vo.getMemberId());
			pstmt.setString(2, vo.getMemberPwd());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				loginMember.setMemberNo(rs.getString("MEMBER_NO"));
				loginMember.setMemberId(rs.getString("MEMBER_ID"));
				loginMember.setMemberNick(rs.getString("MEMBER_NICK"));
				
			}
			else {
				loginMember = null;
			}
			
		} catch (Exception e) {
			System.out.println("[error] MemberDao.login() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
		}
		
		return loginMember;
		
	} // login()

}
