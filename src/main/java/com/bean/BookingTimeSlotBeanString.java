package com.bean;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class BookingTimeSlotBeanString {
	String firstName;
	String lastName;
	String emailID;
	String phoneNumber;
	int timeSlotID;
	int userID;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	public LocalDateTime startTime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	public LocalDateTime endTime;
	
	String counsellingType;
	String link;
	int personalCID;
	Timestamp requestedAt;
	String accepted;
	
	
	public void setRequestedAt(Timestamp requestedAt) {
		this.requestedAt = requestedAt;
	}
	public String getAccepted() {
		return accepted;
	}
	public void setAccepted(String accepted) {
		this.accepted = accepted;
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
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phonenumber) {
		this.phoneNumber = phonenumber;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getPersonalCID() {
		return personalCID;
	}
	public void setPersonalCID(int personalCID) {
		this.personalCID = personalCID;
	}
	public Timestamp getRequestedAt() {
		return requestedAt;
	}
	public void setRequestedat(Timestamp requestedat) {
		this.requestedAt = requestedat;
	}
	
}
