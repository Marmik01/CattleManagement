package com.service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.bean.AdminBean;
import com.bean.UserBean;

@Service
public class EmailService {
	
	@Value("${fromMail}")
	String mailID;
	
	@Value("${mailPassword}")
	String password;
	
	public void sendMessage(UserBean user,String body,String subject) {
		String to = user.getEmailID(); // to address
		final String from = mailID;// from address
		final String appPassword = password;
		Properties prop = System.getProperties();

		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.enable", "false");

		Session session = Session.getInstance(prop, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(from, appPassword);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(from);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setContent(body.replaceAll("\n", "<br>"),"text/html");
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("something went wrong...........");
		}

	}
	public void sendMessage(AdminBean user,String body,String subject) {
		String to = user.getEmailID(); // to address
		final String from = mailID;// from address
		final String appPassword = password;
		Properties prop = System.getProperties();

		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.enable", "false");

		Session session = Session.getInstance(prop, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(from, appPassword);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(from);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setContent(body.replaceAll("\n", "<br>"),"text/html");
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("something went wrong...........");
		}

	}
}

