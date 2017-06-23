package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.*;
import utility.database.SQLOperations;
import utility.factory.BeanFactory;

/**
 * Servlet implementation class AddLeukemiaBaselineServlet
 */
@WebServlet("/AddLeukemiaBaselineServlet")
public class AddLeukemiaBaselineServlet extends HttpServlet {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int disease = 3;
		
		//GENERAL DATA
		int patientIDNumber = Integer.parseInt(request.getParameter("patientIDNumber"));
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String middleInitial = request.getParameter("middleInitial");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String dateOfBirth = request.getParameter("dateOfBirth");
		String address = request.getParameter("address");
		String dateOfEntry = request.getParameter("dateOfEntry");
		int tissueSpecimentCollected = Integer.parseInt(request.getParameter("tissueSpecimenCollected"));
		int specimenType = Integer.parseInt(request.getParameter("specimenType"));
		
		System.out.println(patientIDNumber);
		System.out.println(lastName);
		System.out.println(firstName);
		System.out.println(middleInitial);
		System.out.println(gender);
		System.out.println(dateOfBirth);
		System.out.println(address);
		System.out.println(dateOfEntry);
		System.out.println(specimenType);
		
		//CLINICAL DATA
		String dateOfInitialDiagnosis = request.getParameter("dateOfInitialDiagnosis");
		//String dateOfVisit = request.getParameter("dateOfVisit");
		String diagnosis = request.getParameter("diagnosis");
		//String diagnosisOthers = request.getParameter("diagnosisOthers");
		int severity = Integer.parseInt(request.getParameter("severity"));
		String chiefComplaint = request.getParameter("chiefComplaint");
		String constitutionalSymptoms = request.getParameter("constitutionalSymptoms");
		String otherSymptoms = request.getParameter("otherSymptoms");
		String familyHistoryOfCancer = request.getParameter("familyHistoryOfCancer");
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
		String alchoholIntakeSpecify = request.getParameter("alchoholIntakeSpecify");
		String chemicalExposureHistory = request.getParameter("chemicalExposureHistory");
		String chemicalExposureSpecify = request.getParameter("chemicalExposureSpecify");
//		String previousInfection = request.getParameter("previousInfection");
//		String previousInfectionSpecify = request.getParameter("previousInfection");
//		String previousHematologicDisorder = request.getParameter("previousHematologicDisorder");
//		String previousHematologicDisorderSpecify = request.getParameter("previousHematologicDisorderSpecify");
		
