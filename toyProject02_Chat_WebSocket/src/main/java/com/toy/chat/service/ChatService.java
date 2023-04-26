package com.toy.chat.service;

import java.sql.Connection;

import com.toy.chat.dao.ChatDao;
import com.toy.chat.vo.ChatVo;
import com.toy.util.JDBCTemplate;

public class ChatService {

	private final ChatDao dao = new ChatDao();
	
	public int sendChat(ChatVo chatVo) {
		
		int result = 0;
		
		Connection conn = JDBCTemplate.getConnection();
		
		result = dao.sendChat(conn, chatVo);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	}

}
