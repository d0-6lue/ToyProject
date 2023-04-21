package com.kh.toy.chat.service;

import java.sql.Connection;

import com.kh.toy.chat.dao.ChatDao;
import com.kh.toy.chat.vo.ChatRoomVo;
import com.kh.toy.util.JDBCTemplate;

public class ChatService {

	public int createChatRoom(ChatRoomVo vo) {
		
		int result = 0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		ChatDao dao = new ChatDao();
		result = dao.createChatRoom(conn, vo);
		
		if(result == 1) {
			
		}
		else {
			
		}
		
		return result;
	}

}
