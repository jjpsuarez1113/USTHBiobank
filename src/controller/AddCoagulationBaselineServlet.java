package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import utility.database.SQLOperations;
import utility.factory.BeanFactory;

/**
 * Servlet implementation class AddCoagulationBaselineServlet
 */
@WebServlet("/AddCoagulationBaselineServlet")
public class AddCoagulationBaselineServlet extends HttpServlet {
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
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int disease = 2;
		
		//GENERAL DATA
		int patientIDNumber = Integer.parseInt(request.getParameter("patientIDNumber"));
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String middleInitial = request.getParameter("middleInitial");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String dateOfBirth = request.getParameter("dateOfBirth");
		String address = request.getParameter("address");
		String dateOfEntry = request.getParameter("dateOfEntry");
		
		System.out.println(patientIDNumber);
		System.out.println(lastName);
		System.out.println(firstName);
		System.out.println(middleInitial);
		System.out.println(gender);
		System.out.println(dateOfBirth);
		System.out.println(address);
		System.out.println(dateOfEntry);
		
		//CLINICAL DATA
		String dateOfVisit = request.getParameter("dateOfVisit");
		String diagnosis = request.getParameter("diagnosis");
		String diagnosisOthers = request.getParameter("diagnosisOthers");
		int severity = Integer.parseInt(request.getParameter("severity"));
		String chiefComplaint = request.getParameter("chiefComplaint");
		String otherSymptoms = request.getParameter("otherSymptoms");
		String familyHistoryOfBleedingDiathesis = request.getParameter("familyHistoryOfBleedingDiathesis");
		String relationshipToPatient = request.getParameter("relationshipToPatient");
		String otherDiseasesInTheFamily = request.getParameter("otherDiseasesInTheFamily");
		String comorbidities = request.getParameter("comorbidities");
		int concomitantMedications = Integer.parseInt(request.getParameter("concomitantMedications"));
		String genericName = request.getParameter("genericName");
		double dose = Double.parseDouble(request.getParameter("dose"));
		String frequency = request.getParameter("frequecy");
		String smokingHistory = request.getParameter("smokingHistory");
		String smokingHistorySpecify = request.getParameter("smokingHistorySpecify");
		String alchoholIntakeHistory = request.getParameter("alchoholIntakeHistory");
		String alchoholIntakeHistorySpecify = request.getParameter("alchoholIntakeHistorySpecify");
		String chemicalExposureHistory = request.getParameter("chemicalExposureHistory");
		String chemicalExposureSpecify = request.getParameter("chemicalExposureSpecify");
		
		//Physical Exam
		double height = Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		boolean presenceOfHemarthroses; 
		if(Integer.parseInt(request.getParameter("presenceOfHemarthroses"))!=0){
			presenceOfHemarthroses = true;
		} else {
			presenceOfHemarthroses = false;
		}
		boolean presenceOfContracturesAndMuscleAtrophy;
		if(Integer.parseInt(request.getParameter("presenceOfContracturesAndMuscleAtrophy"))!=0){
			presenceOfContracturesAndMuscleAtrophy = true;
		} else {
			presenceOfContracturesAndMuscleAtrophy = false;
		}
		String otherFindings = request.getParameter("otherFindings");
		
		//LABORATORY
		String dateOfBloodCollection = request.getParameter("dateOfBloodCollection");
		
		//Hematology
		double hemoglobin = Double.parseDouble(request.getParameter("hemoglobin"));
		double hematocrit = Double.parseDouble(request.getParameter("hematocrit"));
		double whiteBloodCells = Double.parseDouble(request.getParameter("whiteBloodCells"));
		double neutrophils = Double.parseDouble(request.getParameter("neutrophils"));
		double lymphocytes = Double.parseDouble(request.getParameter("lymphocytes"));
		double monocytes = Double.parseDouble(request.getParameter("monocytes"));
		double eosinophils = Double.parseDouble(request.getParameter("eosinophils"));
		double basophils = Double.parseDouble(request.getParameter("basophils"));
		double plateletCount = Double.parseDouble(request.getParameter("plateletCount"));
		
