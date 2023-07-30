package com.bean;


import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class SeminarBean {
	
	int seminarID;
	
	String seminarName;
	String seminarType;
	
	
	float seminarFees;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	LocalDateTime seminarStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	LocalDateTime seminarEnd;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	LocalDateTime seminarRegistrationStart;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	LocalDateTime seminarRegistrationEnd;
	boolean acceptingRegistration;
	String seminarZoomLink;
	String seminarDescription;
	String imgPathGujarati;
	String imgPathEnglish;
	
	String whatsappLink;
	
	public String getImgPathGujarati() {
		return imgPathGujarati;
	}
	
	


	public void setImgPathGujarati(String imgPathGujarati) {
		this.imgPathGujarati = imgPathGujarati;
	}
	public String getImgPathEnglish() {
		return imgPathEnglish;
	}
	public void setImgPathEnglish(String imgPathEnglish) {
		this.imgPathEnglish = imgPathEnglish;
	}
	public String getSeminarZoomLink() {
		return seminarZoomLink;
	}
	public void setSeminarZoomLink(String seminarZoomLink) {
		this.seminarZoomLink = seminarZoomLink;
	}
	public String getWhatsappLink() {
		return whatsappLink;
	}
	public void setWhatsappLink(String whatsappLink) {
		this.whatsappLink = whatsappLink;
	}

	public String getSeminarDescription() {
		return seminarDescription;
	}
	public void setSeminarDescription(String seminarDescription) {
		this.seminarDescription = seminarDescription;
	}
	public int getSeminarID() {
		return seminarID;
	}
	public void setSeminarID(int seminarID) {
		this.seminarID = seminarID;
	}
	public String getSeminarName() {
		return seminarName;
	}
	public void setSeminarName(String seminarName) {
		this.seminarName = seminarName;
	}
	public String getSeminarType() {
		return seminarType;
	}
	public void setSeminarType(String seminarType) {
		this.seminarType = seminarType;
	}
	public float getSeminarFees() {
		return seminarFees;
	}
	public void setSeminarFees(float seminarFees) {
		this.seminarFees = seminarFees;
	}
	
	public LocalDateTime getSeminarStart() {
		return this.seminarStart;
	}
	public void setSeminarStart(LocalDateTime seminarStart) {
		this.seminarStart = seminarStart;
	}
	public LocalDateTime getSeminarEnd() {
		return seminarEnd;
	}
	public void setSeminarEnd(LocalDateTime seminarEnd) {
		this.seminarEnd = seminarEnd;
	}
	public LocalDateTime getSeminarRegistrationStart() {
		return seminarRegistrationStart;
	}
	public void setSeminarRegistrationStart(LocalDateTime seminarRegistrationStart) {
		this.seminarRegistrationStart = seminarRegistrationStart;
	}
	public LocalDateTime getSeminarRegistrationEnd() {
		return seminarRegistrationEnd;
	}
	public void setSeminarRegistrationEnd(LocalDateTime seminarRegistrationEnd) {
		this.seminarRegistrationEnd = seminarRegistrationEnd;
	}
	public boolean isAcceptingRegistration() {
		return acceptingRegistration;
	}
	public void setAcceptingRegistration(boolean acceptingRegistration) {
		this.acceptingRegistration = acceptingRegistration;
	}





	
}
