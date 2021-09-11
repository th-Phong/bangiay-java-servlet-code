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
 * Servlet implementation class ProductDanhMucNOGT
 */
@WebServlet({"/ProductDanhMucNOGT", "/productdanhmucnogt.html"})
public class ProductDanhMucNOGT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDanhMucNOGT() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		List<Category> dscate = CategoryBL.DocTatCa();
		request.setAttribute("dscate", dscate);

		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("id", id);
		String title= request.getParameter("title");
		request.setAttribute("title", title);
		
		List<Product> dsp_danhmuc_no_gt = ProductBL.LaySanPhamTheoDanhMucKhongGioiTinh(id);
		request.setAttribute("dsp_danhmuc_no_gt", dsp_danhmuc_no_gt);

		request.getRequestDispatcher("index.html").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
