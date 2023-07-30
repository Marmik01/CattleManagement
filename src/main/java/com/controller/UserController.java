package com.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bean.LoginBean;
import com.bean.ResponseBean;
import com.bean.UserBean;
import com.bean.UserProfileBean;
import com.dao.UserDao;
import com.service.EmailService;
import com.service.GoogleDriveService;

@RestController
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	GoogleDriveService googleDriveService;
	
	@Autowired
	EmailService emailService;
	
	@PostMapping("/loginUser")
	public ResponseBean<UserBean> loginUser(LoginBean loginBean){
		ResponseBean<UserBean> rb = new ResponseBean<UserBean>();
		UserBean user = userDao.getUserByLogin(loginBean);
		
		if(user != null) {

			if(user.getTokenID()== null) {
				user.setTokenID(loginBean.getTokenID());					
				userDao.updateTokenID(user);				
			}
			else if(!user.getTokenID().equals(loginBean.getTokenID())) {
				user.setTokenID(loginBean.getTokenID());				
				userDao.updateTokenID(user);
			}
			rb.setData(user);
			rb.setMessage("Succesfully Login");
			rb.setStatus(200);
		}
		else {
			rb.setData(user);
			rb.setMessage("Invalid Credentials");
			rb.setStatus(-1);
		}
		return rb;
	}
	
	@PostMapping("/signUpUser")
	public ResponseBean<UserBean> signUpUser(UserBean userBean,@RequestParam("tokenID") String tokenID){
		ResponseBean<UserBean> rb = new ResponseBean<UserBean>(); 
		rb.setData(userBean);
		if(userDao.checkDuplicateEmail(userBean.getEmailID().trim())){
			int userID = (int)userDao.insertUser(userBean,tokenID);
			int i = 0;
			if(userID !=0) {
				userBean.setUserID(userID);
				i = userDao.insertUserProfile(userID);
			}
			if(i==1) {
				rb.setStatus(200);
				rb.setMessage("Sign up Succesfull");				
			}
			else {
				rb.setStatus(-1);
				rb.setMessage("Some error occured");
			}
		}
		else {
			rb.setStatus(-1);
			rb.setMessage("Email ID Already Registered");
		}
		return rb;
	}
	
	@PostMapping("/signUpUserProfile")
	public ResponseBean<UserProfileBean> signUpUserProfile(UserProfileBean userProfileBean,@RequestParam("image") MultipartFile file){
		ResponseBean<UserProfileBean> rb = new ResponseBean<UserProfileBean>(); 
		UserBean user = userDao.getUserByEmailID(userProfileBean.getEmailID());
		userProfileBean.setUserID(user.getUserID());
		if(!file.isEmpty()) {
			if(userProfileBean.getImageDesc().equals("new")) {
				String id = googleDriveService.upLoadFile(file, "profile");
				userProfileBean.setProfileImage("https://drive.google.com/uc?export=view&id="+id);
			}
		}
		int i = userDao.updateUserProfile(userProfileBean);
		if(i==1) {
			rb.setStatus(200);
			rb.setMessage("Profile Setup Succesfull");				
		}
		else {
			rb.setStatus(-1);
			rb.setMessage("Some error occured");							
		}
		rb.setData(userProfileBean);
		return rb;
	}
	@GetMapping("/signUpUserProfile/{emailID}")
	public ResponseBean<UserProfileBean> signUpUserProfileByEmailID(@PathVariable("emailID") String emailID){
		ResponseBean<UserProfileBean> rb = new ResponseBean<UserProfileBean>(); 
		UserBean user = userDao.getUserByEmailID(emailID);
		UserProfileBean userDBMSProfile = userDao.getUserProfileByID(user.getUserID());
		rb.setMessage("Fetch Data Successfully");
		rb.setStatus(200);
		rb.setData(userDBMSProfile);
		return rb;
	}
	@PostMapping("/forgotPasswordByUser")
	public ResponseBean<UserBean> forgotPassword(@RequestParam("emailID") String emailID) {
		ResponseBean<UserBean> rb = new ResponseBean<UserBean>();
		UserBean user = userDao.getUserByEmailID(emailID.trim());
		if(user!=null) {
			emailService.sendMessage(user, "Your password is : "+user.getPassword(), "Forgot Password Request");
			rb.setMessage("Email Sent Successfully");
			rb.setStatus(200);
		}
		else {
			rb.setMessage("Invalid EmailID");
			rb.setStatus(-1);
		}
		rb.setData(user);		
		return rb;
	}
	
}
