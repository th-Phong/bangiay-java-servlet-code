package businessLogic;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBean.Order;
import javaBean.Product;

public class ProductBL {
	public static List<Product> TaoDanhSach(String sql) {
		List<Product> dsp = new ArrayList<Product>();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Product pro = new Product();
//				tên cột mysqls
				pro.setId(rs.getInt("idproduct"));
				pro.setName(rs.getString("name"));
				pro.setPrice(rs.getInt("price"));
				pro.setAmount(rs.getInt("amount"));
				pro.setImage(rs.getString("image"));
				pro.setCategory(rs.getInt("idcate"));
				pro.setSale(rs.getInt("sale"));
				pro.setDescription(rs.getString("description"));				
				pro.setSex(rs.getString("sex"));
				dsp.add(pro);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dsp;
	}

	public static List<Product> DocTatCa() {
		String sql = "SELECT * FROM `tbl_product`";
		List<Product> dsp = TaoDanhSach(sql);
		return dsp;
	}
	
	public static List<Product> LaySanPhamMoi() {
		String sql = "SELECT * FROM `tbl_product` ORDER BY idproduct DESC limit 6";
		List<Product> dsp_new = TaoDanhSach(sql);
		return dsp_new;
	}
	public static List<Product> DocChiTiet(int productid) {
		String sql = "SELECT * FROM `tbl_product` where idproduct="+productid;
		List<Product> detailpro = TaoDanhSach(sql);
		return detailpro;
	}
	public static Product GetProByID(int productid) {
		String sql = "SELECT * FROM `tbl_product` where idproduct="+productid;
		Product product = new Product();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				product.setId(rs.getInt("idproduct"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setAmount(rs.getInt("amount"));
				product.setImage(rs.getString("image"));
				product.setCategory(rs.getInt("idcate"));
				product.setSale(rs.getInt("sale"));
				product.setDescription(rs.getString("description"));			
				product.setSex(rs.getString("sex"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return product;
	}
	public static List<Product> LaySanPhamTheoGioiTinh(String sex) {
		String sql = "SELECT * FROM `tbl_product` where sex='all' or sex='"+sex+"'";
		List<Product> dsp_gioitinh = TaoDanhSach(sql);
		return dsp_gioitinh;
	}
	public static List<Product> LaySanPhamTheoDanhMucKhongGioiTinh(int cateid) {
		String sql = "SELECT * FROM `tbl_product` where idcate="+cateid;
		List<Product> dspro_danhmuc_no_gt = TaoDanhSach(sql);
		return dspro_danhmuc_no_gt;
	}
	public static List<Product> LaySanPhamTheoDanhMuc(String sex,int cateid) {
		String sql = "SELECT * FROM `tbl_product` where (sex='all' or sex='"+sex+"') and idcate="+cateid;
		List<Product> dspro_danhmuc = TaoDanhSach(sql);
		return dspro_danhmuc;
	}
	public static List<Product> TimKiemSanPham(String name) {
		String sql = "SELECT * FROM `tbl_product` where name like '%"+name+"%'";
		List<Product> dsp_gioitinh = TaoDanhSach(sql);
		return dsp_gioitinh;
	}
	
	//Phân trang SẢN PHẨM THEO GIỚI TÍNH
	public static int tongSoTrangGT(int soDongTrang,String sex) {
		String sql = "SELECT * FROM `tbl_product` where sex='all' or sex='"+sex+"'";
		int tongSoTrang,tongSoDong;
		List<Product> dsp_pt=TaoDanhSach(sql);
		tongSoDong=dsp_pt.size();
		tongSoTrang=tongSoDong/soDongTrang+(tongSoDong%soDongTrang==0?0:1);
		return tongSoTrang;
	}
	
		
	public static List<Product> phanTrangGT(int soDongTrang,int trang,String sex){
		int vitri=(trang-1)*soDongTrang;
		String sql="SELECT * FROM `tbl_product` where sex='all' or sex='"+sex+"' limit "+vitri+","+soDongTrang;
		List<Product> dsma_pt=TaoDanhSach(sql);
		return dsma_pt;
	}
	//Phân trang TẤT CẢ SẢN PHẨM
		public static int tongSoTrang(int soDongTrang) {
			String sql = "SELECT * FROM `tbl_product`";
			int tongSoTrang,tongSoDong;
			List<Product> dsp_pt=TaoDanhSach(sql);
			tongSoDong=dsp_pt.size();
			tongSoTrang=tongSoDong/soDongTrang+(tongSoDong%soDongTrang==0?0:1);
			return tongSoTrang;
		}
		
			
		public static List<Product> phanTrang(int soDongTrang,int trang){
			int vitri=(trang-1)*soDongTrang;
			String sql="SELECT * FROM `tbl_product` limit "+vitri+","+soDongTrang;
			List<Product> dsma_pt=TaoDanhSach(sql);
			return dsma_pt;
		}
	
	//Lấy sản phẩm bán chạy
	public static List<Object> BestSeller(){		
		String sql="SELECT tbl_product.`idproduct`,SUM(soluong), `name`, `price`, `amount`, `image`, `idcate`, `sale`, `description`, `sex`  FROM `tbl_order_session`,tbl_product WHERE tbl_product.idproduct=tbl_order_session.idproduct GROUP by idproduct ORDER by SUM(soluong) DESC limit 5";
		List<Object> dsp = new ArrayList<Object>();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Product pro = new Product();
//				tên cột mysqls
				pro.setId(rs.getInt("tbl_product.idproduct"));
				pro.setName(rs.getString("name"));
				pro.setPrice(rs.getInt("price"));
				pro.setAmount(rs.getInt("amount"));
				pro.setImage(rs.getString("image"));
				pro.setCategory(rs.getInt("idcate"));
				pro.setSale(rs.getInt("sale"));
				pro.setDescription(rs.getString("description"));		
				pro.setSex(rs.getString("sex"));
				dsp.add(pro);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dsp;
	}

	//Thêm sản phẩm
	public static void AddProduct(Product product) {
		try (Connection cnn = CSDL.getKetnoi()) {
			String sql = "INSERT INTO `tbl_product`(`name`, `price`, `amount`, `image`, `idcate`, `sale`, `description`, `sex`) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = cnn.prepareStatement(sql);
			pstm.setString(1, product.getName());
			pstm.setInt(2, product.getPrice());
			pstm.setInt(3, product.getAmount());
			pstm.setString(4, product.getImage());
			pstm.setInt(5, product.getCategory());
			pstm.setInt(6, product.getSale());
			pstm.setString(7, product.getDescription());
			pstm.setString(8, product.getSex());
			
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//Sửa sản phẩm
	public static void SuaProduct(Product pro)
	{
		try (Connection cnn=CSDL.getKetnoi()){
			String sql="UPDATE `tbl_product` SET `name`=?,`price`=?,`amount`=?,`image`=?,`idcate`=?,`sale`=?,`description`=?,`sex`=? WHERE `idproduct`=?";
			PreparedStatement pstm= cnn.prepareStatement(sql);
			pstm.setString(1, pro.getName());
			pstm.setInt(2,pro.getPrice());
			pstm.setInt(3, pro.getAmount());
			pstm.setString(4, pro.getImage());
			pstm.setInt(5, pro.getCategory());
			pstm.setInt(6, pro.getSale());
			pstm.setString(7, pro.getDescription());		
			pstm.setString(8, pro.getSex());
			pstm.setInt(9, pro.getId());
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//Xóa sản phẩm
		public static void XoaProduct(int idpro)
		{
			try (Connection cnn=CSDL.getKetnoi()){
				String sql="delete from `tbl_product` where `idproduct`="+idpro;
				PreparedStatement pstm= cnn.prepareStatement(sql);
				pstm.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	
	
//	public static void main(String[] args) {
//		int count=DocTatCa().size();
//		System.out.println(count);
//	}
}
