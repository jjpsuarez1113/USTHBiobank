package model;

public class PhysicalExamBean {
	private double height;
	private double weight;
	private double ECOG;
	private double splenomegaly;
	private double hepatomegaly;
	private double lymphadenopathies;
	private boolean hemathroses;
	private boolean contracturesAndMuscleAtrophy;
	private String thrombosisHistory;
	private String skin;
	private String otherFindings;
	
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public double getECOG() {
		return ECOG;
	}
	public void setECOG(double eCOG) {
		ECOG = eCOG;
	}
	public double getSplenomegaly() {
		return splenomegaly;
	}
	public void setSplenomegaly(double splenomegaly) {
		this.splenomegaly = splenomegaly;
	}
	public double getHepatomegaly() {
		return hepatomegaly;
	}
	public void setHepatomegaly(double hepatomegaly) {
		this.hepatomegaly = hepatomegaly;
	}
	public double getLymphadenopathies() {
		return lymphadenopathies;
	}
	public void setLymphadenopathies(double lymphadenopathies) {
		this.lymphadenopathies = lymphadenopathies;
	}
	public boolean isHemathroses() {
		return hemathroses;
	}
	public void setHemathroses(boolean hemathroses) {
		this.hemathroses = hemathroses;
	}
	public boolean isContracturesAndMuscleAtrophy() {
		return contracturesAndMuscleAtrophy;
	}
	public void setContracturesAndMuscleAtrophy(boolean contracturesAndMuscleAtrophy) {
		this.contracturesAndMuscleAtrophy = contracturesAndMuscleAtrophy;
	}
	public String getThrombosisHistory() {
		return thrombosisHistory;
	}
	public void setThrombosisHistory(String thrombosisHistory) {
		this.thrombosisHistory = thrombosisHistory;
	}
	public String getSkin() {
		return skin;
	}
	public void setSkin(String skin) {
		this.skin = skin;
	}
	public String getOtherFindings() {
		return otherFindings;
	}
	public void setOtherFindings(String otherFindings) {
		this.otherFindings = otherFindings;
	}
	
	
}
