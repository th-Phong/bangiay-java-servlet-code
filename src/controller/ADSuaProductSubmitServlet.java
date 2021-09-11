package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import businessLogic.ProductBL;

import javaBean.Product;

/**
 * Servlet implementation class ADSuaProductSubmitServlet
 */
@WebServlet({"/ADSuaProductSubmitServlet","/suaproductsubmit.html"})
public class ADSuaProductSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ADSuaProductSubmitServlet() {
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
		
		int idproduct = Integer.parseInt(request.getParameter("idproduct"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int idcate = Integer.parseInt(request.getParameter("idcate"));
		int sale = Integer.parseInt(request.getParameter("sale"));
		String description = request.getParameter("description");
		String sex = request.getParameter("sex");		
		String image = request.getParameter("image");
		if (image.isEmpty()) {
			image=request.getParameter("hinh");//không chọn hình thì lấy hình lúc đầu
		}
		
		Product pro=new Product();
		
		pro.setId(idproduct);
		pro.setName(name);;
		pro.setPrice(price);
		pro.setAmount(amount);
		pro.setImage(image);
		pro.setCategory(idcate);
		pro.setSale(sale);
		pro.setDescription(description);				
		pro.setSex(sex);
	
		ProductBL.SuaProduct(pro);
	
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
