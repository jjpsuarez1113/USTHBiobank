package utility.factory;

import model.*;

public class BeanFactory {

	public static GeneralDataBean getGeneralDataBean(String lastName, String middleName, String firstName, int gender, String dateOfBirth, String dateOfEntry, int addressId, int tissueSpecimenId){
		GeneralDataBean gb = new GeneralDataBean();
		gb.setLastName(lastName);
		gb.setMiddleName(middleName);
		gb.setFirstName(firstName);
		gb.setGender(gender);
		gb.setDateOfBirth(dateOfBirth);
		gb.setDateOfEntry(dateOfEntry);
		gb.setAddressId(addressId);
		gb.setTissueSpecimenId(tissueSpecimenId);
		return gb;
	}
	
	public static AddressBean getAddressBean(String streetAddress, String city, String zipCode){
		AddressBean ab = new AddressBean();
		ab.setStreetAddress(streetAddress);
		ab.setCity(city);
		ab.setZipCode(zipCode);
		return ab;
	}
	
	public static PatientBean getPatientBean(int diseaseId, int generalDataId, int clinicalDataId, int laboratoryId, int treatmentId, int otherTreatmentId, int active, int diseaseStatusId){
		PatientBean pb = new PatientBean();
		pb.setDiseaseId(diseaseId);
		pb.setGeneralDataId(generalDataId); 
		pb.setClinicalDataId(clinicalDataId);
		pb.setLaboratoryId(laboratoryId); 
		pb.setTreatmentId(treatmentId); 
		pb.setOtherTreatmentId(otherTreatmentId);
		pb.setActive(active);
		pb.setDiseaseStatusId(diseaseStatusId);
		return pb;
	}
	
	public static ClinicalDataBean getClinicalDataBean(String dateOfVisit, String diagnosis, String prognosticRiskScoringId, int riskScoreId, int classificationId, int ISSStagingId, int severityId, String stageOfDisease, String chiefComplaint, String constitutionalSymptoms, String otherSymptoms, String comorbidities, String smokingHistory, String alchoholIntakeHistory, String chemicalExposure, String previousInfection, String previousHematologicDisorder, int physicalExamId, String otherFindings){
		ClinicalDataBean cb = new ClinicalDataBean();
		cb.setDateOfVisit(dateOfVisit);
		cb.setDiagnosis(diagnosis);
		cb.setPrognosticRiskScoringId(prognosticRiskScoringId);
		cb.setRiskScoreId(riskScoreId);
		cb.setClassificationId(classificationId);
		cb.setISSStagingId(ISSStagingId);
		cb.setSeverityId(severityId);
		cb.setStageOfDisease(stageOfDisease);
		cb.setChiefComplaint(chiefComplaint);
		cb.setConstitutionalSymptoms(constitutionalSymptoms);
		cb.setOtherSymptoms(otherSymptoms);
		cb.setComorbidities(comorbidities);
		cb.setSmokingHistory(smokingHistory);
		cb.setAlchoholIntakeHistory(alchoholIntakeHistory);
		cb.setChemicalExposure(chemicalExposure);
		cb.setPreviousInfection(previousInfection);
		cb.setPreviousHematologicDisorder(previousHematologicDisorder);
		cb.setPhysicalExamId(physicalExamId);
		cb.setOtherFindings(otherFindings);
		return cb;
	}
	
	public static PhysicalExamBean getPhysicalExamBean(double height, double weight, double ECOG, double splenomegaly, double hepatomegaly, double lymphadenopathies, boolean hemathroses, boolean contracturesAndMuscleAtrophy, String thrombosisHistory, String skin, String otherFindings){
		PhysicalExamBean pb = new PhysicalExamBean();
		pb.setHeight(height);
		pb.setWeight(weight);
		pb.setECOG(ECOG);
		pb.setSplenomegaly(splenomegaly);
		pb.setHepatomegaly(hepatomegaly);
		pb.setLymphadenopathies(lymphadenopathies);
		pb.setHemathroses(hemathroses);
		pb.setContracturesAndMuscleAtrophy(contracturesAndMuscleAtrophy);
		pb.setThrombosisHistory(thrombosisHistory);
		pb.setSkin(skin);
		pb.setOtherFindings(otherFindings);
		return pb;
	}
	
