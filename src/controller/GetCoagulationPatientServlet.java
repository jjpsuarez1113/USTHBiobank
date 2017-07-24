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
 * Servlet implementation class GetCoagulationPatientServlet
 */
@WebServlet("/getcoagulationpatientservlet.html")
public class GetCoagulationPatientServlet extends HttpServlet {
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
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int patientId = Integer.parseInt(request.getParameter("patientId"));
		try {	
			if (connection != null) {
				ResultSet coagulationPatientsList = SQLOperations.getCoagulationBaselinePatients(connection); 			
				ResultSet patientInfo = SQLOperations.getPatient(patientId, connection); 			
				
				patientInfo.first();
				int generalDataId = patientInfo.getInt("generalDataId");
				int clinicalDataId = patientInfo.getInt("clinicalDataId");
				int laboratoryId = patientInfo.getInt("laboratoryId");
				int treatmentId = patientInfo.getInt("treatmentId");
				
				ResultSet generalData = SQLOperations.getGeneralData(generalDataId, connection);
				generalData.first();
				int addressId = generalData.getInt("addressId");
				
				ResultSet address = SQLOperations.getAddress(addressId, connection);
				
				ResultSet clinicalData = SQLOperations.getClinicalData(clinicalDataId, connection);
				clinicalData.first();
				int physicalExamId = clinicalData.getInt("physicalExamId");
				
				ResultSet physicalExam = SQLOperations.getPhysicalExam(physicalExamId, connection);
				
				ResultSet laboratoryProfile = SQLOperations.getLaboratoryProfile(laboratoryId, connection);
				laboratoryProfile.first();
				int hematologyId = laboratoryProfile.getInt("hematologyId");
				int coagulationTestingId = laboratoryProfile.getInt("coagulationTestingId");
				int bloodChemistryId = laboratoryProfile.getInt("bloodChemistryId");
				int imagingStudiesId = laboratoryProfile.getInt("imagingStudiesId");
				
				ResultSet hematology = SQLOperations.getHematology(hematologyId, connection);
				ResultSet coagulationTesting = SQLOperations.getCoagulationTesting(coagulationTestingId, connection);
				ResultSet bloodChemistry = SQLOperations.getBloodChemistry(bloodChemistryId, connection);
				ResultSet imagingStudies = SQLOperations.getImagingStudies(imagingStudiesId, connection);
				
				ResultSet treatment = SQLOperations.getTreatment(treatmentId, connection);
				
				request.setAttribute("patientInfo", patientInfo);
				request.setAttribute("coagulationPatientsList", coagulationPatientsList);
				request.setAttribute("generalData", generalData);
				request.setAttribute("address", address);
				request.setAttribute("clinicalData", clinicalData);
				request.setAttribute("physicalExam", physicalExam);
				request.setAttribute("laboratoryProfile", laboratoryProfile);
				request.setAttribute("hematology", hematology);
				request.setAttribute("coagulationTesting", coagulationTesting);
				request.setAttribute("bloodChemistry", bloodChemistry);
				request.setAttribute("imagingStudies", imagingStudies);
				request.setAttribute("treatment", treatment);
				
				getServletContext().getRequestDispatcher("/coagulationdisease-baseline-patient-info.jsp")
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
