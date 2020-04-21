package controllers.updateControllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connectionFactory.Connections;
import queryLibrary.Queries;

public class PopulateTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public PopulateTableController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applicationNo = request.getParameter("ApNO");
		int intPrs = Integer.parseInt(applicationNo);
		
		String jsonx = null;
		Connection cn = null;
		Statement st = null;
		ResultSet rs = null;
		Boolean flag = true;

		/*try {
			cn = Connections.getConnection();
			st = cn.createStatement();			
			// Insert The Application request  to "Application_request_mapper"
			if (flag) {
				String insertReq = Queries.getTestCaseNamesByApplicationName+intPrs;
				HttpSession session=request.getSession(false);  
				String userID=(String)session.getAttribute("LoginID");
				String appname = applicationName;
				int adminId = 0;
				String reqStatus = "Pending";
				PreparedStatement preparedStatement = cn.prepareStatement(insertReq);
				preparedStatement.setString(1, appname);
				preparedStatement.setInt(2, Integer.parseInt(userID));
				preparedStatement.setNull(3, adminId);;
				preparedStatement.setString(4, reqStatus);
				preparedStatement.executeUpdate();
				
			}



		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
