package model;

public class UpperGIEndoscopyBean {
	private String datePerformed;
	private String description;
	private boolean HOylori;
	
	public String getDatePerformed() {
		return datePerformed;
	}
	public void setDatePerformed(String datePerformed) {
		this.datePerformed = datePerformed;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isHOylori() {
		return HOylori;
	}
	public void setHOylori(boolean hOylori) {
		HOylori = hOylori;
	}
}
