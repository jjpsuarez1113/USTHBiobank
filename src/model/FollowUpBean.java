package model;

public class FollowUpBean {
	private int patientId;
	private String dateOfVisit;
	private int medicalEventsId;
	private int clinicalDataId;
	private int laboratoryId;
	private int qualityofResponseId;
	private int diseaseStatusId;
	private String specialNotes;
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getDateOfVisit() {
		return dateOfVisit;
	}
	public void setDateOfVisit(String dateOfVisit) {
		this.dateOfVisit = dateOfVisit;
	}
	public int getMedicalEventsId() {
		return medicalEventsId;
	}
	public void setMedicalEventsId(int medicalEventsId) {
		this.medicalEventsId = medicalEventsId;
	}
	public int getClinicalDataId() {
		return clinicalDataId;
	}
	public void setClinicalDataId(int clinicalDataId) {
		this.clinicalDataId = clinicalDataId;
	}
	public int getLaboratoryId() {
		return laboratoryId;
	}
	public void setLaboratoryId(int laboratoryId) {
		this.laboratoryId = laboratoryId;
	}
	public int getQualityofResponseId() {
		return qualityofResponseId;
	}
	public void setQualityofResponseId(int qualityofResponseId) {
		this.qualityofResponseId = qualityofResponseId;
	}
	public int getDiseaseStatusId() {
		return diseaseStatusId;
	}
	public void setDiseaseStatusId(int diseaseStatusId) {
		this.diseaseStatusId = diseaseStatusId;
	}
	public String getSpecialNotes() {
		return specialNotes;
	}
	public void setSpecialNotes(String specialNotes) {
		this.specialNotes = specialNotes;
	}
}
