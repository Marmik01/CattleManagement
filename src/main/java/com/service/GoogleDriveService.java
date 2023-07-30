package com.service;

import java.io.ByteArrayInputStream;
import java.util.Collections;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.InputStreamContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;

//JacksonFactory jsonFactory = new JacksonFactory();

@SuppressWarnings("deprecation")
@Service
public class GoogleDriveService {

	private static final Logger LOGGER = LoggerFactory.getLogger(GoogleDriveService.class);
	
	@Value("${google.serviceAccountEmail}")
	String serviceAccountEmail;
	
	@Value("${google.applicationName}")
	String applicationName;

	@Value("${google.serviceAccountKey}")
	String serviceAccountKey;

	@Value("${google.seminarImages}")
	String seminarImages;
	
	@Value("${google.userImageProfile}")
	String userImageProfile;


	@Value("${google.presentationFile}")
	String presentationFile;
	
	public Drive getDriveService() {
		Drive service = null;
		try {
			java.io.File  key = new java.io.File("royal-counselling-22e4c262245d.p12");
			HttpTransport httpTransport = new NetHttpTransport();
			JsonFactory jsonFactory = new GsonFactory();

			GoogleCredential credential = new GoogleCredential.Builder().setTransport(httpTransport)
					.setJsonFactory(jsonFactory).setServiceAccountId(serviceAccountEmail)
					.setServiceAccountScopes(Collections.singleton(DriveScopes.DRIVE))
					.setServiceAccountPrivateKeyFromP12File(key).build();
			service = new Drive.Builder(httpTransport, jsonFactory, credential).setApplicationName(applicationName)
					.setHttpRequestInitializer(credential).build();
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error(e.getMessage());

		}

		return service;

	}

	public String upLoadFile(MultipartFile file,String imageType) {
		try {
			String folderId = null;
			if(imageType.equals("seminar")) {
				folderId = seminarImages;	
			}
			else if(imageType.equals("profile")) {
				folderId = userImageProfile;
			}
			else if(imageType.equals("presentation")) {
				folderId = presentationFile;
			}
			 if (null != file) {
		        File fileMetadata = new File();
		        fileMetadata.setParents(Collections.singletonList(folderId));
		        fileMetadata.setName(file.getOriginalFilename());
		        File uploadFile = getDriveService()
		              .files()
		              .create(fileMetadata, new InputStreamContent(
		                    file.getContentType(),
		                    new ByteArrayInputStream(file.getBytes()))
		              )
		              .setFields("id").execute();
		        return uploadFile.getId();
		}} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}
		return null;
	}

	

}