package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessLogic.OrderBL;
import javaBean.Order;

/**
 * Servlet implementation class SuaOrderServlet
 */
@WebServlet({ "/SuaOrderServlet", "/suaorder.html" })
public class SuaOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SuaOrderServlet() {
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
		
			int id = Integer.parseInt(request.getParameter("idorder"));
			String diachi = request.getParameter("diachi");
			int tongtien = Integer.parseInt(request.getParameter("tongtien"));
			String tenkhachhang = request.getParameter("tenkhachhang");
			String email = request.getParameter("email");
			String phone = request.getParameter("sodienthoai");
			String note = request.getParameter("ghichu");
			String hinhthuc = request.getParameter("hinhthucthanhtoan");
			String tinhtrang = request.getParameter("trangthaidonhang");
			String username = request.getParameter("username");
				
			Order order = new Order();
			order.setId(id);
			order.setDiachi(diachi);
			order.setTongtien(tongtien);
			order.setTenkhachhang(tenkhachhang);
			order.setEmail(email);
			order.setPhone(phone);
			order.setNote(note);
			order.setHinhthuc(hinhthuc);
			order.setTinhtrang(tinhtrang);
			order.setUsername(username);

			OrderBL.SuaOrder(order);
		
		response.sendRedirect("order.html");
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
