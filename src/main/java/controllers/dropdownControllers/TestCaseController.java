package controllers.dropdownControllers;

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

public class TestCaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestCaseController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pgID = request.getParameter("pgNo");
    	String apID = request.getParameter("apID");
    	System.out.println("App id : " + pgID);
    	String type = request.getParameter("pgType");
    	System.out.println("TYPE : " + type);
    	int intapID = 0;
    	int intPGID = 0;
        String jsonx = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        Map<Integer, String> mps = new HashMap<Integer, String>();
        String askTestCase = null;
        
        if (type.contentEquals("ALL")) {
        	
        	intapID = Integer.parseInt(apID);
        	askTestCase= Queries.astTestScenarioAll(pgID, intapID);
		}else {
			intapID = Integer.parseInt(apID);
	    	intPGID = Integer.parseInt(pgID);
	        askTestCase = Queries.askTestScenerioName(intPGID, intapID);
		}
        
        System.err.println("query : "+ askTestCase);
        try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askTestCase);
			while(rs.next()) {
				mps.put(rs.getInt(1), rs.getString(2));
			}
			System.out.println(mps);
			jsonx = new Gson().toJson(mps);
			
			response.setContentType("application/json");
            response.getWriter().write(jsonx);

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
