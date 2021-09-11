package businessLogic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CSDL {
	private static Connection ketnoi;

	public static Connection getKetnoi() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/shoe?useUnicode=true&characterEndcoding=UTF-8";
			ketnoi = DriverManager.getConnection(url, "root", "");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ketnoi;
	}

	public static void main(String[] args) {
		try {
			Connection test = getKetnoi();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
