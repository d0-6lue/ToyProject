package com.toy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "C##TOY";
		String dbPwd = "1234";
		
		Connection conn = null;
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(dbUrl, dbId, dbPwd);
			conn.setAutoCommit(false);
			
		} catch (Exception e) {
			System.out.println("[error] JDBCTemplate.getConnection() 중 문제 발생.");
			e.printStackTrace();
		}
		
		
		return conn;
	} // getConnection()
	
	
	public static void commit(Connection conn) {
		
		try {
			if( conn != null && !conn.isClosed() ) {
				conn.commit();
			}
		} catch (Exception e) {
			System.out.println("[error] JDBCTemplate.commit() 중 문제 발생.");
			e.printStackTrace();
		}
		
	} // commit()
	
	
	public static void rollback(Connection conn) {
		
		try {
			if( conn != null && !conn.isClosed() ) {
				conn.rollback();
			}
		} catch (Exception e) {
			System.out.println("[error] JDBCTemplate.rollback() 중 문제 발생.");
			e.printStackTrace();
		}
		
	} // rollback()
	
	
	public static void close(Connection conn) {
		
		try {
			if( conn != null && !conn.isClosed() ) {
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("[error] JDBCTemplate.close(Connection conn) 중 문제 발생.");
			e.printStackTrace();
		}
		
	} // close(Connection conn)
	
	
	public static void close(Statement stmt) {
		
		try {
			if( stmt != null && !stmt.isClosed() ) {
				stmt.close();
			}
		} catch (Exception e) {
			System.out.println("[error] JDBCTemplate.close(Statement stmt) 중 문제 발생.");
			e.printStackTrace();
		}
		
	} // close(Statement stmt)
	
	
	public static void close(ResultSet rs) {
		
		try {
			if( rs != null && !rs.isClosed() ) {
				rs.close();
			}
		} catch (Exception e) {
			System.out.println("[error] JDBCTemplate.close(ResultSet rs) 중 문제 발생.");
			e.printStackTrace();
		}
		
	} // close(ResultSet rs)

}
