package controllers.updateControllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import connectionFactory.Connections;
import queryLibrary.Queries;

public class PopulateTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public PopulateTableController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String AppId = request.getParameter("ApplicationId");
    	System.out.println("application id : " + AppId);
    	int intAppId = Integer.parseInt(AppId);
        String jsonx = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        
        int tid=0; String tsName = ""; String regUname = ""; String date="";
        Map<Integer, String> mps = new HashMap<Integer, String>();
        List<String> jsonList = new ArrayList<String>();
        
        String askTestCase = Queries.populateTableId(intAppId);
        
        try {
			cn = Connections.getConnection();
			st = cn.createStatement();
			rs = st.executeQuery(askTestCase);
			while(rs.next()) {
				tid = rs.getInt(1);
				tsName = rs.getString(2);
				regUname = rs.getString(3);
				date = rs.getDate(4).toString();
				String htmlButton = "<button type='button'  id='opener' class='btn btn-warning'><i class='fa fa-pencil' aria-hidden='true'></i></button> &nbsp&nbsp <button type='button' id='sure' class='btn btn-danger'><i class='fa fa-trash' aria-hidden='true'></i></button>";
				
				String appender = "{\"id\":\""+String.valueOf(tid)+"\",\"tsnm\":\""+tsName+"\",\"userId\":\""+regUname+"\",\"date\":\""+date+"\",\"Button\":\""+htmlButton+"\"}";
//				String appender = "{\"id\":\""+String.valueOf(tid)+"\",\"tsnm\":\""+tsName+"\",\"userId\":\""+regUname+"\",\"date\":\""+date+"\"}";
				jsonList.add(appender);
			}
			System.out.println("Listed Val : " + jsonList);
			jsonx = new Gson().toJson(jsonList);
			
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
