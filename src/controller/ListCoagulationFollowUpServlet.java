package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.database.SQLOperations;

/**
 * Servlet implementation class ListCoagulationFollowUpServlet
 */
@WebServlet("/coagulationdisease-followup.html")
public class ListCoagulationFollowUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection connection;
	
	public void init() throws ServletException {
		connection = SQLOperations.getConnection();
		
		if (connection != null) {
			getServletContext().setAttribute("dbConnection", connection);
			System.out.println("connection is READY.");
		} else {
			System.err.println("connection is NULL.");
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		try {	
			if (connection != null) {
				ResultSet coagulationPatientsList = SQLOperations.getCoagulationBaselinePatients(connection); 			
				ResultSet patientInfo = SQLOperations.getPatient(patientId, connection); 			
				
				request.setAttribute("coagulationPatientsList", coagulationPatientsList);
				request.setAttribute("patientInfo", patientInfo);
				
				getServletContext().getRequestDispatcher("/coagulationdisease-followup.jsp")
					.forward(request, response);
			} else {
				System.out.println("Invalid Connection resource");
			}
		} catch (NullPointerException npe) {
			System.err.println("Invalid Connection resource - " + npe.getMessage());
		} catch (Exception e) {
			System.err.println("Exception - " + e.getMessage());
		}
	}

}
