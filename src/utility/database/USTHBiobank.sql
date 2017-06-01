-- DROP DATABASE usthbiobank;
CREATE DATABASE USTHBiobank;
USE USTHBiobank;

CREATE TABLE DiseaseTable (
	DiseaseID int NOT NULL AUTO_INCREMENT,
	DiseaseName varchar(100) NOT NULL,
	PRIMARY KEY (DiseaseID)
);

CREATE TABLE PatientTable (
	PatientID int NOT NULL AUTO_INCREMENT,
	DiseaseID int NOT NULL,
	GeneralDataID int NOT NULL,
	ClinicalDataID int NOT NULL,
	LaboratoryID int NOT NULL,
	TreatmentID int NOT NULL,
	OtherTreatmentID int,
	Active int NOT NULL,
	DiseaseStatusID int,
	PRIMARY KEY (PatientID)
);

CREATE TABLE GeneralDataTable (
	GeneralDataID int NOT NULL AUTO_INCREMENT,
	LastName varchar(500) NOT NULL,
	MiddleName varchar(500),
	FirstName varchar(500) NOT NULL,
	Gender int NOT NULL,
	DateOfBirth DATE NOT NULL,
	AddressID int NOT NULL,
	TissueSpecimenID int,
	PRIMARY KEY (GeneralDataID)
);

CREATE TABLE GenderTable (
	GenderID int NOT NULL AUTO_INCREMENT,
	GenderName varchar(30) NOT NULL,
	PRIMARY KEY (GenderID)
);

CREATE TABLE AddressTable (
	AddressID int NOT NULL,
	StreetAddress varchar(500) NOT NULL,
	City varchar(200) NOT NULL,
	ZIPCode varchar(200) NOT NULL,
	PRIMARY KEY (AddressID)
);

CREATE TABLE TissueSpecimenTable (
	TissueSpecimenID int NOT NULL AUTO_INCREMENT,
	TissueSpecimenName varchar(150) NOT NULL,
	PRIMARY KEY (TissueSpecimenID)
);

CREATE TABLE ClinicalDataTable (
	ClinicalDataID int NOT NULL AUTO_INCREMENT,
	DateOfVisit DATE NOT NULL,
	Diagnosis blob NOT NULL,
	PrognosticRiskScoringID int,
	RiskScoreID int,
	ClassificationID int,
	ISSStagingID int,
	SeverityID int,
	ChiefComplaint blob,
	ConstitutionalSymptoms blob,
	OtherSymptioms blob,
	Combordities blob,
	SmokingHistory blob,
	AlcoholIntakeHistory blob,
	ChemicalExposure blob,
	PreviousInfection blob,
	PreviousHematologicDisorder blob,
	PhysicalExamID int,
	OtherFindings blob,
	PRIMARY KEY (ClinicalDataID)
);

CREATE TABLE ClassificationTable (
	ClassificationID int NOT NULL AUTO_INCREMENT,
	ClassificationName varchar(100) NOT NULL,
	PRIMARY KEY (ClassificationID)
);

CREATE TABLE MedicationsTable (
	MedicationsID int NOT NULL AUTO_INCREMENT,
	ClinicalDataID int NOT NULL,
	GenericName varchar(300) NOT NULL,
	Dose double NOT NULL,
	Frequency varchar(300) NOT NULL,
	PRIMARY KEY (MedicationsID)
);

CREATE TABLE PhysicalExamTable (
	PhysicalExamID int NOT NULL AUTO_INCREMENT,
	Height double NOT NULL,
	Weight double NOT NULL,
	ECOG double,
	Splenomegaly double,
	Hepatomegaly double,
	Lymphadenopathies double,
	Hemathroses bool,
	ContracturesAndMuscleAtropht bool,
	ThrombosisHistory blob,
	Skin blob,
	OtherFindings blob,
	PRIMARY KEY (PhysicalExamID)
);

CREATE TABLE FamilyCancerTable (
	FamilyCancerID int NOT NULL AUTO_INCREMENT,
	ClinicalDataID int NOT NULL,
	RelationshipToPatient blob NOT NULL,
	CancerName blob NOT NULL,
	PRIMARY KEY (FamilyCancerID)
);

CREATE TABLE RiskScoreTable (
	RiskScoreID int NOT NULL AUTO_INCREMENT,
	RiskScoreName varchar(500) NOT NULL,
	PRIMARY KEY (RiskScoreID)
);

