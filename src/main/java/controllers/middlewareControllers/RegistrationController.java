package controllers.middlewareControllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import connectionFactory.Connections;
import helperUtils.Randomizer;
import queryLibrary.Queries;

public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name = request.getParameter("nm");
    	String email = request.getParameter("em");
    	String pname = request.getParameter("pnm");
    	String password = request.getParameter("ps");
    	String securityQus = request.getParameter("secQ");
    	String securityAns = request.getParameter("secAns");
    	String apiToken = Randomizer.RandomCustomAPI();
    	// System.out.println("nm : " + name + " em : " + email + " pname " + pname + " password " + password + " sqcQ  " + securityQus + " sqcA " + securityAns);
    	
    	String query = Queries.registerUser();
    	try (Connection connection = Connections.getConnection()) {
        	PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, apiToken);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, pname);
			preparedStatement.setString(5, password);
			preparedStatement.setInt(6, Integer.parseInt(securityQus));
			preparedStatement.setString(7, securityAns);
			preparedStatement.executeUpdate();
			
    	}catch (SQLException e) {
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
