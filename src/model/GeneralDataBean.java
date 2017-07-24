package model;

public class GeneralDataBean {
	private String lastName;
	private String middleName;
	private String firstName;
	private int gender;
	private String dateOfBirth;
	private String dateOfEntry;
	private int tissueSpecimenId;
	
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getDateOfEntry() {
		return dateOfEntry;
	}
	public void setDateOfEntry(String dateOfEntry) {
		this.dateOfEntry = dateOfEntry;
	}
	public int getTissueSpecimenId() {
		return tissueSpecimenId;
	}
	public void setTissueSpecimenId(int tissueSpecimenId) {
		this.tissueSpecimenId = tissueSpecimenId;
	}
}
