package businessLogic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBean.Category;

public class CategoryBL {
	public static List<Category> TaoDanhSach(String sql) {
		List<Category> dscate = new ArrayList<Category>();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Category cate = new Category();
				cate.setId(rs.getInt("idcate"));
				cate.setTitle(rs.getString("title"));
				cate.setContent(rs.getString("content"));
				dscate.add(cate);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dscate;
	}

	public static List<Category> DocTatCa() {
		String sql = "SELECT * FROM `tbl_category`";
		List<Category> dscate = TaoDanhSach(sql);
		return dscate;
	}
	
//	public static void main(String[] args) {
//		int count=DocTatCa().size();
//		System.out.println(count);
//	}
}
