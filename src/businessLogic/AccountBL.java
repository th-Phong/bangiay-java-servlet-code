package businessLogic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBean.Account;

public class AccountBL {
	public static List<Account> TaoDanhSach(String sql) {
		List<Account> dsacc = new ArrayList<Account>();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Account acc = new Account();
//				tên cột mysqls
				acc.setUsername(rs.getString("username"));
				acc.setName(rs.getString("name"));
				acc.setEmail(rs.getString("email"));
				acc.setPhone(rs.getString("phone"));
				acc.setAddress(rs.getString("address"));
				acc.setPassword(rs.getString("password"));
				acc.setIsadmin(rs.getInt("isadmin"));
				dsacc.add(acc);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dsacc;
	}
	
	public static Account Tao1Account(String sql) {
		Account acc = new Account();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {			
//				tên cột mysqls
				acc.setUsername(rs.getString("username"));
				acc.setName(rs.getString("name"));
				acc.setEmail(rs.getString("email"));
				acc.setPhone(rs.getString("phone"));
				acc.setAddress(rs.getString("address"));
				acc.setPassword(rs.getString("password"));
				acc.setIsadmin(rs.getInt("isadmin"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return acc;
	}

	public static List<Account> DocTatCa() {
		String sql = "SELECT * FROM `tbl_user`";
		List<Account> dsacc = TaoDanhSach(sql);
		return dsacc;
	}

	public static Account LayAccount(String username, String password) {
		String sql = "SELECT * FROM `tbl_user` where BINARY username='" + username + "' and BINARY password='"
				+ password + "'";
		// String sql = "SELECT * FROM `tbl_user` where BINARY username='111' and BINARY
		// password='222'";
		Account user = Tao1Account(sql);
		return user;
	}

//	public static void main(String[] args) {
//		int count = LayAccount("111", "222").size();
//		System.out.println(count);
//	}
}
