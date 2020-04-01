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
    	String pgName = request.getParameter("pgNo");
        String jsonx = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        Map<Integer, String> mps = new HashMap<Integer, String>();
        
        String askTestCase = Queries.askTestScenerioName+pgName;
        
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