CREATE TABLE ISSStagingTable (
	ISSStagingID int NOT NULL AUTO_INCREMENT,
	ISSStagingName varchar(100) NOT NULL,
	PRIMARY KEY (ISSStagingID)
);

CREATE TABLE SeverityTable (
	SeverityID int NOT NULL AUTO_INCREMENT,
	SeverityName varchar(100) NOT NULL,
	PRIMARY KEY (SeverityID)
);

CREATE TABLE PrognosticRiskScoringTable (
	PrognosticRiskScoringID int NOT NULL AUTO_INCREMENT,
	PrognosticRiskScoringName varchar(300) NOT NULL,
	PRIMARY KEY (PrognosticRiskScoringID)
);

CREATE TABLE LaboratoryProfileTable (
	LaboratoryID int NOT NULL AUTO_INCREMENT,
	DateOfBloodCollection DATE NOT NULL,
	HematologyID int,
	BloodChemistryID int,
	OtherLaboratoriesID int,
	BoneMarrowAspirateID int,
	FlowCytometry int,
	CytogenicAAPNHID int,
	CytogenicMDSID int,
	ImagingStudiesID int,
	UpperGIEndoscopyID int,
	MolecularAnalysisID int,
	HematopathologyID int,
	ImmunihistochemistryID int,
	SerumFreeID int,
	SerumProteinID int,
	SerumImmunofixationID int,
	PRIMARY KEY (LaboratoryID)
);

CREATE TABLE HematologyTable (
	HematologyID int NOT NULL AUTO_INCREMENT,
	Hemoglobin double,
	Hematocrit double,
	WhiteBloodCells double,
	Neutrophils double,
	Lymphocytes double,
	Monocytes double,
	Eosinophils double,
	Basophils double,
	Myelocytes double,
	Metamyelocytes double,
	Blasts double,
	PlateletCount double,
	PRIMARY KEY (HematologyID)
);

CREATE TABLE OtherLaboratoriesTable (
	OtherLaboratoriesID int NOT NULL AUTO_INCREMENT,
	Creatinine double,
	UricAcid double,
	ReticulocyteCount double,
	SerumIron double,
	IronbindingCapacity double,
	SerrumFerritin double,
	DirectAntiglobulin double,
	IndirectAntiglobulin double,
	SGOT double,
	SGPT double,
	LDH double,
	ScreenTestHepatitis double,
	ScreenTestEBVCytomegalovirusHIV double,
	ErythropeitinLevel double,
	SerumFolicAcid double,
	SerumB12 double,
	TSH double,
	PRIMARY KEY (OtherLaboratoriesID)
);

CREATE TABLE BloodChemistryTable (
	BloodChemistryID int NOT NULL AUTO_INCREMENT,
	Creatinine double,
	UricAcid double,
	SGOT double,
	SGPT double,
	LDH double,
	EPOLevel double,
	Na double,
	K double,
	BilirubinTotal double,
	BilirubinDirect double,
	BilirubinIndirect double,
	Beta2Microglobulin double,
	HepatitisBTesting double,
	ESR double,
	iCa double,
	TotalProtein double,
	Albumin double,
	Globulin double,
	ANATiter double,
	HepatitisCRna double,
	PRIMARY KEY (BloodChemistryID)
);

CREATE TABLE BoneMarrowAspirateTable (
	BoneMarrowAspirateID int NOT NULL AUTO_INCREMENT,
	DatePerformed DATE NOT NULL,
	Result blob NOT NULL,
	PRIMARY KEY (BoneMarrowAspirateID)
);

CREATE TABLE FlowCytometryTable (
	FlowCytometryID int NOT NULL AUTO_INCREMENT,
	Result blob NOT NULL,
	PRIMARY KEY (FlowCytometryID)
);

CREATE TABLE CytogeneticAAPNHTable (
	CytogenicAAPNHID int NOT NULL AUTO_INCREMENT,
	Result blob NOT NULL,
	PRIMARY KEY (CytogenicAAPNHID)
);

CREATE TABLE CytogeneticMDSTable  (
	CytogenicMDSID int NOT NULL AUTO_INCREMENT,
	Result blob NOT NULL,
	PRIMARY KEY (CytogenicMDSID)
);

