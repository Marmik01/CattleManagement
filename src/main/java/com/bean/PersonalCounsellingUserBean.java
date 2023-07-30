package com.bean;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class PersonalCounsellingUserBean {
	int timeSlotID;
	int userID;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	public LocalDateTime startTime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	public LocalDateTime endTime;
	
	String counsellingType;
	Timestamp acceptedAt;
	String link;
	Timestamp requestedAt;
	
	public Timestamp getRequestedAt() {
		return requestedAt;
	}
	public void setRequestedAt(Timestamp requestedAt) {
		this.requestedAt = requestedAt;
	}
	public int getTimeSlotID() {
		return timeSlotID;
	}
	public void setTimeSlotID(int timeSlotID) {
		this.timeSlotID = timeSlotID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public LocalDateTime getStartTime() {
		return startTime;
	}
	public void setStartTime(LocalDateTime startTime) {
		this.startTime = startTime;
	}
	public LocalDateTime getEndTime() {
		return endTime;
	}
	public void setEndTime(LocalDateTime endTime) {
		this.endTime = endTime;
	}
	public String getCounsellingType() {
		return counsellingType;
	}
	public void setCounsellingType(String counsellingType) {
		this.counsellingType = counsellingType;
	}
	public Timestamp getAcceptedAt() {
		return acceptedAt;
	}
	public void setAcceptedAt(Timestamp acceptedAt) {
		this.acceptedAt = acceptedAt;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

}
