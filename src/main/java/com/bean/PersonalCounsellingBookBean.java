package com.bean;

import java.sql.Timestamp;

public class PersonalCounsellingBookBean {
	int personalCID;
	Timestamp requestedAt;
	boolean accepted;
	int userID;
	int timeSlotID;
	public int getPersonalCID() {
		return personalCID;
	}
	public void setPersonalCID(int personalCID) {
		this.personalCID = personalCID;
	}
	public Timestamp getRequestedAt() {
		return requestedAt;
	}
	public void setRequestedAt(Timestamp requestedAt) {
		this.requestedAt = requestedAt;
	}
	public boolean isAccepted() {
		return accepted;
	}
	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getTimeSlotID() {
		return timeSlotID;
	}
	public void setTimeSlotID(int timeSlotID) {
		this.timeSlotID = timeSlotID;
	}

}
