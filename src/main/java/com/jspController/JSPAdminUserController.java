package com.jspController;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.SeminarRegistrationUser;
import com.dao.SeminarDao;
import com.dao.TimeSlotDao;
import com.dao.UserDao;

@RequestMapping("/admin")
@Controller
public class JSPAdminUserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	SeminarDao seminarDao;
	
	@Autowired
	TimeSlotDao timeSlotDao;
	
	@GetMapping("/userMangement")
	public String userMangement(Model model,HttpSession session) {
		String  msg = null;
		try{
			msg = (String)session.getAttribute("msg");
			session.removeAttribute("msg");			
		}
		catch(Exception e) {
			
		}
		model.addAttribute("msg",msg);
		model.addAttribute("userList",userDao.getAllUserProfileList());
		return "AdminUserManagement";
	}
	
	@GetMapping("deactivateUser/{userID}")
	public String deactivateUser(@PathVariable("userID") int userID,HttpSession session) {
		int i = userDao.deactivateUser(userID);
		if(i == 1) {
			session.setAttribute("msg", "Deactived user successfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
			
		}
		return "redirect:/admin/userMangement";
	}
	@GetMapping("activateUser/{userID}")
	public String activateUser(@PathVariable("userID") int userID,HttpSession session) {
		int i = userDao.activateUser(userID);
		if(i == 1) {
			session.setAttribute("msg", "Actived user successfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
			
		}
		return "redirect:/admin/userMangement";
	}
	
	@GetMapping("markUserInterested/{userID}")
	public String markUserInterested(@PathVariable("userID") int userID,HttpSession session) {
		int i = userDao.markUserInterested(userID);
		if(i == 1) {
			session.setAttribute("msg", "User Marked Interested");
		}
		else {
			session.setAttribute("msg", "Some error occured");	
		}
		return "redirect:/admin/userMangement";
	}
	@GetMapping("markUserUninterested/{userID}")
	public String markUserUninterested(@PathVariable("userID") int userID,HttpSession session) {
		int i = userDao.markUserUninterested(userID);
		if(i == 1) {
			session.setAttribute("msg", "User Marked Not Interested");
		}
		else {
			session.setAttribute("msg", "Some error occured");	
		}
		return "redirect:/admin/userMangement";
	}
	@GetMapping("viewUser/{userID}")
	public String viewUser(@PathVariable("userID") int userID,HttpSession session) {
		session.setAttribute("userID", userID);
		return "redirect:/admin/viewUserProfile";
	}
	@GetMapping("viewUserProfile")
	public String viewUserProfile(HttpSession session,Model model) {
		try {
			int userID = (int)session.getAttribute("userID");
			
			 if(userID==0) { throw new Exception(); } 
			 session.removeAttribute("userID");
			 	
			model.addAttribute("userProfile",userDao.getUserProfile(userID));

			model.addAttribute("seminarRegistration",seminarDao.getSeminarListForRegisteratedList(userID));
			model.addAttribute("personalCounselling",timeSlotDao.getAllPersonalCounsellingRequestListByUser(userID));
			
		}catch(Exception e) {
			session.removeAttribute("userID");
			 return "redirect:/admin/userManagement";
		}
		
		return "AdminViewUserProfile";
	}
	
}
