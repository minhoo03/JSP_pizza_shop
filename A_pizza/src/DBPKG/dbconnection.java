package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbconnection {
	
	public static Connection getConnection() throws Exception
	{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		return conn;
	}
	
	public static ResultSet getRs(String sql) throws Exception
	{
		Connection conn = getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		return rs;
	}
	
	public static int Insert(String sql) throws Exception
	{
		Connection conn = getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		return stmt.executeUpdate();
	}
	
}
