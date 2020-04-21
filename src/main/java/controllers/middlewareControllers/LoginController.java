package controllers.middlewareControllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import connectionFactory.Connections;
import queryLibrary.Queries;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String emails = request.getParameter("email");
		String passwords = request.getParameter("password");
		System.out.println("Email : "+ emails);
		System.out.println("Ps : "+ passwords);
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean flag = false;
		String jsonx = null;

		Map<String, String> maps = new HashMap<String, String>();
		String askTestCase = Queries.loginUser(emails, passwords);
		int getLoginId = 0;
		String Id = "";

		try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askTestCase);
			while(rs.next()) {
				if (rs.getString(5).equalsIgnoreCase(emails) && rs.getString(6).equals(passwords)) {
					flag = true;
					getLoginId = rs.getInt(1);
					Id = String.valueOf(getLoginId);
				}
			}

			System.out.println("Flag : "+ flag);
			
			if (flag) {
				HttpSession session = request.getSession();
				session.setAttribute("LoginID", Id);
				System.out.println("Success");
				System.out.println("path : " + request.getContextPath());
				String x = getServletContext().getRealPath("Base.jsp");
				System.out.println("Paths : " + x);
				RequestDispatcher requestDispatcher = request
	                    .getRequestDispatcher("/Application.jsp");
	            requestDispatcher.forward(request, response);
//				response.sendRedirect("/PerformanceWebFramework/Application.jsp");
//				response.sendRedirect(request.getSession().getServletContext().getRealPath("/Application.jsp"));
			} else {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				out.write("<html> <body> <div id='xyz' style='text-align: center;'>");
				out.write("<p id='errmsg'>");
				String greetings = "Incorrect CredentialsSS";
				System.out.println(greetings);
				
				out.print(greetings);
				
				RequestDispatcher requestDispatchers = request
	                    .getRequestDispatcher("/Login.jsp");
	            requestDispatchers.include(request, response);
	            out.close();
			}

			


		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		processRequest(request, response);
////		doPost(request, response);
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
//		doGet(request, response);
//		response.sendRedirect(request.getSession().getServletContext().getRealPath("/Application.jsp"));

	}

}
