package utility.database;

public interface SQLCommands {
	String GET_ADDRESS = "SELECT * FROM ADDRESSTABLE WHERE ADDRESSID = ?";
	
	//AAPHSMDS QUERIES
	//inserts
	String INSERT_ADDRESS_AAPHSMDS  = "INSERT INTO AddressTable VALUES (NULL, ?, ?, ?)";
	String INSERT_GENERAL_DATA_AAPHSMDS  = "INSERT INTO GeneralDataTable VALUES(NULL, ?, ?, ?, ?, ?, ?,(SELECT MAX(AddressID) FROM AddressTable),?)";
	String INSERT_CLINICAL_DATA_AAPHSMDS  = "INSERT INTO ClinicalDataTable (ClinicalDataID,DateOfVisit,Diagnosis,ClassificationID,ChiefComplaint,OtherSymptoms,Combordities,SmokingHistory,AlcoholIntakeHistory,ChemicalExposure,PreviousInfection,PreviousHematologicDisorder,PhysicalExamID) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,(SELECT MAX(PhysicalExamID) FROM PhysicalExamTable))";
	String INSERT_PHYSICAL_EXAM_AAPHSMDS  = "INSERT INTO PhysicalExamTable VALUES (NULL, ?,?,?,NULL,NULL,NULL,NULL,NULL,NULL,NULL,?);";
	String INSERT_HEMATOLOGY_AAPHSMDS  = "INSERT INTO HematologyTable VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,?);";
	String INSERT_OTHER_LABORATORIES_AAPHSMDS  = "INSERT INTO OtherLaboratoriesTable VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	String INSERT_BONE_MARROW_ASPIRATE_AAPHSMDS  = "INSERT INTO BoneMarrowAspirateTable VALUES (NULL,?,?)";
	String INSERT_FLOWCYTOMETRY_AAPHSMDS  = "INSERT INTO FlowCytometryTable VALUES (NULL,?)";
	String INSERT_CYTOGENETIC_AAPNH_AAPHSMDS  = "INSERT INTO CytogeneticAAPNHTable VALUES (NULL,?)";
	String INSERT_CYTOGENETIC_MDS_AAPHSMDS  = "INSERT INTO CytogeneticMDSTable VALUES (NULL,?)";
	String INSERT_LABORATORY_PROFILE_AAPHSMDS  = "INSERT INTO LaboratoryProfileTable(LaboratoryID,DateOfBloodCollection,HematologyID,OtherLaboratoriesID,BoneMarrowAspirateID,FlowCytometry,CytogenicAAPNHID, CytogenicMDSID) VALUES (NULL,?,(SELECT MAX(HematologyID) FROM HematologyTable),(SELECT MAX(OtherLaboratoriesID) FROM OtherLaboratoriesTable),(SELECT MAX(BoneMarrowAspirateID) FROM BoneMarrowAspirateTable),(SELECT MAX(FlowCytometryID) FROM FlowCytometryTable),(SELECT MAX(CytogenicAAPNHID) FROM CytogeneticAAPNHTable), (SELECT MAX(CytogenicMDSID) FROM CytogeneticMDSTable))";
	String INSERT_CHEMOTHERAPY_MEDICATIONS_AAPHSMDS  = "INSERT INTO ChemoMedicationsTable VALUES (NULL, ?);";
	String INSERT_TREATMENT_AAPHSMDS  = "INSERT INTO TreatmentTable(TreatmentID,Transplant,ModeOfTreatmentID,ChemoMedicationID,DateStarted) VALUES (NULL,?,?,(SELECT MAX(ChemoMedicationID) FROM ChemoMedicationsTable),?)";
	String INSERT_PATIENT_AAPHSMDS = "INSERT INTO PatientTable VALUES (NULL, 1, (SELECT MAX(GeneralDataID) FROM GeneralDataTable), (SELECT MAX(ClinicalDataID) FROM ClinicalDataTable),(SELECT MAX(LaboratoryID) FROM LaboratoryProfileTable),(SELECT MAX(TreatmentID) FROM TreatmentTable),NULL,1,1)";
	//selects
	String GET_LIST_PATIENTS_BASELINE_AAPHSMDS = "SELECT * FROM PATIENTTABLE WHERE DISEASEID = 1";
	String GET_PATIENT_BASELINE_AAPHSMDS = "SELECT * FROM PATIENTTABLE WHERE PATIENTID = ?";
	String GET_GENERAL_DATA_AAPHSMDS = "SELECT * FROM GENERALDATATABLE WHERE GENERALDATAID = ?";
	String GET_CLINICAL_DATA_BASELINE_AAPNHMDS = "SELECT * FROM CLINICALDATATABLE WHERE CLINICALDATAID = ?";
	String GET_PHYSICAL_EXAM_AAPNHMDS = "SELECT * FROM PHYSICALEXAMTABLE WHERE PHYSICALEXAMID = ?";
	
	
	//COAGUATION DISEASE QUERIES
	String INSERT_ADDRESS_COAGULATION = "INSERT INTO AddressTable VALUES (NULL,?,?,?)";
	String INSERT_GENERAL_DATA_COAGULATION = "INSERT INTO GeneralDataTable VALUES(NULL, ?, ?, ?, ?, ?,?,(SELECT MAX(AddressID) FROM AddressTable),1)";
	String INSERT_PHYSICAL_EXAM_COAGULATION = "INSERT INTO PhysicalExamTable VALUES (NULL, ?,?,NULL,NULL,NULL,NULL,?,?,NULL,NULL,?)";
	String INSERT_CLINICAL_DATA_COAGULATION = "INSERT INTO ClinicalDataTable (ClinicalDataID,DateOfVisit,Diagnosis,SeverityID,ChiefComplaint,OtherSymptoms,Combordities,SmokingHistory,AlcoholIntakeHistory,ChemicalExposure,PhysicalExamID) VALUES (NULL,?,?,?,?,?,?,?,?,?,(SELECT MAX(PhysicalExamID) FROM PhysicalExamTable))";
	String INSERT_HEMATOLOGY_COAGULATION = "INSERT INTO HematologyTable VALUES (NULL,?,?,?,?,?,?,?,?,null,null,null,?)";
	String INSERT_COAGULATION_TESTING_COAGULATION = "INSERT INTO CoagulationTestingTable VALUES (NULL, ?,?,?,?)";
	String INSERT_BLOOD_CHEMISTRY_COAGULATION = "INSERT INTO BloodChemistryTable(BloodChemistryID,Creatinine,UricAcid,Na,K,SGOT,SGPT,LDH) VALUES (NULL,?,?,?,?,?,?,?)";
	String INSERT_IMAGING_STUDIES_COAGULATION = "INSERT INTO ImagingStudiesTable VALUES (NULL, ?);";
	String INSERT_LABORATORY_PROFILE_COAGULATION = "INSERT INTO LaboratoryProfileTable(LaboratoryID,DateOfBloodCollection,HematologyID,CoagulationTestingID,BloodChemistryID,ImagingStudiesID) VALUES (NULL,?,(SELECT MAX(HematologyID) FROM HematologyTable),(SELECT MAX(CoagulationTestingID) FROM CoagulationTestingTable),(SELECT MAX(BloodChemistryID) FROM BloodChemistryTable),(SELECT MAX(ImagingStudiesID) FROM ImagingStudiesTable))";
	String INSERT_TREATMENT_COAGULATION = "INSERT INTO TreatmentTable(TreatmentID, ModeOfTreatmentID) VALUES (NULL,?)";
	String INSERT_PATIENT_COAGULATION = "INSERT INTO PatientTable VALUES (NULL, 2, (SELECT MAX(GeneralDataID) FROM GeneralDataTable), (SELECT MAX(ClinicalDataID) FROM ClinicalDataTable),(SELECT MAX(LaboratoryID) FROM LaboratoryProfileTable),(SELECT MAX(TreatmentID) FROM TreatmentTable),NULL,1,2)";

	
	//LEUKEMIA QUERIES
	String INSERT_ADDRESS_LEUKEMIA = "INSERT INTO AddressTable VALUES (NULL,?,?,?)";
	String INSERT_GENERAL_DATA_LEUKEMIA = "INSERT INTO GeneralDataTable VALUES(NULL,?,?,?,?,?,?,(SELECT MAX(AddressID) FROM AddressTable),?)";
	String INSERT_PHYSICAL_EXAM_LEUKEMIA = "INSERT INTO PhysicalExamTable VALUES (NULL,?,?,?,?,?,?,NULL,NULL,NULL,NULL,?)";
	String INSERT_CLINICAL_DATA_LEUKEMIA = "INSERT INTO ClinicalDataTable (ClinicalDataID,DateOfVisit,Diagnosis,RiskScoreID,ChiefComplaint,ConstitutionalSymptoms,OtherSymptoms,Combordities,SmokingHistory,AlcoholIntakeHistory,ChemicalExposure,PhysicalExamID) VALUES (NULL,?,?,?,?,?,?,?,?,?,?,(SELECT MAX(PhysicalExamID) FROM PhysicalExamTable))";
	String INSERT_HEMATOLOGY_LEUKEMIA = "INSERT INTO HematologyTable VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,?)";
	String INSERT_BLOOD_CHEMISTRY_LEUKEMIA = "INSERT INTO BloodChemistryTable(BloodChemistryID,Creatinine,UricAcid,Na,K,SGOT,SGPT,LDH) VALUES (NULL,?,?,?,?,?,?,?)";
	String INSERT_IMAGING_STUDIES_LEUKEMIA = "INSERT INTO ImagingStudiesTable VALUES (NULL, ?)";
	String INSERT_BONE_MARROW_ASPIRATE_LEUKEMIA = "INSERT INTO BoneMarrowAspirateTable VALUES (NULL,?,?)";
	String INSERT_FLOWCYTOMETRY_LEUKEMIA = "INSERT INTO FlowCytometryTable VALUES (NULL,?)";
	String INSERT_CYTOGENETIC_AAPNH_LEUKEMIA = "INSERT INTO CytogeneticAAPNHTable VALUES (NULL,?)";
	String INSERT_LABORATORY_PROFILE_LEUKEMIA = "INSERT INTO LaboratoryProfileTable(LaboratoryID,DateOfBloodCollection,HematologyID,BloodChemistryID,BoneMarrowAspirateID,FlowCytometry,CytogenicAAPNHID, ImagingStudiesID) VALUES (NULL,?,(SELECT MAX(HematologyID) FROM HematologyTable),(SELECT MAX(BloodChemistryID) FROM BloodChemistryTable),(SELECT MAX(BoneMarrowAspirateID) FROM BoneMarrowAspirateTable),(SELECT MAX(FlowCytometryID) FROM FlowCytometryTable),(SELECT MAX(CytogenicAAPNHID) FROM CytogeneticAAPNHTable), (SELECT MAX(ImagingStudiesID) FROM ImagingStudiesTable))";
	String INSERT_REGIMEN_LEUKEMIA = "INSERT INTO RegimenTable VALUES (NULL, ?)";
	String INSERT_CHEMOTHERAPY_MEDICATIONS_LEUKEMIA = "INSERT INTO ChemoMedicationsTable VALUES (NULL, ?)";
	String INSERT_TREATMENT_LEUKEMIA = "INSERT INTO TreatmentTable(TreatmentID, RegimenID,ChemoMedicationID,CycleNumber,DateStarted) VALUES (NULL, (SELECT MAX(RegimenID) FROM RegimenTable), (SELECT MAX(ChemoMedicationID) FROM ChemoMedicationsTable),?,?)";
	String INSERT_PATIENT_LEUKEMIA = "INSERT INTO PatientTable VALUES (NULL, 3, (SELECT MAX(GeneralDataID) FROM GeneralDataTable), (SELECT MAX(ClinicalDataID) FROM ClinicalDataTable),(SELECT MAX(LaboratoryID) FROM LaboratoryProfileTable),(SELECT MAX(TreatmentID) FROM TreatmentTable),NULL,1,2)";
}
