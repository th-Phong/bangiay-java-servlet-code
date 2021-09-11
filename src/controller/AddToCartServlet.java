package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import businessLogic.CategoryBL;
import businessLogic.ProductBL;
import javaBean.Category;
import javaBean.Item;
import javaBean.Order;
import javaBean.Product;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet({ "/AddToCartServlet", "/addtocart.html" })
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		List<Category> dscate = CategoryBL.DocTatCa();
		request.setAttribute("dscate", dscate);
		
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		int subtotal = 0;
		int soluongcart = 0;
		int idpro;
		if (request.getParameter("idproC") != null) {
			idpro = Integer.parseInt(request.getParameter("idproC"));
			Product product = ProductBL.GetProByID(idpro);
			if (product != null) {				

				HttpSession session = request.getSession();
				
				if(session.getAttribute("order") == null) {
					Order order = new Order();
					List<Item> listitem = new ArrayList<Item>();
					Item item = new Item();
					item.setSoluong(qty);
					item.setPro(product);
					item.setPrice(product.getSale());
					item.setSize(size);
					item.setColor(color);
					listitem.add(item);
					order.setItems(listitem);
					order.setTongtien(item.getPro().getSale());
					session.setAttribute("order", order);
					session.setAttribute("soluongincart", 1);
				} else {
					Order order = (Order) session.getAttribute("order");
					List<Item> listitem = order.getItems();
					boolean check = false;
					for (Item item : listitem) {
						if ((item.getPro().getId() == product.getId()) && (item.getColor().equals(color))
								&& (item.getSize().equals(size))) {
							item.setSoluong(item.getSoluong() + qty);		
							check = true;
						}
					}
					if (check == false) {
						Item item = new Item();
						item.setSoluong(qty);
						item.setPro(product);
						item.setPrice(product.getSale());
						item.setSize(size);
						item.setColor(color);
						listitem.add(item);
					}
					for (Item itemm : listitem) {
						subtotal = subtotal + (itemm.getPro().getSale() * itemm.getSoluong());
						soluongcart=soluongcart+itemm.getSoluong();
					}
					order.setTongtien(subtotal);
					session.setAttribute("order", order);
					session.setAttribute("soluongincart", soluongcart);
				}
			}
			// request.getRequestDispatcher("index.html?cart=n").forward(request, response);
			response.sendRedirect("index.html?cart=n");
		} else {
			// request.getRequestDispatcher("index.html").forward(request, response);
			response.sendRedirect("index.html");
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
