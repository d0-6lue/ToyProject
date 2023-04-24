package com.kh.toy.chat.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.toy.chat.dao.ChatDao;
import com.kh.toy.chat.vo.ChatRoomVo;
import com.kh.toy.chat.vo.ChatVo;
import com.kh.toy.util.JDBCTemplate;

public class ChatService {

	public int createChatRoom(ChatRoomVo vo) {
		
		int result = 0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		ChatDao dao = new ChatDao();
		result = dao.createChatRoom(conn, vo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	} // createChatRoom

	
	public List<ChatRoomVo> loadChatRoom() {
		
		List<ChatRoomVo> chatRoomList = new ArrayList<>();
		
		Connection conn = JDBCTemplate.getConnection();
		
		ChatDao dao = new ChatDao();
		
		chatRoomList = dao.loadChatRoom(conn);
		
		JDBCTemplate.close(conn);
		
		return chatRoomList;
		
	} // loadChatRoom()

	
	public List<ChatVo> loadChatList(String chatRoomNo, String lastChatNo) {
		
		List<ChatVo> chatVoList = new ArrayList<>();
		
		Connection conn = JDBCTemplate.getConnection();
		
		
		ChatDao dao = new ChatDao();
		chatVoList = dao.loadChatList(conn, chatRoomNo, lastChatNo);
		
		
		JDBCTemplate.close(conn);
		
		return chatVoList;
		
	} // loadChatList()


	public int sendChat(ChatVo chatVo) {
		
		int result = 0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		
		ChatDao dao = new ChatDao();
		result = dao.sendChat(conn, chatVo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		return result;
		
	} // sendChat()

}
