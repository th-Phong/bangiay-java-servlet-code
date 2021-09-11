package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import businessLogic.ItemBL;
import businessLogic.OrderBL;
import javaBean.Account;
import javaBean.Item;
import javaBean.Order;

/**
 * Servlet implementation class AddOrderToSQLServlet
 */
@WebServlet({ "/AddOrderToSQLServlet", "/addorder.html" })
public class AddOrderToSQLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddOrderToSQLServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String note=request.getParameter("note");
		String paymentmethod=request.getParameter("payment-method");
		String address=request.getParameter("address");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		String tinhtrang="Thành công";
		if (paymentmethod.equalsIgnoreCase("Thanh toán online")) {
			tinhtrang="Đang xử lý";
		}
		
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		
		order.setHinhthuc(paymentmethod);
		order.setNote(note);
		order.setDiachi(address);
		order.setTenkhachhang(name);
		order.setEmail(email);
		order.setPhone(phone);
		order.setTinhtrang(tinhtrang);
		
		List<Item> listitem = order.getItems();
		Account acc = (Account) session.getAttribute("acc");
		// kiểm tra thông tin đơn hàng trước khi thêm vào mysql
		if (acc == null) {
			response.sendRedirect("index.html?logintocheckout=1");
		} else {
			OrderBL.AddOrder(order,acc.getUsername()); //Thêm order
			
			//Lấy đơn hàng mới nhất để lấy id đơn hàng
			Order ordernew=OrderBL.GetOrderNew();
			int idordernew=ordernew.getId();
			
			int idorder=order.getId();
			//Thêm chi tiết sản phẩm trong order
			for (Item item : listitem) {
				ItemBL.AddItemInOrder(idordernew, item);
			}
			session.removeAttribute("order");
			response.sendRedirect("index.html?success=ok");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
