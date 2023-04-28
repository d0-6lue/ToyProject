package com.toy.chat.service;

import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;

import com.toy.chat.dao.ChatDao;
import com.toy.chat.vo.ChatVo;
import com.toy.chat.vo.ChatParticipantsVo;
import com.toy.util.JDBCTemplate;

public class ChatService {

	private final ChatDao dao = new ChatDao();
	
	public int sendChat(ChatVo chatVo) {
		
		int result = 0;
		
		Connection conn = null;
		try {
			
			conn = JDBCTemplate.getConnection();
			
			result = dao.sendChat(conn, chatVo);
			
			if(result == 1) {
				JDBCTemplate.commit(conn);
			}
			else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (Exception e) {
			System.out.println("[error] ChatService.sendChat 중 문제 발생");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
		
	} // sendChat()

	public List<ChatVo> loadChatList(ChatParticipantsVo chatParticipantsVo, String lastChatNo) {
		
		List<ChatVo> chatList = new ArrayList<>();
		
		Connection conn = null;
		try {
			
			conn = JDBCTemplate.getConnection();
			
			chatList = dao.loadChatList(conn, chatParticipantsVo, lastChatNo);
			
		} catch (Exception e) {
			System.out.println("[error] ChatService.loadChatList 중 문제 발생");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return chatList;
		
	} // loadChatList()

	
	public int readCheck(ChatParticipantsVo chatParticipantsVo) {
		
		int result = 0;
		
		Connection conn = null;
		try {
			
			conn = JDBCTemplate.getConnection();
			
			result = dao.readCheck(conn, chatParticipantsVo);
			
			if(result == 1) {
				JDBCTemplate.commit(conn);
			}
			else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (Exception e) {
			System.out.println("[error] ChatService.readCheck 중 문제 발생");
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		
		return result;
		
	} // readCheck()

}
