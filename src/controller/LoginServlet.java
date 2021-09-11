package controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import businessLogic.AccountBL;
import businessLogic.CategoryBL;
import javaBean.Account;
import javaBean.Category;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({"/LoginServlet","/login.html"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.setContentType("text/html;charset=UTF-8");
//		request.setCharacterEncoding("UTF-8");
//		///
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		Account acc =AccountBL.LayAccount(username, password);
//		if (acc==null) {
//			request.setAttribute("mess", "Wrong username or password !!!");
//			request.getRequestDispatcher("index.jsp?log=1").forward(request, response);
//		}
//		else {
//			HttpSession session=request.getSession();
//			session.setAttribute("acc",acc);
//			session.setAttribute("username",username);
//			request.getRequestDispatcher("index.jsp").forward(request, response);
//		}

		//request.getRequestDispatcher("index.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setContentType("text/html;charset=UTF-8");
		//request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		List<Category> dscate = CategoryBL.DocTatCa();
		request.setAttribute("dscate", dscate);
		
		String user = request.getParameter("username");
		String pass= request.getParameter("password");
		
		//password
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(pass.getBytes());
			BigInteger bigInteger = new BigInteger(1,digest.digest());
			 pass = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		
		String mess= "Wrong username or password !!!";
		Account acc =AccountBL.LayAccount(user, pass);
		if (acc.getUsername()==null&&acc.getPassword()==null) {
			request.setAttribute("mess",mess );
			request.getRequestDispatcher("index.jsp?log=no").forward(request, response);
		}
		else {
			HttpSession session=request.getSession();
			session.setAttribute("acc",acc);
			session.setAttribute("username",user);
			//request.getRequestDispatcher("index.html").forward(request, response);
			response.sendRedirect("index.html");
		}
		//request.getRequestDispatcher("index.jsp?log=no").forward(request, response);
	}

}
