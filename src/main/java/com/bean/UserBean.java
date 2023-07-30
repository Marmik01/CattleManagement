package com.bean;

import java.sql.Timestamp;

public class UserBean {
	
	int userID;
	String emailID;
	String password;
	String firstName;
	String lastName;
	String phoneNumber;
	Timestamp createdAt;
	String tokenID;
	
	public String getTokenID() {
		return tokenID;
	}
	public void setTokenID(String tokenID) {
		this.tokenID = tokenID;
	}
	boolean userActive;
	boolean userInterested;
	
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public boolean isUserActive() {
		return userActive;
	}
	public void setUserActive(boolean userActive) {
		this.userActive = userActive;
	}
	public boolean isUserInterested() {
		return userInterested;
	}
	public void setUserInterested(boolean userInterested) {
		this.userInterested = userInterested;
	}
	public Timestamp getCreateAt() {
		return createdAt;
	}
	public void setCreateAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	
}
