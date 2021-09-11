package businessLogic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBean.Item;
import javaBean.Order;

public class ItemBL {
	public static List<Item> TaoDanhSach(String sql) {
		List<Item> dsitem = new ArrayList<Item>();
		try (Connection kn = CSDL.getKetnoi()) {
			Statement stm = kn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Item item = new Item();
//				tên cột mysqls
				item.setId(rs.getInt("id"));			
				item.setColor(rs.getString("color"));
				item.setSize(rs.getString("size"));
				item.setSoluong(rs.getInt("soluong"));		
				item.setIdproduct(rs.getInt("idproduct"));			
				
				dsitem.add(item);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dsitem;
	}
	public static void AddItemInOrder(int idorder,Item item)
	{
		try (Connection cnn=CSDL.getKetnoi()){
			String sql="INSERT INTO `tbl_order_session`(`id`, `idproduct`, `color`, `size`, `soluong`) VALUES (?,?,?,?,?)";
			PreparedStatement pstm= cnn.prepareStatement(sql);
			pstm.setInt(1,idorder);
			pstm.setInt(2, item.getPro().getId());
			pstm.setString(3,item.getColor());
			pstm.setString(4, item.getSize());
			pstm.setInt(5, item.getSoluong());
			pstm.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
