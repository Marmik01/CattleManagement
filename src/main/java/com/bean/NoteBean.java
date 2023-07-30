package com.bean;

import java.util.Map;

public class NoteBean {
String content;
String subject;

Map<String, String> data;

public Map<String, String> getData() {
	return data;
}
public void setData(Map<String, String> data) {
	this.data = data;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}


}
