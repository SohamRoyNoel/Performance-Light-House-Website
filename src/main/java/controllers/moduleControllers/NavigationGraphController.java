package controllers.moduleControllers;

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

import com.google.gson.Gson;

import connectionFactory.Connections;
import queryLibrary.Queries;

public class NavigationGraphController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NavigationGraphController() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applicationNo = request.getParameter("appNM");
		String pageNO = request.getParameter("pgNo");
		String testCsNO = request.getParameter("tcNos");
		String dtStart = request.getParameter("dts");
		String dtEnd = request.getParameter("dte");
		
		String flagAll = request.getParameter("flag");
//		System.out.println("Flag all : " + flagAll + " "+ testCsNO);
		String jsonx = null;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		Map<String, String> mps = new HashMap<String, String>();

		String askNavigation = "";
		
		// Navigation Graph Query
		if (flagAll.contentEquals("ALL")) {
			askNavigation = Queries.askNavAllGraphQuery(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
		}else {
			askNavigation = Queries.askNavGraphQuery(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
		}
//		System.out.println("queryss : " + askNavigation);
		try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askNavigation);
			while(rs.next()) {
				mps.put("Nav_UnloadEvent", rs.getString(1));
				mps.put("Nav_RedirectEvent", rs.getString(2));
				mps.put("Nav_AppCache", rs.getString(3));
				mps.put("Nav_TTFB", rs.getString(4));
				mps.put("Nav_Processing", rs.getString(5));
				mps.put("Nav_DomInteractive", rs.getString(6));
				mps.put("Nav_DomComplete", rs.getString(7));
				mps.put("Nav_ContentLoad", rs.getString(8));
				mps.put("Nav_PageLoad", rs.getString(9));
				// rs.getString(1) + " "+rs.getString(2) + " "+rs.getString(3) + " "+rs.getString(4) + " "+rs.getString(5) + " "+rs.getString(6) + " "+rs.getString(7) + " "+rs.getString(8) + " "+rs.getString(9);

			}
			System.out.println(mps);
			jsonx = new Gson().toJson(mps);
			System.out.println("json : " + jsonx);

			response.setContentType("application/json");
			response.getWriter().write(jsonx);

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
