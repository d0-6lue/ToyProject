package com.toy.chat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.toy.chat.vo.ChatVo;
import com.toy.chat.vo.ChatParticipantsVo;
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
		
	} // sendChat()

	
	public List<ChatVo> loadChatList(Connection conn, ChatParticipantsVo chatParticipantsVo, String lastChatNo) {
		
		List<ChatVo> chatList = new ArrayList<>();
		
		String sql = "SELECT CHAT_NO, M.MEMBER_NICK AS CHAT_SENDER, M.MEMBER_NICK AS CHAT_RECEIVER, CHAT_CONTENT, CHAT_ENROLL_DATE, CHAT_READ \r\n"
				+ "FROM chat_archive CA JOIN MEMBER M ON CA.CHAT_SENDER = M.MEMBER_NO\r\n"
				+ "                    JOIN MEMBER M ON CA.CHAT_RECEIVER = M.MEMBER_NO\r\n"
				+ "WHERE (select member_no from member where member_nick = ?) in (CHAT_SENDER, CHAT_RECEIVER)\r\n"
				+ "AND (select member_no from member where member_nick = ?) in (CHAT_SENDER, CHAT_RECEIVER)\r\n"
				+ "AND CHAT_NO > ?\r\n"
				+ "ORDER BY CHAT_NO";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatParticipantsVo.getSender());
			pstmt.setString(2, chatParticipantsVo.getReceiver());
			pstmt.setString(3, lastChatNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ChatVo cv = new ChatVo();
				
				cv.setChatNo(rs.getString("Chat_NO"));
				cv.setChatSender(rs.getString("CHAT_SENDER"));
				cv.setChatReceiver(rs.getString("CHAT_RECEIVER"));
				cv.setChatContent(rs.getString("CHAT_CONTENT"));
				cv.setChatEnrollDate(rs.getString("CHAT_ENROLL_DATE"));
				cv.setChatRead(rs.getString("CHAT_READ"));
				
				chatList.add(cv);
				
			}
			
		} catch (Exception e) {
			System.out.println("[error] ChatDao.loadChatList 중 문제 발생");
			e.printStackTrace();
			
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		
		return chatList;
		
	} // loadChatList()

	
	public int readCheck(Connection conn, ChatParticipantsVo chatParticipantsVo) {
		
		int result = 0;
		
		String sql = "UPDATE CHAT_ARCHIVE\r\n"
				+ "SET CHAT_READ = '0'\r\n"
				+ "WHERE CHAT_NO in (\r\n"
				+ "    select CHAT_NO\r\n"
				+ "    from chat_archive CA JOIN MEMBER M ON CA.CHAT_SENDER = M.MEMBER_NO\r\n"
				+ "                    JOIN MEMBER M ON CA.CHAT_RECEIVER = M.MEMBER_NO\r\n"
				+ "    where (select member_no from member where member_nick = ?) in CHAT_RECEIVER\r\n"
				+ "    AND (select member_no from member where member_nick = ?) in CHAT_SENDER\r\n"
				+ "    AND CHAT_READ = '1'\r\n"
				+ ")";
		
		PreparedStatement pstmt = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatParticipantsVo.getSender());
			pstmt.setString(2, chatParticipantsVo.getReceiver());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[error] ChatDao.readCheck 중 문제 발생");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	} // readCheck()

}