	public static LaboratoryProfileBean getLaboratoryProfileBean(String dateOfBloodCollection, int hematologyId, int coagulationTestingId, int bloodChemistryId, int otherLaboratoriesId, int boneMarrowAspirateId, int flowCytometry, int cytogenicAAPNHId, int cytogenicMDSId, int imagingStudiesId, int upperGIEndoscopyId, int molecularAnalysisId, int hematopathologyId, int immunoHistochemistryId, int serumFreeId, int serumProteinId, int serumImmunofixationId, int urineProteinId){
		LaboratoryProfileBean lb = new LaboratoryProfileBean();
		lb.setDateOfBloodCollection(dateOfBloodCollection);
		lb.setHematologyId(hematologyId);
		lb.setCoagulationTestingId(coagulationTestingId); 
		lb.setBloodChemistryId(bloodChemistryId); 
		lb.setOtherLaboratoriesId(otherLaboratoriesId); 
		lb.setBoneMarrowAspirateId(boneMarrowAspirateId);
		lb.setFlowCytometry(flowCytometry);
		lb.setCytogenicAAPNHId(cytogenicAAPNHId); 
		lb.setCytogenicMDSId(cytogenicMDSId);
		lb.setImagingStudiesId(imagingStudiesId); 
		lb.setUpperGIEndoscopyId(upperGIEndoscopyId); 
		lb.setMolecularAnalysisId(molecularAnalysisId);
		lb.setHematopathologyId(hematopathologyId); 
		lb.setImmunoHistochemistryId(immunoHistochemistryId); 
		lb.setSerumFreeId(serumFreeId); 
		lb.setSerumProteinId(serumProteinId); 
		lb.setSerumImmunofixationId(serumImmunofixationId); 
		lb.setUrineProteinId(urineProteinId); 
		return lb;
	}
	
	public static HematologyBean getHematologyBean(double hemoglobin, double hematocrit, double whiteBloodCells, double neutrophils, double lymphocytes, double monocytes, double eosinophils, double basophils, double myelocytes, double metamyelocytes, double blasts, double plateletCount){
		HematologyBean hb = new HematologyBean();
		hb.setHemoglobin(hemoglobin);
		hb.setHematocrit(hematocrit);
		hb.setWhiteBloodCells(whiteBloodCells);
		hb.setNeutrophils(neutrophils);
		hb.setLymphocytes(lymphocytes);
		hb.setMonocytes(monocytes);
		hb.setEosinophils(eosinophils);
		hb.setBasophils(basophils);
		hb.setMyelocytes(metamyelocytes);
		hb.setMetamyelocytes(metamyelocytes);
		hb.setBlasts(blasts);
		hb.setPlateletCount(plateletCount);
		return hb;
	}
	
	public static CoagulationTestingBean getCoagulationTestingBean(double factorVIIILevel, double factorIXLevel, double inhibitorAssay, double bethesdaUnits){
		CoagulationTestingBean cb = new CoagulationTestingBean();
		cb.setFactorVIIILevel(factorVIIILevel);
		cb.setFactorIXLevel(factorIXLevel);
		cb.setInhibitorAssay(inhibitorAssay);
		cb.setBethesdaUnits(bethesdaUnits);
		return cb;
	}
	
	public static BoneMarrowAspirateBean getBoneMarrowAspirateBean(String datePerformed, String result){
		BoneMarrowAspirateBean bb = new BoneMarrowAspirateBean();
		bb.setDatePerformed(datePerformed);
		bb.setResult(result);
		return bb;
	}
	
	public static FlowCytometryBean getFlowCytometryBean(String result){
		FlowCytometryBean fb = new FlowCytometryBean();
		fb.setResult(result);
		return fb;
	}
	
	public static CytogeneticAAPNHBean getCytogeneticAAPNHBean(String result){
		CytogeneticAAPNHBean cb = new CytogeneticAAPNHBean();
		cb.setResult(result);
		return cb;
	}
	
	public static CytogeneticMDSBean getCytogeneticMDSBean(String result){
		CytogeneticMDSBean cb = new CytogeneticMDSBean();
		cb.setResult(result);
		return cb;
	}
	
	public static ImagingStudiesBean getImagingStudiesBean(byte[] result){
		ImagingStudiesBean ib = new ImagingStudiesBean();
		ib.setResult(result);
		return ib;
	}
	
	public static UpperGIEndoscopyBean getUpperGIEndoscopyBean(String datePerformed, String description, boolean HOylori){
		UpperGIEndoscopyBean ub = new UpperGIEndoscopyBean();
		ub.setDatePerformed(datePerformed);
		ub.setDescription(description);
		ub.setHOylori(HOylori);
		return ub;
	}
	
	public static MolecularAnalysisBean getMolecularAnalysisBean(String results){
		MolecularAnalysisBean mb = new MolecularAnalysisBean();
		mb.setResults(results);
		return mb;
	}
	
