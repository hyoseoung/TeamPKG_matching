package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectDB {
	public Connection con;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	 public ConnectDB() {
		   try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source=(DataSource)ctx.lookup("oracleSource");
			con= source.getConnection();
			System.out.println("DB CP connect success");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB CP connect fail");
		}
	   }
	   
	   public void close() {
	      try {
	         if(rs!=null) rs.close();
	         if(psmt!=null) psmt.close();
	         if (con != null) con.close();
	         System.out.println("DB 커넥션 반납");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	   }
}
