package controllers.AdminControllers.requestControllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connectionFactory.Connections;
import queryLibrary.Queries;

public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RequestController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applicationNo = request.getParameter("appNM");
		String pageNO = request.getParameter("pgNo");
		String testCsNO = request.getParameter("tcNo");
		String dtStart = request.getParameter("dts");
		String dtEnd = request.getParameter("dte");

		String jsonx = null;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		Map<String, String> mps = new HashMap<String, String>();

		// Navigation Graph Query
		String askNavigation = Queries.askNavGraphQuery(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
		System.out.println("query : " + askNavigation);
		try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		// System.out.println("application Name : " + applicationname + " Page No : "+ pageNO + " testCaseNo : " + testCsNO + " DateS : " + dtStart + " DateE : " + dtEnd);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
