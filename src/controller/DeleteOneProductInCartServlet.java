package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import businessLogic.ProductBL;
import javaBean.Item;
import javaBean.Order;
import javaBean.Product;

/**
 * Servlet implementation class DeleteOneProductInCartServlet
 */
@WebServlet({"/DeleteOneProductInCartServlet","/deleteone.html"})
public class DeleteOneProductInCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOneProductInCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		Order order=(Order) session.getAttribute("order");
		int soluongincart=(int) session.getAttribute("soluongincart");
		int money=order.getTongtien();
		List<Item> listitem=order.getItems();
		//Item item=new Item();
		int idprodel = Integer.parseInt(request.getParameter("idprodel"));
		Product product=ProductBL.GetProByID(idprodel);
		
		for(Item item:listitem) {
			if (item.getPro().getId()==product.getId()) {
				listitem.remove(item);	
				money=money-item.getPro().getSale();
				soluongincart=soluongincart-item.getSoluong();
				order.setTongtien(money);
				break;
			}
		}

		session.setAttribute("order", order);
		session.setAttribute("soluongincart", soluongincart);
		//request.getRequestDispatcher("index.jsp?cart=ok").forward(request, response);
		response.sendRedirect("index.html?cart=ok");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
