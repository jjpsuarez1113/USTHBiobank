package utility.database;

import java.sql.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.*;


public class SQLOperations implements SQLCommands{
	private static Connection connection;
	
	private static Connection getDBConnection() {
		try {
		    InitialContext context = new InitialContext();
		    DataSource dataSource = (DataSource) 
		     context.lookup("java:comp/env/jdbc/BCI-DS");
		    
		    if (dataSource != null) {
		    	connection = dataSource.getConnection();
		    }
		} catch (NamingException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return connection;
	 }
	
	public static Connection getConnection() {
		return (connection!=null)?connection:getDBConnection();
	}
	
	public static boolean addAddress(AddressBean ab, Connection connection, int disease){
		switch(disease){
			case(1): {
				try{
					PreparedStatement pstmt = connection.prepareStatement(INSERT_ADDRESS_AAPHSMDS);
					pstmt.setString(1, ab.getStreetAddress());
					pstmt.setString(2, ab.getCity());
					pstmt.setString(3, ab.getZipCode());
					pstmt.executeUpdate();
				} catch(SQLException sqle){
					System.out.println("SQLException -- addAddress: " + sqle.getMessage());
					return false;
				}
				break;
			} case (2): {
				try{
					PreparedStatement pstmt = connection.prepareStatement(INSERT_ADDRESS_COAGULATION);
					pstmt.setString(1, ab.getStreetAddress());
					pstmt.setString(2, ab.getCity());
					pstmt.setString(3, ab.getZipCode());
					pstmt.executeUpdate();
				} catch(SQLException sqle){
					System.out.println("SQLException -- addAddress: " + sqle.getMessage());
					return false;
				}
				break;
			} case (3): {
				try{
					PreparedStatement pstmt = connection.prepareStatement(INSERT_ADDRESS_LEUKEMIA);
					pstmt.setString(1, ab.getStreetAddress());
					pstmt.setString(2, ab.getCity());
					pstmt.setString(3, ab.getZipCode());
					pstmt.executeUpdate();
				} catch(SQLException sqle){
					System.out.println("SQLException -- addAddress: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addGeneralData(GeneralDataBean gdb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try{
					PreparedStatement pstmt = connection.prepareStatement(INSERT_GENERAL_DATA_AAPHSMDS);
					pstmt.setString(1, gdb.getLastName());
					pstmt.setString(2, gdb.getMiddleName());
					pstmt.setString(3, gdb.getFirstName());
					pstmt.setInt(4, gdb.getGender());
					pstmt.setString(5, gdb.getDateOfBirth());
					pstmt.setString(6, gdb.getDateOfEntry());
					pstmt.setInt(7, gdb.getTissueSpecimenId());
					pstmt.executeUpdate();
				} catch(SQLException sqle){
					System.out.println("SQLException -- addGeneralData: " + sqle.getMessage());
					return false;
				}
				break;
			} case(2): {
				try{
					PreparedStatement pstmt = connection.prepareStatement(INSERT_GENERAL_DATA_COAGULATION);
					pstmt.setString(1, gdb.getLastName());
					pstmt.setString(2, gdb.getMiddleName());
					pstmt.setString(3, gdb.getFirstName());
					pstmt.setInt(4, gdb.getGender());
					pstmt.setString(5, gdb.getDateOfBirth());
					pstmt.setString(6, gdb.getDateOfEntry());
					pstmt.executeUpdate();
				} catch(SQLException sqle){
					System.out.println("SQLException -- addGeneralData: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try{
					PreparedStatement pstmt = connection.prepareStatement(INSERT_GENERAL_DATA_LEUKEMIA);
					pstmt.setString(1, gdb.getLastName());
					pstmt.setString(2, gdb.getMiddleName());
					pstmt.setString(3, gdb.getFirstName());
					pstmt.setInt(4, gdb.getGender());
					pstmt.setString(5, gdb.getDateOfBirth());
					pstmt.setString(6, gdb.getDateOfEntry());
					pstmt.setInt(7, gdb.getTissueSpecimenId());
					pstmt.executeUpdate();
				} catch(SQLException sqle){
					System.out.println("SQLException -- addGeneralData: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addClinicalData(ClinicalDataBean cdb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CLINICAL_DATA_AAPHSMDS);
					pstmt.setString(1, cdb.getDateOfVisit());
					pstmt.setString(2, cdb.getDiagnosis());
					pstmt.setInt(3, cdb.getClassificationId());
					pstmt.setString(4, cdb.getChiefComplaint());
					pstmt.setString(5, cdb.getOtherSymptoms());
					pstmt.setString(6, cdb.getComorbidities());
					pstmt.setString(7, cdb.getSmokingHistory());
					pstmt.setString(8, cdb.getAlchoholIntakeHistory());
					pstmt.setString(9, cdb.getChemicalExposure());
					pstmt.setString(10, cdb.getPreviousInfection());
					pstmt.setString(11, cdb.getPreviousHematologicDisorder());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addClinicalData: " + sqle.getMessage());
					return false;
				}
				break;
			} case(2): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CLINICAL_DATA_COAGULATION);
					pstmt.setString(1, cdb.getDateOfVisit());
					pstmt.setString(2, cdb.getDiagnosis());
					pstmt.setInt(3, cdb.getSeverityId());
					pstmt.setString(4, cdb.getChiefComplaint());
					pstmt.setString(5, cdb.getOtherSymptoms());
					pstmt.setString(6, cdb.getComorbidities());
					pstmt.setString(7, cdb.getSmokingHistory());
					pstmt.setString(8, cdb.getAlchoholIntakeHistory());
					pstmt.setString(9, cdb.getChemicalExposure());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addClinicalData: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CLINICAL_DATA_LEUKEMIA);
					pstmt.setString(1, cdb.getDateOfVisit());
					pstmt.setString(2, cdb.getDiagnosis());
					pstmt.setInt(3, cdb.getRiskScoreId());
					pstmt.setString(4, cdb.getChiefComplaint());
					pstmt.setString(5, cdb.getConstitutionalSymptoms());
					pstmt.setString(6, cdb.getOtherSymptoms());
					pstmt.setString(7, cdb.getComorbidities());
					pstmt.setString(8, cdb.getSmokingHistory());
					pstmt.setString(9, cdb.getAlchoholIntakeHistory());
					pstmt.setString(10, cdb.getChemicalExposure());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addClinicalData: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addPhysicalExam(PhysicalExamBean peb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_PHYSICAL_EXAM_AAPHSMDS);
					pstmt.setDouble(1, peb.getHeight());
					pstmt.setDouble(2, peb.getWeight());
					pstmt.setDouble(3, peb.getECOG());
					pstmt.setString(4, peb.getOtherFindings());
					pstmt.executeUpdate();
				} catch (SQLException sqle){
					System.out.println("SQLException -- addClinicalData: " + sqle.getMessage());
					return false;
				}
				break;
			} case(2): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_PHYSICAL_EXAM_COAGULATION);
					pstmt.setDouble(1, peb.getHeight());
					pstmt.setDouble(2, peb.getWeight());
					pstmt.setBoolean(3, peb.isHemathroses());
					pstmt.setBoolean(4, peb.isContracturesAndMuscleAtrophy());
					pstmt.setString(5, peb.getOtherFindings());
					pstmt.executeUpdate();
				} catch (SQLException sqle){
					System.out.println("SQLException -- addClinicalData: " + sqle.getMessage());
					return false;
				}
				break;
			} case (3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_PHYSICAL_EXAM_LEUKEMIA);
					pstmt.setDouble(1, peb.getHeight());
					pstmt.setDouble(2, peb.getWeight());
					pstmt.setDouble(3, peb.getECOG());
					pstmt.setDouble(4, peb.getSplenomegaly());
					pstmt.setDouble(5, peb.getHepatomegaly());
					pstmt.setDouble(6, peb.getLymphadenopathies());
					pstmt.setString(7, peb.getOtherFindings());
					pstmt.executeUpdate();
				} catch (SQLException sqle){
					System.out.println("SQLException -- addClinicalData: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addHematology(HematologyBean hb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_HEMATOLOGY_AAPHSMDS);
					pstmt.setDouble(1, hb.getHemoglobin());
					pstmt.setDouble(2, hb.getHematocrit());
					pstmt.setDouble(3, hb.getWhiteBloodCells());
					pstmt.setDouble(4, hb.getNeutrophils());
					pstmt.setDouble(5, hb.getLymphocytes());
					pstmt.setDouble(6, hb.getMonocytes());
					pstmt.setDouble(7, hb.getEosinophils());
					pstmt.setDouble(8, hb.getBasophils());
					pstmt.setDouble(9, hb.getMyelocytes());
					pstmt.setDouble(10, hb.getMetamyelocytes());
					pstmt.setDouble(11, hb.getBlasts());
					pstmt.setDouble(12, hb.getPlateletCount());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addHematology: " + sqle.getMessage());
					return false;
				}
				break;
			} case(2): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_HEMATOLOGY_COAGULATION);
					pstmt.setDouble(1, hb.getHemoglobin());
					pstmt.setDouble(2, hb.getHematocrit());
					pstmt.setDouble(3, hb.getWhiteBloodCells());
					pstmt.setDouble(4, hb.getNeutrophils());
					pstmt.setDouble(5, hb.getLymphocytes());
					pstmt.setDouble(6, hb.getMonocytes());
					pstmt.setDouble(7, hb.getEosinophils());
					pstmt.setDouble(8, hb.getBasophils());
					pstmt.setDouble(9, hb.getPlateletCount());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addHematology: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_HEMATOLOGY_LEUKEMIA);
					pstmt.setDouble(1, hb.getHemoglobin());
					pstmt.setDouble(2, hb.getHematocrit());
					pstmt.setDouble(3, hb.getWhiteBloodCells());
					pstmt.setDouble(4, hb.getNeutrophils());
					pstmt.setDouble(5, hb.getLymphocytes());
					pstmt.setDouble(6, hb.getMonocytes());
					pstmt.setDouble(7, hb.getEosinophils());
					pstmt.setDouble(8, hb.getBasophils());
					pstmt.setDouble(9, hb.getMyelocytes());
					pstmt.setDouble(10, hb.getMetamyelocytes());
					pstmt.setDouble(11, hb.getBlasts());
					pstmt.setDouble(12, hb.getPlateletCount());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addHematology: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addOtherLaboratories(OtherLaboratoriesBean olb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_OTHER_LABORATORIES_AAPHSMDS);
					pstmt.setDouble(1, olb.getCreatinineOther());
					pstmt.setDouble(2, olb.getUricAcid());
					pstmt.setDouble(3, olb.getReticulocyteCount());
					pstmt.setDouble(4, olb.getSerumIron());
					pstmt.setDouble(5, olb.getIronBindingCapacity());
					pstmt.setDouble(6, olb.getSerumFerritin());
					pstmt.setString(7, olb.getDirectAntiglobulin());
					pstmt.setString(8, olb.getIndirectAntiglobulin());
					pstmt.setDouble(9, olb.getSGOT());
					pstmt.setDouble(10, olb.getSGPT());
					pstmt.setDouble(11, olb.getLDH());
					pstmt.setString(12, olb.getScreenTestHepatitis());
					pstmt.setString(13, olb.getScreenTestEBVCytomegalovirusHIV());
					pstmt.setDouble(14, olb.getErythropeitinLevel());
					pstmt.setDouble(15, olb.getSerumFolicAcid());
					pstmt.setDouble(16, olb.getSerumB12());
					pstmt.setDouble(17, olb.getTSH());
					pstmt.executeUpdate();
				} catch (SQLException sqle) { 
					System.out.println("SQLException -- addOtherLaboratories: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addBoneMarrowAspirate(BoneMarrowAspirateBean bmab, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_BONE_MARROW_ASPIRATE_AAPHSMDS);
					pstmt.setString(1, bmab.getDatePerformed());
					pstmt.setString(2, bmab.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addBoneMarrowAspirate: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_BONE_MARROW_ASPIRATE_LEUKEMIA);
					pstmt.setString(1, bmab.getDatePerformed());
					pstmt.setString(2, bmab.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addBoneMarrowAspirate: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addFlowCytometry(FlowCytometryBean fcb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_FLOWCYTOMETRY_AAPHSMDS);
					pstmt.setString(1, fcb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) { 
					System.out.println("SQLException -- addFlowCytometry: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_FLOWCYTOMETRY_LEUKEMIA);
					pstmt.setString(1, fcb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) { 
					System.out.println("SQLException -- addFlowCytometry: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		
		return true;
	}
	
	public static boolean addCytogeneticAAPNH(CytogeneticAAPNHBean caapnhb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CYTOGENETIC_AAPNH_AAPHSMDS);
					pstmt.setString(1, caapnhb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addCytogeneticAAPNH: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CYTOGENETIC_AAPNH_LEUKEMIA);
					pstmt.setString(1, caapnhb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addCytogeneticAAPNH: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addCytogeneticMDS(CytogeneticMDSBean cmdsb, Connection connection, int disease){
		switch(disease){
			case(1):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CYTOGENETIC_MDS_AAPHSMDS);
					pstmt.setString(1, cmdsb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addCytogeneticMDS: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addLaboratoryProfile(LaboratoryProfileBean lpb, Connection connection, int disease){
		switch(disease){
			case(1):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_LABORATORY_PROFILE_AAPHSMDS);
					pstmt.setString(1, lpb.getDateOfBloodCollection());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addLaboratoryProfile: " + sqle.getMessage());
					return false;
				}
				break;
			} case (2): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_LABORATORY_PROFILE_COAGULATION);
					pstmt.setString(1, lpb.getDateOfBloodCollection());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addLaboratoryProfile: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_LABORATORY_PROFILE_LEUKEMIA);
					pstmt.setString(1, lpb.getDateOfBloodCollection());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addLaboratoryProfile: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addChemotherapyMedications(ChemotherapyMedicationsBean cmb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CHEMOTHERAPY_MEDICATIONS_AAPHSMDS);
					pstmt.setString(1, cmb.getMedications());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addChemotherapyMedications: " + sqle.getMessage());
					return false;
				}
				break;
			} case (3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_CHEMOTHERAPY_MEDICATIONS_LEUKEMIA);
					pstmt.setString(1, cmb.getMedications());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addChemotherapyMedications: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addTreatment(TreatmentBean tb, Connection connection, int disease){
		switch(disease){
			case(1): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_TREATMENT_AAPHSMDS);
					pstmt.setBoolean(1, tb.isTransplant());
					pstmt.setInt(2, tb.getModeOfTreatmentId());
					pstmt.setString(3, tb.getDateStarted());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addTreatment: " + sqle.getMessage());
					return false;
				}
				break;
			} case(2): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_TREATMENT_COAGULATION);
					pstmt.setInt(1, tb.getModeOfTreatmentId());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addTreatment: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_TREATMENT_LEUKEMIA);
					pstmt.setInt(1, tb.getCycleNumber());
					pstmt.setString(2, tb.getDateStarted());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addTreatment: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addCoagulationTesting(CoagulationTestingBean ctb, Connection connection, int disease){
		switch(disease){
			case(2):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_COAGULATION_TESTING_COAGULATION);
					pstmt.setDouble(1, ctb.getFactorVIIILevel());
					pstmt.setDouble(2, ctb.getFactorIXLevel());
					pstmt.setDouble(3, ctb.getInhibitorAssay());
					pstmt.setDouble(4, ctb.getBethesdaUnits());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addBloodChemistry(BloodChemistryBean bcb, Connection connection, int disease){
		switch(disease){
			case(2):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_BLOOD_CHEMISTRY_COAGULATION);
					pstmt.setDouble(1, bcb.getCreatine());
					pstmt.setDouble(2, bcb.getUricAcid());
					pstmt.setDouble(3, bcb.getNa());
					pstmt.setDouble(4, bcb.getK());
					pstmt.setDouble(5, bcb.getSGOT());
					pstmt.setDouble(6, bcb.getSGPT());
					pstmt.setDouble(7, bcb.getLDH());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_BLOOD_CHEMISTRY_LEUKEMIA);
					pstmt.setDouble(1, bcb.getCreatine());
					pstmt.setDouble(2, bcb.getUricAcid());
					pstmt.setDouble(3, bcb.getNa());
					pstmt.setDouble(4, bcb.getK());
					pstmt.setDouble(5, bcb.getSGOT());
					pstmt.setDouble(6, bcb.getSGPT());
					pstmt.setDouble(7, bcb.getLDH());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addImagingStudies(ImagingStudiesBean isb, Connection connection, int disease){
		switch(disease){
			case(2):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_IMAGING_STUDIES_COAGULATION);
					pstmt.setBytes(1, isb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_IMAGING_STUDIES_LEUKEMIA);
					pstmt.setBytes(1, isb.getResult());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addRegimen(RegimenBean rb, Connection connection, int disease){
		switch(disease){
			case(3):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_REGIMEN_LEUKEMIA);
					pstmt.setString(1, rb.getRegimenName());
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addRegimen: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static boolean addPatient(Connection connection, int disease){
		switch(disease){
			case(1):{
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_PATIENT_AAPHSMDS);
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			} case (2): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_PATIENT_COAGULATION);
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			} case(3): {
				try {
					PreparedStatement pstmt = connection.prepareStatement(INSERT_PATIENT_LEUKEMIA);
					pstmt.executeUpdate();
				} catch (SQLException sqle) {
					System.out.println("SQLException -- addPatient: " + sqle.getMessage());
					return false;
				}
				break;
			}
		}
		return true;
	}
	
	public static ResultSet getAAPHSMDSBaselinePatients(Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_LIST_PATIENTS_BASELINE_AAPHSMDS);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getAAPHSMDSBaselinePatients: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getCoagulationBaselinePatients(Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_LIST_PATIENTS_BASELINE_COAGULATION);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getCoagulationBaselinePatients: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getLeukemiaBaselinePatients(Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_LIST_PATIENTS_BASELINE_LEUKEMIA);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getLeukemiaBaselinePatients: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getPatient(int patientId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_PATIENT_BASELINE);
			pstmt.setInt(1, patientId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getPatient: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getGeneralData(int generalDataId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_GENERAL_DATA);
			pstmt.setInt(1, generalDataId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getGeneralData: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	
	public static ResultSet getAddress(int addressId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_ADDRESS);
			pstmt.setInt(1, addressId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getAddress: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getClinicalData(int clinicalDataId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_CLINICAL_DATA_BASELINE);
			pstmt.setInt(1, clinicalDataId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getClinicalData: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getPhysicalExam(int physicalExamId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_PHYSICAL_EXAM);
			pstmt.setInt(1, physicalExamId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getPhysicalExamAAPNHMDS: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getLaboratoryProfile(int laboratoryId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_LABORATORY_PROFILE);
			pstmt.setInt(1, laboratoryId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getLaboratoryProfile: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getHematology(int hematologyId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_HEMATOLOGY);
			pstmt.setInt(1, hematologyId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getHematology: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getOtherLaboratoriesAAPNHMDS(int otherLaboratoriesId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_OTHER_LABORATORIES_AAPNHMDS);
			pstmt.setInt(1, otherLaboratoriesId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getOtherLaboratoriesAAPNHMDS: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getBoneMarrowAspirate(int boneMarrowAspirateId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_BONE_MARROW_ASPIRATE);
			pstmt.setInt(1, boneMarrowAspirateId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getBoneMarrowAspirate: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getFlowCytometry(int flowCytometryId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_FLOWCYTOMETRY);
			pstmt.setInt(1, flowCytometryId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getFlowCytometry: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getCytogeneticAAPNH(int cytogeneticAAPNHId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_CYTOGENETIC_AAPNH_AAPNHMDS);
			pstmt.setInt(1, cytogeneticAAPNHId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getCytogeneticAAPNH: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getCytogeneticMDSAAPNH(int cytogeneticMDSId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_CYTOGENETIC_MDS_AAPNHMDS);
			pstmt.setInt(1, cytogeneticMDSId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getCytogeneticMDSAAPNH: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getTreatment(int treatmentId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_TREATMENT);
			pstmt.setInt(1, treatmentId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getTreatment: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getCoagulationTesting(int coagulationTestingId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_COAGULATION_TESTING);
			pstmt.setInt(1, coagulationTestingId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getCoagulationTesting: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getBloodChemistry(int bloodChemistryId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_BLOOD_CHEMISTRY);
			pstmt.setInt(1, bloodChemistryId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getBloodChemistry: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	
	public static ResultSet getImagingStudies(int imagingStudiesId, Connection connection){
		ResultSet rs = null;
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_IMAGING_STUDIES);
			pstmt.setInt(1, imagingStudiesId);
			rs = pstmt.executeQuery();
		} catch(SQLException sqle) {
			System.out.println("SQLException - getImagingStudies: " + sqle.getMessage());
			return rs;
		}
		return rs;
	}
	

}