		//Coagulation
		double factorVIIILevel = Double.parseDouble(request.getParameter("factorVIIILevel"));
		double factorIXLevel = Double.parseDouble(request.getParameter("factorIXLevel"));
		double inhibitorAssay = Double.parseDouble(request.getParameter("inhibitorAssay"));
		double bethesdaUnits = Double.parseDouble(request.getParameter("bethesdaUnits"));
		double creatinine = Double.parseDouble(request.getParameter("creatine"));
		double uricAcid = Double.parseDouble(request.getParameter("uricAcid"));
		double na = Double.parseDouble(request.getParameter("na"));
		double k = Double.parseDouble(request.getParameter("k"));
		double sgot = Double.parseDouble(request.getParameter("sgot"));
		double sgpt = Double.parseDouble(request.getParameter("sgpt"));
		double ldh = Double.parseDouble(request.getParameter("ldh"));
		
		//Imaging Studies
		String imagingStudiesResult = request.getParameter("imagingStudiesResult");
		
		//Treatment
		int treatment = Integer.parseInt(request.getParameter("treatment"));
		String treatmentSpecify = request.getParameter("treatmentSpecify");
		
		
		
		//INSERT VALUES
		String addressArray[] = address.split(",");
		AddressBean ab = BeanFactory.getAddressBean(addressArray[0], addressArray[1], addressArray[2]);
		if (connection != null) {
			if (SQLOperations.addAddress(ab, connection, disease)){
				System.out.println("successful insert address");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		GeneralDataBean gdb = BeanFactory.getGeneralDataBean(lastName, middleInitial, firstName, gender, dateOfBirth, dateOfEntry, 1);
		if (connection != null) {
			if (SQLOperations.addGeneralData(gdb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		PhysicalExamBean peb = BeanFactory.getPhysicalExamBean(height, weight, 0.0, 0.0, 0.0, 0.0, presenceOfHemarthroses, presenceOfContracturesAndMuscleAtrophy, "", "", otherFindings);
		if (connection != null) {
			if (SQLOperations.addPhysicalExam(peb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		ClinicalDataBean cdb = BeanFactory.getClinicalDataBean(dateOfVisit, diagnosis, 0, 0, 0, 0, severity, "", chiefComplaint, "", otherSymptoms, comorbidities, smokingHistorySpecify, alchoholIntakeHistorySpecify, chemicalExposureSpecify, "", "", otherFindings);
		if (connection != null) {
			if (SQLOperations.addClinicalData(cdb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}

		HematologyBean hb = BeanFactory.getHematologyBean(hemoglobin, hematocrit, whiteBloodCells, neutrophils, lymphocytes, monocytes, eosinophils, basophils, 0, 0, 0, plateletCount);
		if (connection != null) {
			if (SQLOperations.addHematology(hb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		
		CoagulationTestingBean ctb = BeanFactory.getCoagulationTestingBean(factorVIIILevel, factorIXLevel, inhibitorAssay, bethesdaUnits);
		if (connection != null) {
			if (SQLOperations.addCoagulationTesting(ctb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		
		BloodChemistryBean bcb = BeanFactory.getBloodChemistryBean(0, creatinine, uricAcid, sgot, sgpt, ldh, 0, na, k, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		if (connection != null) {
			if (SQLOperations.addBloodChemistry(bcb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		ImagingStudiesBean isb = BeanFactory.getImagingStudiesBean(imagingStudiesResult.getBytes());
		if (connection != null) {
			if (SQLOperations.addImagingStudies(isb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		LaboratoryProfileBean lpb = BeanFactory.getLaboratoryProfileBean(dateOfBloodCollection, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		if (connection != null) {
			if (SQLOperations.addLaboratoryProfile(lpb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		TreatmentBean tb = BeanFactory.getTreatmentBean(true, treatment, 0, "", "", 0, 0, 0, "", "");
		if (connection != null) {
			if (SQLOperations.addTreatment(tb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		
		//ADD PATIENT
		if (connection != null) {
			if (SQLOperations.addPatient(connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
	}

}
