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
 * Servlet implementation class ProductServlet
 */
@WebServlet({ "/ProductServlet", "/product.html" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		List<Product> dsp = ProductBL.DocTatCa();
//		request.setAttribute("dsp", dsp);
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		List<Category> dscate = CategoryBL.DocTatCa();
		request.setAttribute("dscate", dscate);

		String sex = request.getParameter("sex");
		String title= request.getParameter("title");
		
		request.setAttribute("sex", sex);
		request.setAttribute("title", title);
		
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("id", id);
		List<Product> dsp_gioitinh_danhmuc = ProductBL.LaySanPhamTheoDanhMuc(sex, id);
		request.setAttribute("dsp_gioitinh_danhmuc", dsp_gioitinh_danhmuc);

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