CREATE TABLE ImagingStudiesTable (
	ImagingStudiesID int NOT NULL AUTO_INCREMENT,
	Results int NOT NULL,
	PRIMARY KEY (ImagingStudiesID)
);

CREATE TABLE UpperGIEndoscopyTable (
	UpperGIEndoscopyID int NOT NULL AUTO_INCREMENT,
	DatePerformed DATE NOT NULL,
	Description blob NOT NULL,
	HPylori bool NOT NULL,
	PRIMARY KEY (UpperGIEndoscopyID)
);

CREATE TABLE MolecularAnalysisTable (
	MolecularAnalysisID int NOT NULL AUTO_INCREMENT,
	Results blob NOT NULL,
	PRIMARY KEY (MolecularAnalysisID)
);

CREATE TABLE HematopathologyTable (
	HematopathologyID int NOT NULL AUTO_INCREMENT,
	DatePerformed DATE NOT NULL,
	Results blob NOT NULL,
	PRIMARY KEY (HematopathologyID)
);

CREATE TABLE ImmunohistochemistryTable (
	ImmunohistochemistryID int NOT NULL AUTO_INCREMENT,
	DatePerformed DATE NOT NULL,
	Results blob NOT NULL,
	PRIMARY KEY (ImmunohistochemistryID)
);

CREATE TABLE SerumFreeTable (
	SerumFreeID int NOT NULL AUTO_INCREMENT,
	Result blob NOT NULL,
	PRIMARY KEY (SerumFreeID)
);

CREATE TABLE SerumProteinTable (
	SerumProteinID int NOT NULL AUTO_INCREMENT,
	Result blob NOT NULL,
	PRIMARY KEY (SerumProteinID)
);

CREATE TABLE SerumImmunofixationTable (
	SerumImmunofixationID int NOT NULL AUTO_INCREMENT,
	Result blob NOT NULL,
	PRIMARY KEY (SerumImmunofixationID)
);

CREATE TABLE TreatmentTable (
	TreatmentID int NOT NULL AUTO_INCREMENT,
	Transplant bool,
	ModeOfTreatmentID int,
	ChemoMedicationID int,
	DateStarted DATE,
	OtherRegimen blob,
	RegimenID int,
	MaintenanceTherapyID int,
	CycleNumber int,
	Complications blob,
	RegimenText blob,
	PRIMARY KEY (TreatmentID)
);

CREATE TABLE ModeOfTreatmentTable (
	ModeOfTreatmentID int NOT NULL AUTO_INCREMENT,
	NameOfTreatment int NOT NULL,
	PRIMARY KEY (ModeOfTreatmentID)
);

CREATE TABLE ChemoMedicationsTable (
	ChemoMedicationID int NOT NULL AUTO_INCREMENT,
	MedicationName blob NOT NULL,
	PRIMARY KEY (ChemoMedicationID)
);

CREATE TABLE RegimenTable (
	RegimenID int NOT NULL AUTO_INCREMENT,
	RegimenName blob NOT NULL,
	PRIMARY KEY (RegimenID)
);

CREATE TABLE MaintenanceTherapyTable (
	MaintenanceTherapyID int NOT NULL AUTO_INCREMENT,
	MaintenanceTherapyName blob NOT NULL,
	PRIMARY KEY (MaintenanceTherapyID)
);

CREATE TABLE FollowUpTable (
	FollowUpID int NOT NULL AUTO_INCREMENT,
	PatientID int,
	DateOfVisit DATE NOT NULL,
	MedicalEventsID int,
	ClinicalDataID int,
	LaboratoryID int,
	QualityOfResponseID int,
	DiseaseStatusID int,
	SpecialNotes blob NOT NULL,
	PRIMARY KEY (FollowUpID)
);

CREATE TABLE OtherTreatmentTable (
	OtherTreatmentID int NOT NULL AUTO_INCREMENT,
	Bisphosphonates blob,
	Radiotherapy blob,
	Dialysis bool,
	OtherMedications blob,
	Complications blob,
	PRIMARY KEY (OtherTreatmentID)
);

CREATE TABLE DiseaseStatusTable (
	DiseaseStatusID int NOT NULL AUTO_INCREMENT,
	DiseaseStatus blob NOT NULL,
	PRIMARY KEY (DiseaseStatusID)
);

