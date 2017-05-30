package model;

public class PatientBean {
	private int diseaseId;
	private int generalDataId;
	private int clinicalDataId;
	private int laboratoryId;
	private int treatmentId;
	private int otherTreatmentId;
	private int active;
	private int diseaseStatusId;
	
	public int getDiseaseId() {
		return diseaseId;
	}
	public void setDiseaseId(int diseaseId) {
		this.diseaseId = diseaseId;
	}
	public int getGeneralDataId() {
		return generalDataId;
	}
	public void setGeneralDataId(int generalDataId) {
		this.generalDataId = generalDataId;
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
	public int getTreatmentId() {
		return treatmentId;
	}
	public void setTreatmentId(int treatmentId) {
		this.treatmentId = treatmentId;
	}
	public int getOtherTreatmentId() {
		return otherTreatmentId;
	}
	public void setOtherTreatmentId(int otherTreatmentId) {
		this.otherTreatmentId = otherTreatmentId;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public int getDiseaseStatusId() {
		return diseaseStatusId;
	}
	public void setDiseaseStatusId(int diseaseStatusId) {
		this.diseaseStatusId = diseaseStatusId;
	}
}
