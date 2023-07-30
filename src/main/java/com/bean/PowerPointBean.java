package com.bean;

import java.sql.Timestamp;

public class PowerPointBean {
	int pptID;
	String fileName;	
	String pptURL;	
	boolean pptActive;	
	Timestamp addedAt;
	public int getPptID() {
		return pptID;
	}
	public void setPptID(int pptID) {
		this.pptID = pptID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPptURL() {
		return pptURL;
	}
	public void setPptURL(String pptURL) {
		this.pptURL = pptURL;
	}
	
	
	public boolean isPptActive() {
		return pptActive;
	}
	public void setPptActive(boolean pptActive) {
		this.pptActive = pptActive;
	}
	public Timestamp getAddedAt() {
		return addedAt;
	}
	public void setAddedAt(Timestamp addedAt) {
		this.addedAt = addedAt;
	}	

}