CREATE TABLE MedicalEventsTable (
	MedicalEventsID int NOT NULL AUTO_INCREMENT,
	NewMedicationForHematologicMalignancy blob,
	NewConcomitantMedicationForOtherDisease blob,
	UndergoAnyProcedure blob,
	ComplicationsFromChemotherapy blob,
	SelfAdministerFactorConcentrates blob,
	PRIMARY KEY (MedicalEventsID)
);

CREATE TABLE QualityOfResponseTable (
	QualityOfResponseID int NOT NULL AUTO_INCREMENT,
	ResponseName blob NOT NULL,
	PRIMARY KEY (QualityOfResponseID)
);

CREATE TABLE AccountTable (
	Username varchar(1000) NOT NULL,
	Password varchar(1000) NOT NULL,
	LastName varchar(500) NOT NULL,
	FirstName varchar(500) NOT NULL,
	MiddleName varchar(500),
	RoleID int NOT NULL,
    Active int NOT NULL,
	PRIMARY KEY (Username)
);

CREATE TABLE RoleTable (
	RoleID int NOT NULL,
	RoleName varchar(500) NOT NULL,
	PRIMARY KEY (RoleID)
);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk0 FOREIGN KEY (DiseaseID) REFERENCES DiseaseTable(DiseaseID);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk1 FOREIGN KEY (GeneralDataID) REFERENCES GeneralDataTable(GeneralDataID);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk2 FOREIGN KEY (ClinicalDataID) REFERENCES ClinicalDataTable(ClinicalDataID);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk3 FOREIGN KEY (LaboratoryID) REFERENCES LaboratoryProfileTable(LaboratoryID);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk4 FOREIGN KEY (TreatmentID) REFERENCES TreatmentTable(TreatmentID);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk5 FOREIGN KEY (OtherTreatmentID) REFERENCES OtherTreatmentTable(OtherTreatmentID);

ALTER TABLE PatientTable ADD CONSTRAINT PatientTable_fk6 FOREIGN KEY (DiseaseStatusID) REFERENCES DiseaseStatusTable(DiseaseStatusID);

ALTER TABLE GeneralDataTable ADD CONSTRAINT GeneralDataTable_fk0 FOREIGN KEY (Gender) REFERENCES GenderTable(GenderID);

ALTER TABLE GeneralDataTable ADD CONSTRAINT GeneralDataTable_fk1 FOREIGN KEY (AddressID) REFERENCES AddressTable(AddressID);

ALTER TABLE GeneralDataTable ADD CONSTRAINT GeneralDataTable_fk2 FOREIGN KEY (TissueSpecimenID) REFERENCES TissueSpecimenTable(TissueSpecimenID);

ALTER TABLE ClinicalDataTable ADD CONSTRAINT ClinicalDataTable_fk0 FOREIGN KEY (PrognosticRiskScoringID) REFERENCES PrognosticRiskScoringTable(PrognosticRiskScoringID);

ALTER TABLE ClinicalDataTable ADD CONSTRAINT ClinicalDataTable_fk1 FOREIGN KEY (RiskScoreID) REFERENCES RiskScoreTable(RiskScoreID);

ALTER TABLE ClinicalDataTable ADD CONSTRAINT ClinicalDataTable_fk2 FOREIGN KEY (ClassificationID) REFERENCES ClassificationTable(ClassificationID);

ALTER TABLE ClinicalDataTable ADD CONSTRAINT ClinicalDataTable_fk3 FOREIGN KEY (ISSStagingID) REFERENCES ISSStagingTable(ISSStagingID);

ALTER TABLE ClinicalDataTable ADD CONSTRAINT ClinicalDataTable_fk4 FOREIGN KEY (SeverityID) REFERENCES SeverityTable(SeverityID);

ALTER TABLE ClinicalDataTable ADD CONSTRAINT ClinicalDataTable_fk5 FOREIGN KEY (PhysicalExamID) REFERENCES PhysicalExamTable(PhysicalExamID);

ALTER TABLE MedicationsTable ADD CONSTRAINT MedicationsTable_fk0 FOREIGN KEY (ClinicalDataID) REFERENCES ClinicalDataTable(ClinicalDataID);

