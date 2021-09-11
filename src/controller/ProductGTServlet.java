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
 * Servlet implementation class ProductGTServlet
 */
@WebServlet({ "/ProductGTServlet", "/productgioitinh.html" })
public class ProductGTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int soDongTrang = 6;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductGTServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		List<Category> dscate = CategoryBL.DocTatCa();
		request.setAttribute("dscate", dscate);

		String sex = request.getParameter("sex");
		request.setAttribute("sex1", sex);

		List<Product> dsp_gioitinh = ProductBL.LaySanPhamTheoGioiTinh(sex);
		request.setAttribute("dsp_gioitinh", dsp_gioitinh);

		// Phân trang

		int tongSoTrang = ProductBL.tongSoTrangGT(6, sex);
		int trang;
		if (request.getParameter("trang") == null)
			trang = 1;
		else
			trang = Integer.parseInt(request.getParameter("trang"));
		List<Product> dsptgt = ProductBL.phanTrangGT(6, trang, sex);

		request.setAttribute("dsptgt", dsptgt);
		request.setAttribute("trang", trang);
		request.setAttribute("tongSoTrang", tongSoTrang);

		request.getRequestDispatcher("index.html").forward(request, response);
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