	public static HematopathologyBean getHematopathologyBean(String datePerformed, String results){
		HematopathologyBean hb = new HematopathologyBean();
		hb.setDatePerformed(datePerformed);
		hb.setResults(results);
		return hb;
	}
	
	public static ImmunohistochemistryBean getImmunohistochemistryBean(String datePerformed, String results){
		ImmunohistochemistryBean ib = new ImmunohistochemistryBean();
		ib.setDatePerformed(datePerformed);
		ib.setResults(results);
		return ib;
	}
	
	public static SerumFreeBean getSerumFreeBean(String results){
		SerumFreeBean sb = new SerumFreeBean();
		sb.setResults(results);
		return sb;
	}
	
	public static SerumProteinBean getSerumProteinBean(String results){
		SerumProteinBean sb = new SerumProteinBean();
		sb.setResults(results);
		return sb;
	}
	
	public static SerumImmunofixationBean getSerumImmunofixationBean(String results){
		SerumImmunofixationBean sb = new SerumImmunofixationBean();
		sb.setResults(results);
		return sb;
	}
	
	public static UrineProteinBean getUrineProteinBean(String results){
		UrineProteinBean ub = new UrineProteinBean();
		ub.setResults(results);
		return ub;
	}
	
	public static TreatmentBean getTreatmentBean(boolean transplant, int modeOfTreatmentId, int chemoMedicationId, String dateStarted, String otherRegimen, int regimenId, int maintenanceTherapyId, int cycleNumber, String complications, String regimenText){
		TreatmentBean tb = new TreatmentBean();
		tb.setTransplant(transplant);
		tb.setModeOfTreatmentId(modeOfTreatmentId);
		tb.setChemoMedicationId(chemoMedicationId);
		tb.setDateStarted(dateStarted);
		tb.setOtherRegimen(otherRegimen);
		tb.setRegimenId(regimenId);
		tb.setMaintenanceTherapyId(maintenanceTherapyId);
		tb.setCycleNumber(cycleNumber);
		tb.setComplications(complications);
		tb.setRegimenText(regimenText);
		return tb;
	}
	
	public OtherTreatmentBean getOtherTreatmentBean(String bisphosphonates, String radiotherapy, boolean dialysis, String otherMedications, String complications){
		OtherTreatmentBean ob = new OtherTreatmentBean();
		ob.setBisphosphonates(bisphosphonates);
		ob.setRadiotherapy(radiotherapy);
		ob.setDialysis(dialysis);
		ob.setOtherMedications(otherMedications);
		ob.setComplications(complications);
		return ob;
	}
	
	public FollowUpBean getFollowUpBean(int patientId, String dateOfVisit, int medicalEventsId, int clinicalDataId, int laboratoryId, int qualityofResponseId, int diseaseStatusId, String specialNotes){
		FollowUpBean fb = new FollowUpBean();
		fb.setPatientId(patientId);
		fb.setDateOfVisit(dateOfVisit);
		fb.setMedicalEventsId(medicalEventsId);
		fb.setClinicalDataId(clinicalDataId);
		fb.setLaboratoryId(laboratoryId);
		fb.setQualityofResponseId(qualityofResponseId);
		fb.setDiseaseStatusId(diseaseStatusId);
		fb.setSpecialNotes(specialNotes);
		return fb;
	}
	
	public MedicalEventsBean getMedicalEventsBean(String newMedicationForHematologicMalignancy, String newConcomitantMedicationForOtherDisease, String undergoAnyProcedure, String complicationForChemotherapy, String selfAdministerFactorConcentrates){
		MedicalEventsBean mb = new MedicalEventsBean();
		mb.setNewMedicationForHematologicMalignancy(newMedicationForHematologicMalignancy);
		mb.setNewConcomitantMedicationForOtherDisease(newConcomitantMedicationForOtherDisease);
		mb.setUndergoAnyProcedure(undergoAnyProcedure);
		mb.setComplicationForChemotherapy(complicationForChemotherapy);
		mb.setSelfAdministerFactorConcentrates(selfAdministerFactorConcentrates);
		return mb;
	}
	
	public AccountBean getAccountBean(String username, String password, String lastName, String middleName, String firstName, int roleId){
		AccountBean ab = new AccountBean();
		ab.setUsername(username);
		ab.setPassword(password);
		ab.setLastName(lastName);
		ab.setMiddleName(middleName);
		ab.setFirstName(firstName);
		ab.setRoleId(roleId);
		return ab;
	}
	
	
}
