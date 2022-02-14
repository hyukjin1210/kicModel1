package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcConnection {
	// Connection : oracle server 연결 sql 전달객체
	// jdbc:oracle:thin:@localhost:1521:xe 연결 url
	// kic : user id , 1111 : password
	public static Connection getConnection() {

		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "kic";
		String password = "1111";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, userId, password);
			// System.out.println("ok db");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("error db");
			e.printStackTrace();
		}
		return con;

	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (con != null) {
				con.commit();
				con.close();
			}
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
