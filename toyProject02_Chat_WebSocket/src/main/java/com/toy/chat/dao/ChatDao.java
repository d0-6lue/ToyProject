package com.toy.chat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.toy.chat.vo.ChatVo;
import com.toy.util.JDBCTemplate;

public class ChatDao {

	public int sendChat(Connection conn, ChatVo chatVo) {
		
		int result = 0;
		
		String sql = "INSERT INTO CHAT_ARCHIVE VALUES(\r\n"
				+ "        SEQ_CHAT_NO.NEXTVAL\r\n"
				+ "    ,   (SELECT MEMBER_NO\r\n"
				+ "        FROM MEMBER\r\n"
				+ "        WHERE MEMBER_NICK = ?)\r\n"
				+ "    , (SELECT MEMBER_NO\r\n"
				+ "        FROM MEMBER\r\n"
				+ "        WHERE MEMBER_NICK = ?)\r\n"
				+ "    ,   ?\r\n"
				+ "    ,   DEFAULT\r\n"
				+ "    ,   DEFAULT\r\n"
				+ ")";
		
		PreparedStatement  pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatVo.getChatSender());
			pstmt.setString(2, chatVo.getChatReceiver());
			pstmt.setString(3, chatVo.getChatContent());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			
			System.out.println("[error] ChatDao.sendChat 중 문제 발생");
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

}
