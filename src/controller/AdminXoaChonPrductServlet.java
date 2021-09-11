package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessLogic.OrderBL;
import businessLogic.ProductBL;

/**
 * Servlet implementation class AdminXoaChonPrductServlet
 */
@WebServlet({"/AdminXoaChonPrductServlet","/adminxoachonproduct.html"})
public class AdminXoaChonPrductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminXoaChonPrductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String[] dsidproduct = request.getParameterValues("xoachon");
		
		int[] ints = new int[dsidproduct.length];
		for (int a=0; a<dsidproduct.length; a++) {   
		   try {
		      ints[a] = Integer.parseInt(dsidproduct[a]);
		   } catch (Exception e) {
		       //do something to process error
		   }
		}
		for (int id :ints) {
			ProductBL.XoaProduct(id);
		}
		
		response.sendRedirect("adminproduct.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
