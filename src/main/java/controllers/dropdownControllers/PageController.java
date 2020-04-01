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

public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PageController() {
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String applicationName = request.getParameter("ApplicationName");
        String jsonx = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        Map<Integer, String> mps = new HashMap<Integer, String>();
        
        String askapplication = Queries.askPageName+applicationName;
        
        try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askapplication);
			while(rs.next()) {
				mps.put(rs.getInt(2), rs.getString(4));
			}
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
