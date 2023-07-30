package com.bean;

public class SeminarRegistrationBean {

	int seminarID;
	int userID;
	
	String question;
	int registrationID;
	String emailID;
	
	
	
	
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public int getSeminarID() {
		return seminarID;
	}
	public void setSeminarID(int seminarID) {
		this.seminarID = seminarID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getRegistrationID() {
		return registrationID;
	}
	public void setRegistrationID(int registrationID) {
		this.registrationID = registrationID;
	}
	
	
}