ALTER TABLE FamilyCancerTable ADD CONSTRAINT FamilyCancerTable_fk0 FOREIGN KEY (ClinicalDataID) REFERENCES ClinicalDataTable(ClinicalDataID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk0 FOREIGN KEY (HematologyID) REFERENCES HematologyTable(HematologyID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk1 FOREIGN KEY (BloodChemistryID) REFERENCES BloodChemistryTable(BloodChemistryID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk2 FOREIGN KEY (OtherLaboratoriesID) REFERENCES OtherLaboratoriesTable(OtherLaboratoriesID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk3 FOREIGN KEY (BoneMarrowAspirateID) REFERENCES BoneMarrowAspirateTable(BoneMarrowAspirateID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk4 FOREIGN KEY (FlowCytometry) REFERENCES FlowCytometryTable(FlowCytometryID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk5 FOREIGN KEY (CytogenicAAPNHID) REFERENCES CytogeneticAAPNHTable(CytogenicAAPNHID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk6 FOREIGN KEY (CytogenicMDSID) REFERENCES CytogeneticMDSTable (CytogenicMDSID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk7 FOREIGN KEY (ImagingStudiesID) REFERENCES ImagingStudiesTable(ImagingStudiesID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk8 FOREIGN KEY (UpperGIEndoscopyID) REFERENCES UpperGIEndoscopyTable(UpperGIEndoscopyID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk9 FOREIGN KEY (MolecularAnalysisID) REFERENCES MolecularAnalysisTable(MolecularAnalysisID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk10 FOREIGN KEY (HematopathologyID) REFERENCES HematopathologyTable(HematopathologyID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk11 FOREIGN KEY (ImmunihistochemistryID) REFERENCES ImmunohistochemistryTable(ImmunohistochemistryID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk12 FOREIGN KEY (SerumFreeID) REFERENCES SerumFreeTable(SerumFreeID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk13 FOREIGN KEY (SerumProteinID) REFERENCES SerumProteinTable(SerumProteinID);

ALTER TABLE LaboratoryProfileTable ADD CONSTRAINT LaboratoryProfileTable_fk14 FOREIGN KEY (SerumImmunofixationID) REFERENCES SerumImmunofixationTable(SerumImmunofixationID);

ALTER TABLE TreatmentTable ADD CONSTRAINT TreatmentTable_fk0 FOREIGN KEY (ModeOfTreatmentID) REFERENCES ModeOfTreatmentTable(ModeOfTreatmentID);

ALTER TABLE TreatmentTable ADD CONSTRAINT TreatmentTable_fk1 FOREIGN KEY (ChemoMedicationID) REFERENCES ChemoMedicationsTable(ChemoMedicationID);

ALTER TABLE TreatmentTable ADD CONSTRAINT TreatmentTable_fk2 FOREIGN KEY (RegimenID) REFERENCES RegimenTable(RegimenID);

ALTER TABLE TreatmentTable ADD CONSTRAINT TreatmentTable_fk3 FOREIGN KEY (MaintenanceTherapyID) REFERENCES MaintenanceTherapyTable(MaintenanceTherapyID);

ALTER TABLE FollowUpTable ADD CONSTRAINT FollowUpTable_fk0 FOREIGN KEY (PatientID) REFERENCES PatientTable(PatientID);

ALTER TABLE FollowUpTable ADD CONSTRAINT FollowUpTable_fk1 FOREIGN KEY (MedicalEventsID) REFERENCES MedicalEventsTable(MedicalEventsID);

ALTER TABLE FollowUpTable ADD CONSTRAINT FollowUpTable_fk2 FOREIGN KEY (ClinicalDataID) REFERENCES ClinicalDataTable(ClinicalDataID);

ALTER TABLE FollowUpTable ADD CONSTRAINT FollowUpTable_fk3 FOREIGN KEY (LaboratoryID) REFERENCES LaboratoryProfileTable(LaboratoryID);

ALTER TABLE FollowUpTable ADD CONSTRAINT FollowUpTable_fk4 FOREIGN KEY (QualityOfResponseID) REFERENCES QualityOfResponseTable(QualityOfResponseID);

ALTER TABLE FollowUpTable ADD CONSTRAINT FollowUpTable_fk5 FOREIGN KEY (DiseaseStatusID) REFERENCES DiseaseStatusTable(DiseaseStatusID);

ALTER TABLE AccountTable ADD CONSTRAINT AccountTable_fk0 FOREIGN KEY (RoleID) REFERENCES RoleTable(RoleID);
