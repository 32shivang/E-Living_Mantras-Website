package eliving.dbtasks;

import java.sql.*;

public class CrudOperation { // create,read,update,delete
	public static Connection cn;
	private static PreparedStatement ps;
	private static ResultSet rs;
	public static ResultSet getData(String sql,String idinfo) {
		try {
			cn=createConnection();
			ps=cn.prepareStatement(sql);
			ps.setString(1, idinfo);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se) {
			System.out.println(se);
		}
		return rs;
	}
	
	public static ResultSet getData(String sql,String idinfo,String msg) {
		try {
			cn=createConnection();
			ps=cn.prepareStatement(sql);
			ps.setString(1, idinfo);
			ps.setString(2, msg);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se) {
			System.out.println(se);
		}
		return rs;
	}
	
	public static ResultSet getData(String sql,int idinfo) {
		try {
			cn=createConnection();
			ps=cn.prepareStatement(sql);
			ps.setInt(1, idinfo);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se) {
			System.out.println(se);
		}
		return rs;
	}
	
	
	public static ResultSet getData(String sql) {
		try {
			cn=createConnection();
			ps=cn.prepareStatement(sql);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se) {
			System.out.println(se);
		}
		
		
		
		return rs;
	}
	public static Connection createConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eliving", "root", "root");//jdbc:mysql it is a protocol
			//above line in " " is a connection line
		} catch (ClassNotFoundException | SQLException cse) {
			System.out.println(cse);
		}
		return cn;
	}
	
	
	
}