package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	static final String ORACLE_DRIVER="oracle.jdbc.driver.OracleDriver"; 
	static final String ORACLE_URL="jdbc:oracle:thin:@localhost:1521:xe";

	static final String MYSQL_DRIVER="com.mysql.cj.jdbc.Driver";
	//내pc
	static final String MYSQL_URL="jdbc:mysql://localhost:3306/bitcamp?serverTimezone=Asia/Seoul";
	//강사님pc (ip변경)
	//static final String MYSQL_URL="jdbc:mysql://192.168.0.27:3306/bitcamp?serverTimezone=Asia/Seoul";
	
	public DbConnect()
	{
		try {
			Class.forName(MYSQL_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("mysql 드라이버 오류:"+e.getMessage());
		}
		
		try {
			Class.forName(ORACLE_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("oracle 드라이버 오류:"+e.getMessage());
		}
	}
	
	//oracle 서버 연결
	public Connection getOracleConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ORACLE_URL,"angel","a1234");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("oracle 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	
	//mysql 서버 연결
		public Connection getMysqlConnection()
		{
			Connection conn=null;
			try {
				conn=DriverManager.getConnection(MYSQL_URL,"angel","1234");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("mysql 연결 실패:"+e.getMessage());
			}
			return conn;
		}
		
	//close 들 - overloading method
	public void dbClose(Connection conn,Statement stmt) {
		// 호출하는 메서드의 클래스 타입은 레퍼런스 즉 주소가 넘어오므로
		// 호출하는 메서드의 변수가 close 된다.
		try {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch(SQLException e) {}
	}
	
	public void dbClose(Connection conn,Statement stmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch(SQLException e) {}
	}
	//PreparedStatement
	public void dbClose(Connection conn,PreparedStatement pstmt) {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch(SQLException e) {}
	}
	public void dbClose(Connection conn,PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch(SQLException e) {}
	}
	
}