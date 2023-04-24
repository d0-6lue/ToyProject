package com.kh.toy.chat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.toy.chat.vo.ChatRoomVo;
import com.kh.toy.chat.vo.ChatVo;
import com.kh.toy.util.JDBCTemplate;

public class ChatDao {

	public int createChatRoom(Connection conn, ChatRoomVo vo) {
		
		int result = 0;
		
		String sql = "INSERT INTO CHAT_ROOM VALUES(SEQ_CHAT_ROOM_NO.NEXTVAL, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getChatRoomName());
			pstmt.setString(2, vo.getChatRoomMax());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[error] ChatDao.createChatRoom() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	} // createChatRoom()

	
	public List<ChatRoomVo> loadChatRoom(Connection conn) {
		
		List<ChatRoomVo> chatRoomList = new ArrayList<>();
		
		String sql = "SELECT CHAT_ROOM_NO, CHAT_ROOM_NAME, CHAT_ROOM_MAX FROM CHAT_ROOM ORDER BY CHAT_ROOM_NO DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {

				ChatRoomVo vo = new ChatRoomVo();
				vo.setChatRoomNo(rs.getString("CHAT_ROOM_NO"));
				vo.setChatRoomName(rs.getString("CHAT_ROOM_NAME"));
				vo.setChatRoomMax(rs.getString("CHAT_ROOM_MAX"));
				
				chatRoomList.add(vo);
				
			}
			
		} catch (Exception e) {
			System.out.println("[error] ChatDao.loadChatRoom() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		return chatRoomList;
		
	} // loadChatRoom()

	
	public List<ChatVo> loadChatList(Connection conn, String chatRoomNo) {
		
		List<ChatVo> chatVoList = new ArrayList<>();
		
		String sql = "SELECT CHAT_NO, CHAT_SENDER, CHAT_CONTENT, CHAT_ENROLL_DATE FROM CHAT_ARCHIVE WHERE CHAT_ROOM_NO = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatRoomNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ChatVo vo = new ChatVo();
				
				vo.setChatNo(rs.getString("CHAT_NO"));
				vo.setChatSender(rs.getString("CHAT_SENDER"));
				vo.setChatContent(rs.getString("CHAT_CONTENT"));
				vo.setChatEnrollDate(rs.getString("CHAT_ENROLL_DATE"));
				
				chatVoList.add(vo);
				
			}
			
		} catch (Exception e) {
			System.out.println("[error] ChatDao.loadChatList() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		
		
		return chatVoList;
		
	} // loadChatList()


	public int sendChat(Connection conn, ChatVo chatVo) {
		
		int result = 0;
		
		String sql = "INSERT INTO CHAT_ARCHIVE VALUES ( SEQ_CHAT_ARCHIVE_NO.NEXTVAL, ?, ?, ?, DEFAULT )";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatVo.getChatRoomNo());
			pstmt.setString(2, chatVo.getChatSender());
			pstmt.setString(3, chatVo.getChatContent());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("[error] ChatDao.loadChatList() 중 문제 발생.");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	} // sendChat()

}
