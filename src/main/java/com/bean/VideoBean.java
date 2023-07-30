package com.bean;

import java.sql.Timestamp;

public class VideoBean {
	int videoID;
	String videoTitle;
	String videoDisplayLocation;	
	Timestamp addedAt;
	boolean videoActive;
	String videoYoutubeLink;
	
	public String getVideoYoutubeLink() {
		return videoYoutubeLink;
	}
	public void setVideoYoutubeLink(String videoYoutubeLink) {
		this.videoYoutubeLink = videoYoutubeLink;
	}
	public int getVideoID() {
		return videoID;
	}
	public void setVideoID(int videoID) {
		this.videoID = videoID;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public String getVideoDisplayLocation() {
		return videoDisplayLocation;
	}
	public void setVideoDisplayLocation(String videoDisplayLocation) {
		this.videoDisplayLocation = videoDisplayLocation;
	}
	public Timestamp getAddedAt() {
		return addedAt;
	}
	public void setAddedAt(Timestamp addedAt) {
		this.addedAt = addedAt;
	}
	public boolean isVideoActive() {
		return videoActive;
	}
	public void setVideoActive(boolean videoActive) {
		this.videoActive = videoActive;
	}
	
}
