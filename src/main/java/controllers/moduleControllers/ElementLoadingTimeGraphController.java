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

public class ElementLoadingTimeGraphController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ElementLoadingTimeGraphController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applicationNo = request.getParameter("appNM");
		//int appID = Integer.parseInt(applicationNo);
		String pageNO = request.getParameter("pgNo");
		//int pgID = Integer.parseInt(pageNO);
		String testCsNO = request.getParameter("tcNo");
		//int tsID = Integer.parseInt(testCsNO);
		String dtStart = request.getParameter("dts");
		String dtEnd = request.getParameter("dte");

		String flagAll = request.getParameter("flag");

		String jsonx = null;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		Map<String, String> mps = new HashMap<String, String>();
		String fuckMe = "";
		String appendMe = "";

		String SuckMe ="";
		String fuckingChrist = "";
		String askNavigation = "";

		// Navigation Graph Query
		if (flagAll.contentEquals("ALL")) {
			askNavigation = Queries.askAllResources(pageNO, testCsNO, applicationNo, dtStart, dtEnd);
		}else {
			askNavigation = Queries.askResources(pageNO, testCsNO, applicationNo, dtStart, dtEnd);
		}
		System.out.println("querySSSSSS : " + askNavigation);
		try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askNavigation);
			while(rs.next()) {
				//mps.put(rs.getString(1), rs.getString(2));
				fuckMe = "{ \"value\":\""+rs.getString(3)+"\"}";
				SuckMe = "{ \"label\":\""+rs.getString(2)+"\"}";
				appendMe += ","+fuckMe;
				fuckingChrist += ","+SuckMe;

			}

			String chart = "\"chart\": {"+
					"\"theme\": \"fusion\","+
					"\"yaxisname\": \"Loading Times (MiliSeconds)\","+
					"\"showvalues\": \"1\","+
					"\"placeValuesInside\": \"1\","+
					"\"rotateValues\": \"1\","+
					"\"valueFontColor\": \"#ffffff\","+
					"\"numberprefix\": \"\","+
					"\"numVisiblePlot\": \"15\","+
					"\"showLabels\": \"0\","+
					"\"labeldisplay\": \"WRAP\","+
					"\"linethickness\": \"3\","+
					"\"scrollheight\": \"10\","+
					"\"flatScrollBars\": \"1\","+
					"\"scrollShowButtons\": \"0\","+
					"\"scrollColor\": \"#cccccc\","+
					"\"showHoverEffect\": \"1\""+

	              "}";

			String modifiedDataset = "\"dataset\": [{\"data\":["+appendMe.substring(1)+"]}]";
			String modifiedCategories = "\"categories\": [{\"category\":["+fuckingChrist.substring(1)+"]}]";
			//String modifiedChart = "{type: 'scrollbar2d',renderAt: 'containerss', width: '600',height: '500',dataFormat: 'json',dataSource: { \"chart\": {plottooltext: \"$dataValue Downloads\", theme: \"fusion\"},"+modifiedCategories+","+modifiedDataset+"}}";
			String modifiedChart = "{"+chart+","+modifiedCategories+","+modifiedDataset+"}";
//			System.out.println("MODIFIED DATA : " + modifiedChart);
			//			String modifiedChart = "{"+modifiedDataset+"}";


//			System.out.println(modifiedChart);
			jsonx = new Gson().toJson(modifiedChart);
			//			response.setContentType("text/json");
			//			response.getWriter().write(modifiedChart);
			response.setContentType("text/json");
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
