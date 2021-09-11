package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessLogic.OrderBL;

/**
 * Servlet implementation class XoaChonOrderServlet
 */
@WebServlet({"/XoaChonOrderServlet","/xoachonorder.html"})
public class XoaChonOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaChonOrderServlet() {
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
		String[] dsid = request.getParameterValues("xoachon");
		
		int[] ints = new int[dsid.length];
		for (int a=0; a<dsid.length; a++) {   
		   try {
		      ints[a] = Integer.parseInt(dsid[a]);
		   } catch (Exception e) {
		       //do something to process error
		   }
		}
		for (int id :ints) {
			OrderBL.XoaOrder(id);
		}
		
		response.sendRedirect("order.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
