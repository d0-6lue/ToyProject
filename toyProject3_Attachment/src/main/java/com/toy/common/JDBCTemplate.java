package com.toy.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		String dbDriver = "oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "C##TOY";
		String dbPw = "1234";
		
		try {
			
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			conn.setAutoCommit(false);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return conn;
		
	} // getConnection
	
	
	public static void commit(Connection conn) {
		
		try {
			
			if( conn != null && !conn.isClosed() ) {
				conn.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // commit
	
	
	public static void rollback(Connection conn) {
		
		try {
			
			if( conn != null && !conn.isClosed() ) {
				conn.rollback();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // rollback
	
	
	public static void close(Connection conn) {
		
		try {
			
			if( conn != null && !conn.isClosed() ) {
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // close(Connection conn)
	
	
	public static void close(Statement stmt) {
		
		try {
			
			if( stmt != null && !stmt.isClosed() ) {
				stmt.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // close(Statement stmt)
	
	
	public static void close(ResultSet rs) {
		
		try {
			
			if( rs != null && !rs.isClosed() ) {
				rs.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // close(ResultSet rs)
	
}
