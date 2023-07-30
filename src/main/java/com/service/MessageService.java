package com.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import com.bean.UserBean;
 
@Service
public class MessageService {
	public String getGroups() {
		try {
			// Construct data
			String apiKey = "apikey=" + "NmI3MjQ1NGU0OTc0MzY0OTc4Njc0MTcyMzg0ODRjNTI";
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/get_sender_names/?").openConnection();
			String data = apiKey;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			return "Error "+e;
		}
	}
	public String sendSms(UserBean user,String messageText) {
		try {
			// Construct data
			String apiKey = "apikey=" + "NmI3MjQ1NGU0OTc0MzY0OTc4Njc0MTcyMzg0ODRjNTI=";
			String message = "&message=" + "Hi there, thank you for sending your first test message from Textlocal. See how you can send effective SMS campaigns here: https://tx.gl/r/2nGVj/";
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "91"+user.getPhoneNumber();
			
			// Send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			return stringBuffer.toString();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error SMS "+e);
			return "Error "+e;
		}
	}
}