		//Physical Exam
		double height = Double.parseDouble(request.getParameter("height"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		double ecog = Double.parseDouble(request.getParameter("ecog"));
		int presenceOfSplenomegaly = Integer.parseInt(request.getParameter("presenceOfSplenomegaly"));
		int presenceOfHepatomegaly = Integer.parseInt(request.getParameter("presenceOfHepatomegaly"));
		int presenceOfLymphadenopathies= Integer.parseInt(request.getParameter("presenceOfLymphadenopathies"));
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
		double myelocytes = Double.parseDouble(request.getParameter("myelocytes"));
		double metamyelocytes = Double.parseDouble(request.getParameter("metamyelocytes"));
		double blasts = Double.parseDouble(request.getParameter("blasts"));
		double plateletCount = Double.parseDouble(request.getParameter("plateletCount"));
		
		//Coagulation
//		double factorVIIILevel = Double.parseDouble(request.getParameter("factorVIIILevel"));
//		double factorIXLevel = Double.parseDouble(request.getParameter("factorIXLevel"));
//		double inhibitorAssay = Double.parseDouble(request.getParameter("inhibitorAssay"));
//		double bethesdaUnits = Double.parseDouble(request.getParameter("bethesdaUnits"));
		double creatinine = Double.parseDouble(request.getParameter("creatinine"));
		double uricAcide = Double.parseDouble(request.getParameter("uricAcid"));
		double na = Double.parseDouble(request.getParameter("na"));
		double k = Double.parseDouble(request.getParameter("k"));
//		double reticulocyteCount = Double.parseDouble(request.getParameter("reticulocyteCount"));
//		double serumIron = Double.parseDouble(request.getParameter("serumIron"));
//		double ironBindingCapacity = Double.parseDouble(request.getParameter("ironBindingCapacity"));
//		double serumFerritin = Double.parseDouble(request.getParameter("serumFerritin"));
//		double directAntiglobulin = Double.parseDouble(request.getParameter("directAntiglobulin"));
//		double indirectAntiglobulin = Double.parseDouble(request.getParameter("indirectAntiglobulin"));
		double sgot = Double.parseDouble(request.getParameter("sgot"));
		double sgpt = Double.parseDouble(request.getParameter("sgpt"));
		double ldh = Double.parseDouble(request.getParameter("ldh"));
//		double screeningTestsForHepatitisVirusesABC = Double.parseDouble(request.getParameter("screeningTestsForHepatitisVirusesABC"));
//		double screeningTestsForEBVCMVHIV = Double.parseDouble(request.getParameter("screeningTestsForEBVCMVHIV"));
//		double erythropoeitinLevel = Double.parseDouble(request.getParameter("erythropoeitinLevel"));
//		double serumFolicAcid = Double.parseDouble(request.getParameter("serumFolicAcid"));
//		double serumB12 = Double.parseDouble(request.getParameter("serumB12"));
//		double tsh = Double.parseDouble(request.getParameter("tsh"));
//		
		//Imaging Studies
		int imagingStudies = Integer.parseInt(request.getParameter("imagingStudies"));
		String imagingStudiesResult = request.getParameter("imagingStudiesResult");
		
		int boneMarrowAspirate = Integer.parseInt(request.getParameter("boneMarrowAspirate"));
		String boneMarrowAspirateDatePerformed = request.getParameter("boneMarrowAspirateDatePerformed");
		String boneMarrowAspirateDescription = request.getParameter("boneMarrowAspirateDescription");
		//Part boneMarrowAspirateAttachScannedDocument = request.getPart("boneMarrowAspirateAttachScannedDocument");
		int flowCytometry = Integer.parseInt(request.getParameter("flowCytometry"));
		String flowCytometryResult = request.getParameter("flowCytometryResult");
		//Part flowCytometryAttachScannedDocument = request.getPart("flowCytometryAttachScannedDocument");
		int cytogeneticAndMolecularAnalysis = Integer.parseInt(request.getParameter("cytogeneticAndMolecularAnalysis"));
		String cytogeneticAndMolecularAnalysisResult = request.getParameter("cytogeneticAndMolecularAnalysisResult");
		//Part cytogeneticAndMolecularAnalysisAttachScannedDocument = request.getPart("cytogeneticAndMolecularAnalysisAttachScannedDocument");
		
//		int cytogeneticAndMolecularAnalysisAAPNH = Integer.parseInt(request.getParameter("cytogeneticAndMolecularAnalysisAAPNH"));
//		String cytogeneticAndMolecularAnalysisAAPNHResult = request.getParameter("cytogeneticAndMolecularAnalysisAAPNHResult");
//		Part cytogeneticAndMolecularAnalysisAAPNHAttachScannedDocument = request.getPart("cytogeneticAndMolecularAnalysisAAPNHAttachScannedDocument");
//		int cytogeneticAndMolecularAnalysisMDS = Integer.parseInt(request.getParameter("cytogeneticAndMolecularAnalysisMDS"));
//		String cytogeneticAndMolecularAnalysisMDSResult = request.getParameter("cytogeneticAndMolecularAnalysisMDSResult");
//		Part cytogeneticAndMolecularAnalysisMDSAttachScannedDocument = request.getPart("cytogeneticAndMolecularAnalysisMDSAttachScannedDocument");
//		
		
		//Treatment
//		int transplantCandidate = Integer.parseInt(request.getParameter("transplantCandidate"));
//		String modeOfTreatment = request.getParameter("modeOfTreatment");
//		String medications = request.getParameter("medications");
		String dateStarted = request.getParameter("dateStarted");
		String treatment = request.getParameter("treatment");
		String regimenProtocol = request.getParameter("regimenProtocol");
		String chemotherapyMedications = request.getParameter("chemotherapyMedications");
		int cycleNumber = Integer.parseInt(request.getParameter("cycleNumber"));
		String diseaseStatus = request.getParameter("diseaseStatus");
//		String treatmentSpecify = request.getParameter("treatmentSpecify");
		
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
		
		GeneralDataBean gdb = BeanFactory.getGeneralDataBean(lastName, middleInitial, firstName, gender, dateOfBirth, dateOfEntry, specimenType);
		if (connection != null) {
			if (SQLOperations.addGeneralData(gdb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		
		PhysicalExamBean peb = BeanFactory.getPhysicalExamBean(height, weight, ecog, presenceOfSplenomegaly, presenceOfHepatomegaly, presenceOfLymphadenopathies, false, false, "", "", otherFindings);
		if (connection != null) {
			if (SQLOperations.addPhysicalExam(peb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		
		ClinicalDataBean cdb = BeanFactory.getClinicalDataBean(dateOfInitialDiagnosis, diagnosis, 0, severity, 0, 0, 0, "", chiefComplaint, constitutionalSymptoms, otherSymptoms, comorbidities, smokingHistorySpecify, alchoholIntakeHistory, chemicalExposureSpecify, "", "", otherFindings);
		if (connection != null) {
			if (SQLOperations.addClinicalData(cdb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}

		
		HematologyBean hb = BeanFactory.getHematologyBean(hemoglobin, hematocrit, whiteBloodCells, neutrophils, lymphocytes, monocytes, eosinophils, basophils, myelocytes, metamyelocytes, blasts, plateletCount);
		if (connection != null) {
			if (SQLOperations.addHematology(hb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		BloodChemistryBean bcb = BeanFactory.getBloodChemistryBean(0.0, creatinine, uricAcide, sgot, sgpt, ldh, 0.0, na, k, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
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
		
		BoneMarrowAspirateBean bmab = BeanFactory.getBoneMarrowAspirateBean(boneMarrowAspirateDatePerformed, boneMarrowAspirateDescription);
		if (connection != null) {
			if (SQLOperations.addBoneMarrowAspirate(bmab, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		FlowCytometryBean fcb = BeanFactory.getFlowCytometryBean(flowCytometryResult);
		if (connection != null) {
			if (SQLOperations.addFlowCytometry(fcb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		CytogeneticAAPNHBean caapnhb = BeanFactory.getCytogeneticAAPNHBean(cytogeneticAndMolecularAnalysisResult);
		if (connection != null) {
			if (SQLOperations.addCytogeneticAAPNH(caapnhb, connection, disease)){
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
		
		
		//ADD TREATMENT
		RegimenBean rb = BeanFactory.getRegimenBean(regimenProtocol);
		if (connection != null) {
			if (SQLOperations.addRegimen(rb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		ChemotherapyMedicationsBean cmb = BeanFactory.getChemotherapyMedicationsBean(chemotherapyMedications);
		if (connection != null) {
			if (SQLOperations.addChemotherapyMedications(cmb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		TreatmentBean tb = BeanFactory.getTreatmentBean(true, 0, 0, dateStarted, "", 0, 0, cycleNumber, "", "");
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
		/*
		OtherLaboratoriesBean olb = BeanFactory.getOtherLaboratoriesBean(creatinine, uricAcid, reticulocyteCount, serumIron, ironBindingCapacity, serumFerritin, directAntiglobulin, indirectAntiglobulin, sgot, sgpt, ldh, screeningTestsForHepatitisVirusesABC, screeningTestsForEBVCMVHIV, erythropoeitinLevel, serumFolicAcid, serumB12, tsh);
		if (connection != null) {
			if (SQLOperations.addOtherLaboratories(olb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		BoneMarrowAspirateBean bmab = BeanFactory.getBoneMarrowAspirateBean(boneMarrowAspirateDatePerformed, boneMarrowAspirateDescription);
		if (connection != null) {
			if (SQLOperations.addBoneMarrowAspirate(bmab, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		FlowCytometryBean fcb = BeanFactory.getFlowCytometryBean(flowCytometryResult);
		if (connection != null) {
			if (SQLOperations.addFlowCytometry(fcb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		CytogeneticAAPNHBean caapnhb = BeanFactory.getCytogeneticAAPNHBean(cytogeneticAndMolecularAnalysisAAPNHResult);
		if (connection != null) {
			if (SQLOperations.addCytogeneticAAPNH(caapnhb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		CytogeneticMDSBean cmdsb = BeanFactory.getCytogeneticMDSBean(cytogeneticAndMolecularAnalysisMDSResult);
		if (connection != null) {
			if (SQLOperations.addCytogeneticMDS(cmdsb, connection, disease)){
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
		
		ChemotherapyMedicationsBean cmb = BeanFactory.getChemotherapyMedicationsBean(medications);
		if (connection != null) {
			if (SQLOperations.addChemotherapyMedications(cmb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		TreatmentBean tb = BeanFactory.getTreatmentBean(transplantCandidate, modeOfTreatment, 0, dateStarted, "", 0, 0, 0, "", "");
		if (connection != null) {
			if (SQLOperations.addTreatment(tb, connection, disease)){
				System.out.println("successful insert");
			} else {
				System.out.println("failed insert");
			}
		} else {
			System.out.println("invalid connection");
		}
		
		
		
		*/
	}

}
