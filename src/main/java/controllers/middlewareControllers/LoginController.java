package controllers.middlewareControllers;

import java.io.IOException;
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
		String emails = request.getParameter("em");
		String passwords = request.getParameter("ps");
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

			if (flag) {
				HttpSession session = request.getSession();
				session.setAttribute("LoginID", Id);
				System.out.println("Success");
				// System.out.println("path : " + request.getContextPath());
//				RequestDispatcher requestDispatcher = request
//	                    .getRequestDispatcher("/Base.jsp");
//	            requestDispatcher.forward(request, response);
			} else {
				String greetings = "Incorrect CredentialsSS";
				maps.put("greetings", greetings);
				jsonx = new Gson().toJson(maps);

				HttpSession session=request.getSession(false);  
				String n=(String)session.getAttribute("LoginID");  
				System.out.println("User Id : " + n);

				response.setContentType("application/json");
				response.getWriter().write(jsonx);
			}

			


		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);

	}

}
