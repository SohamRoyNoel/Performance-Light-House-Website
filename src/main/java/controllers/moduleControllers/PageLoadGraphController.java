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

public class PageLoadGraphController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PageLoadGraphController() {
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applicationNo = request.getParameter("appNM");
		String pageNO = request.getParameter("pgNo");
		String testCsNO = request.getParameter("tcNo");
		String dtStart = request.getParameter("dts");
		String dtEnd = request.getParameter("dte");
		
		String flagAll = request.getParameter("flag");
		String askAVGloadtime="";
		String askMAXloadtime="";
		String askMINloadtime="";

		String jsonx = null;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		Map<String, String> mps = new HashMap<String, String>();

		// Navigation Graph Query
		
		if (flagAll.contentEquals("ALL")) {
			askAVGloadtime = Queries.askAverageAllPageLoad(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
			askMAXloadtime = Queries.askMaximumAllPageLoad(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
			askMINloadtime = Queries.askMinimumAllPageLoad(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
		}else {
			askAVGloadtime = Queries.askAveragePageLoad(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
			askMAXloadtime = Queries.askMaximumPageLoad(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
			askMINloadtime = Queries.askMinimumPageLoad(applicationNo, pageNO, testCsNO, dtStart, dtEnd);
		}
//		System.out.println("Avg Query : " + askAVGloadtime);
//		System.out.println("Max Query : " + askMAXloadtime);
//		System.out.println("Min Query : " + askMINloadtime);
		
		
		// System.out.println("query : " + askNavigation);
		try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askAVGloadtime);
			while(rs.next()) { mps.put("Nav_AVG_UnloadEvent", rs.getString(1));}
			rs1 = st.executeQuery(askMAXloadtime);
			while(rs1.next()) { mps.put("Nav_MAX_UnloadEvent", rs1.getString(1));}
			rs2 = st.executeQuery(askMINloadtime);
			while(rs2.next()) { mps.put("Nav_MIN_UnloadEvent", rs2.getString(1));}
			jsonx = new Gson().toJson(mps);
//			System.out.println("Load Json : " + jsonx);

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
