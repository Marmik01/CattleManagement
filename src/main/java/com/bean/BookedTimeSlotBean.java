package com.bean;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class BookedTimeSlotBean {
	String firstName;
	String lastName;
	int timeSlotID;
	int userID;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	public LocalDateTime startTime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	public LocalDateTime endTime;
	
	String counsellingType;
	String link;
	boolean booked;
	
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
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
	public int getTimeSlotID() {
		return timeSlotID;
	}
	public void setTimeSlotID(int timeSlotID) {
		this.timeSlotID = timeSlotID;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public boolean isBooked() {
		return booked;
	}
	public void setBooked(boolean booked) {
		this.booked = booked;
	}

}
