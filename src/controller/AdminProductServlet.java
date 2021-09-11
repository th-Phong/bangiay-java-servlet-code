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
 * Servlet implementation class AdminProductServlet
 */
@WebServlet({ "/AdminProductServlet", "/adminproduct.html" })
public class AdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductServlet() {
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
		List<Product> dsproduct = ProductBL.DocTatCa();
		request.setAttribute("dsproduct", dsproduct);
		request.getRequestDispatcher("index.html?adminpro=ok").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
