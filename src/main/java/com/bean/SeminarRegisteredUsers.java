package com.bean;

import java.sql.Timestamp;

public class SeminarRegisteredUsers {
	int userID;
	String emailID;
	String firstName;
	String lastName;
	String phoneNumber;
	Timestamp registrationAt;
	String question;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public Timestamp getRegistrationAt() {
		return registrationAt;
	}
	public void setRegistrationAt(Timestamp registrationAt) {
		this.registrationAt = registrationAt;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
}
