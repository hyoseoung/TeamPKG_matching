package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

public class ConnectDB {
	public Connection con;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public ConnectDB (ServletContext application) {
		try {
			//jdbc driver load
			String driver=application.getInitParameter("OracleDriver");
			Class.forName(driver);
			//db connect
			String url=application.getInitParameter("OracleUrl");
			String id=application.getInitParameter("OracleId");
			String pw=application.getInitParameter("OraclePw");
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결(초기화 매개변수)");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
			System.out.println("DB CP connection 반납");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
