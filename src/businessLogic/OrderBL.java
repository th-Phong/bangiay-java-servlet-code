package businessLogic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBean.Order;


public class OrderBL {
	public static List<Order> TaoDanhSach(String sql) {
		List<Order> dsorder = new ArrayList<Order>();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Order order = new Order();
//				tên cột mysqls
				order.setId(rs.getInt("id"));
				order.setDiachi(rs.getString("diachi"));
				order.setTongtien(rs.getInt("tongtien"));
				order.setTenkhachhang(rs.getString("tenkhachhang"));
				order.setEmail(rs.getString("email"));
				order.setPhone(rs.getString("phone"));
				order.setNote(rs.getString("note"));
				order.setHinhthuc(rs.getString("hinhthuc"));
				order.setTinhtrang(rs.getString("tinhtrang"));
				order.setUsername(rs.getString("username"));
				// order.setItems(rs.getArray(""));
				dsorder.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dsorder;
	}

	public static void AddOrder(Order order, String user) {
		try (Connection cnn = CSDL.getKetnoi()) {
			String sql = "insert into `tbl_oder`(diachi,tongtien,tenkhachhang,email,phone,note,hinhthuc,tinhtrang,username) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = cnn.prepareStatement(sql);
			pstm.setString(1, order.getDiachi());
			pstm.setInt(2, order.getTongtien());
			pstm.setString(3, order.getTenkhachhang());
			pstm.setString(4, order.getEmail());
			pstm.setString(5, order.getPhone());
			pstm.setString(6, order.getNote());
			pstm.setString(7, order.getHinhthuc());
			pstm.setString(8, order.getTinhtrang());
			pstm.setString(9, user);
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//Đọc tất cả
	public static List<Order> DocTatCa() {
		String sql = "SELECT * FROM `tbl_oder`";
		List<Order> dsorder = TaoDanhSach(sql);
		return dsorder;
	}
	
	//Lấy hóa đơn theo mã
	public static List<Order> LayHoaDonTheoMa(int mahoadon) {
		String sql = "SELECT * FROM `tbl_oder` where id="+mahoadon;
		List<Order> dsorder = TaoDanhSach(sql);
		return dsorder;
	}
	
	
	public static Order GetOrderNew() {
		String sql = "SELECT * FROM `tbl_oder` ORDER by id DESC limit 1";
		Order order = new Order();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				
				order.setId(rs.getInt("id"));
				order.setDiachi(rs.getString("diachi"));
				order.setTongtien(rs.getInt("tongtien"));
				order.setTenkhachhang(rs.getString("tenkhachhang"));
				order.setEmail(rs.getString("email"));
				order.setPhone(rs.getString("phone"));
				order.setNote(rs.getString("note"));
				order.setHinhthuc(rs.getString("hinhthuc"));
				order.setTinhtrang(rs.getString("tinhtrang"));
				order.setUsername(rs.getString("username"));
				// order.setItems(rs.getArray(""));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return order;
	}
	
	public static void SuaOrder(Order order)
	{
		try (Connection cnn=CSDL.getKetnoi()){
			String sql="update `tbl_oder` set `diachi`=?,`tenkhachhang`=?,`email`=?,`phone`=?,`note`=?,`hinhthuc`=?,`tinhtrang`=? where `id`=?";
			PreparedStatement pstm= cnn.prepareStatement(sql);
			pstm.setString(1, order.getDiachi());
			pstm.setString(2,order.getTenkhachhang());
			pstm.setString(3, order.getEmail());
			pstm.setString(4, order.getPhone());
			pstm.setString(5, order.getNote());
			pstm.setString(6, order.getHinhthuc());
			pstm.setString(7, order.getTinhtrang());
			pstm.setInt(8, order.getId());
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static void XoaOrder(int id)
	{
		try (Connection cnn=CSDL.getKetnoi()){
			String sql="delete from `tbl_oder` where `id`="+id;
			PreparedStatement pstm= cnn.prepareStatement(sql);
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
//	public static void main(String[] args) {
//		int idorder = 0;
//		Order or=GetIdOrderNew();
//		idorder=or.getId();
//		System.out.println(idorder);
//	}
}
