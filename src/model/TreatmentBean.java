package model;

public class TreatmentBean {
	private boolean transplant;
	private int modeOfTreatmentId;
	private int chemoMedicationId;
	private String dateStarted;
	private String otherRegimen;
	private int regimenId;
	private int maintenanceTherapyId;
	private int cycleNumber;
	private String complications;
	private String regimenText;
	
	public boolean isTransplant() {
		return transplant;
	}
	public void setTransplant(boolean transplant) {
		this.transplant = transplant;
	}
	public int getModeOfTreatmentId() {
		return modeOfTreatmentId;
	}
	public void setModeOfTreatmentId(int modeOfTreatmentId) {
		this.modeOfTreatmentId = modeOfTreatmentId;
	}
	public int getChemoMedicationId() {
		return chemoMedicationId;
	}
	public void setChemoMedicationId(int chemoMedicationId) {
		this.chemoMedicationId = chemoMedicationId;
	}
	public String getDateStarted() {
		return dateStarted;
	}
	public void setDateStarted(String dateStarted) {
		this.dateStarted = dateStarted;
	}
	public String getOtherRegimen() {
		return otherRegimen;
	}
	public void setOtherRegimen(String otherRegimen) {
		this.otherRegimen = otherRegimen;
	}
	public int getRegimenId() {
		return regimenId;
	}
	public void setRegimenId(int regimenId) {
		this.regimenId = regimenId;
	}
	public int getMaintenanceTherapyId() {
		return maintenanceTherapyId;
	}
	public void setMaintenanceTherapyId(int maintenanceTherapyId) {
		this.maintenanceTherapyId = maintenanceTherapyId;
	}
	public int getCycleNumber() {
		return cycleNumber;
	}
	public void setCycleNumber(int cycleNumber) {
		this.cycleNumber = cycleNumber;
	}
	public String getComplications() {
		return complications;
	}
	public void setComplications(String complications) {
		this.complications = complications;
	}
	public String getRegimenText() {
		return regimenText;
	}
	public void setRegimenText(String regimenText) {
		this.regimenText = regimenText;
	}
	
	
}
