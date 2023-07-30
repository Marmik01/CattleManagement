package com.bean;

import java.sql.Timestamp;

public class PowerPointRequest {
	int requestID;
	String requestQuery;
	int userID;	
	
	Timestamp requestAt;		
	String comment;
	String emailID;
	String firstName;
	String lastName;
	String phoneNumber;
	Timestamp queryFinishTime;
	boolean queryOver;

	public Timestamp getQueryFinishTime() {
		return queryFinishTime;
	}

	public void setQueryFinishTime(Timestamp queryFinishTime) {
		this.queryFinishTime = queryFinishTime;
	}

	public int getRequestID() {
		return requestID;
	}

	public void setRequestID(int requestID) {
		this.requestID = requestID;
	}

	public String getRequestQuery() {
		return requestQuery;
	}

	public void setRequestQuery(String requestQuery) {
		this.requestQuery = requestQuery;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public Timestamp getRequestAt() {
		return requestAt;
	}

	public void setRequestAt(Timestamp requestAt) {
		this.requestAt = requestAt;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	public boolean isQueryOver() {
		return queryOver;
	}

	public void setQueryOver(boolean queryOver) {
		this.queryOver = queryOver;
	}
	
	
}
