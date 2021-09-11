package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import businessLogic.CategoryBL;
import businessLogic.ProductBL;
import javaBean.Category;

import javaBean.Product;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet({ "/IndexServlet", "/index.html" })
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int soDongTrang = 6;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
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
		// Lấy danh mục sản phẩm
		List<Category> dscate = CategoryBL.DocTatCa();
		request.setAttribute("dscate", dscate);
		// Lấy danh sách sản phẩm
		List<Product> dsp = ProductBL.DocTatCa();
		request.setAttribute("dsp", dsp);
		// Lấy danh sách sản phẩm mới
		List<Product> dsp_new = ProductBL.LaySanPhamMoi();
		request.setAttribute("dsp_new", dsp_new);
		// Lấy danh sách sản phẩm bán chạy
		List<Object> ds_bestseller = ProductBL.BestSeller();
		request.setAttribute("ds_bestseller", ds_bestseller);

		// Phân trang
		//String sql = "select * from product";
		int tongSoTrang = ProductBL.tongSoTrang(6);
		int trang;
		if (request.getParameter("trang") == null)
			trang = 1;
		else
			trang = Integer.parseInt(request.getParameter("trang"));
		List<Product> dspt = ProductBL.phanTrang(6, trang);

		request.setAttribute("trang", trang);
		request.setAttribute("tongSoTrang", tongSoTrang);
		request.setAttribute("dspt", dspt);
		//
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
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
