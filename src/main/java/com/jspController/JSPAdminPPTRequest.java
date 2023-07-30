package com.jspController;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.NoteBean;
import com.bean.PowerPointKeyword;
import com.bean.PowerPointRequest;
import com.bean.UserBean;
import com.dao.PowerPointRequestDao;
import com.dao.UserDao;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.service.FirebaseMessagingService;

@RequestMapping("/admin")
@Controller
public class JSPAdminPPTRequest {
	
	@Autowired
	PowerPointRequestDao powerPointRequest;
	
	@Autowired
	FirebaseMessagingService firebaseMessagingService;
	
	@Autowired
	UserDao userDao;
	
	@GetMapping("/pptRequest")
	public String pptRequest(Model model,HttpSession session) {
		try{
			String msg =(String) session.getAttribute("msg");
			model.addAttribute("msg",msg);
			session.removeAttribute("msg");
		}catch(Exception e) {
			session.removeAttribute("msg");
		}
		model.addAttribute("requestList",powerPointRequest.getAllRequest());
		return "AdminPowerPointRequest";
	}
	
	@PostMapping("/updateComment")
	public @ResponseBody String removeKeyword(@RequestParam("requestID") int requestID, 
			@RequestParam("comment") String comment){
		int i = powerPointRequest.updateComment(requestID,comment);
		PowerPointRequest request = powerPointRequest.getRequestByID(requestID);
		UserBean user = userDao.getUserByID(request.getUserID());
		NoteBean note = new NoteBean();
		Map<String,String> map = new HashMap<String,String>();
		map.put("title", "Royal Counselling App");
		map.put("message", "Your presentation request :"+request.getRequestQuery()+" updated. Please check your presentation from where you had requested for your presentation.");
		map.put("click_action", "pptRequest");
		note.setContent("Your presentation request : "+request.getRequestQuery()+" updated. Please check your presentation from where you had requested for your presentation.");
		note.setData(map);
		note.setSubject("Royal Counselling App");
		try {
			firebaseMessagingService.sendNotification(note, user.getTokenID());
		} catch (FirebaseMessagingException e) {
			e.printStackTrace();
		}
		return String.valueOf(i);
	}
	
	@GetMapping("closePPTRequestQuery/{requestID}")
	public String closePPTRequestQuery(@PathVariable("requestID") int requestID,HttpSession session) {
		int i = powerPointRequest.closePPTRequestQuery(requestID);
		PowerPointRequest request = powerPointRequest.getRequestByID(requestID);
		UserBean user = userDao.getUserByID(request.getUserID());
		if(i == 1) {
			session.setAttribute("msg", "Deactivated the query successfully");			
			NoteBean note = new NoteBean();
			Map<String,String> map = new HashMap<String,String>();
			map.put("title", "Royal Counselling App");
			map.put("message", "Your presentation request :"+request.getRequestQuery()+" is closed by Admin. Please check your presentation from where you had requested for your presentation.");
			map.put("click_action", "pptRequest");
			note.setContent("Your presentation request :"+request.getRequestQuery()+" is closed by Admin. Please check your presentation from where you had requested for your presentation.");
			note.setData(map);
			note.setSubject("Royal Counselling App");
			try {
				firebaseMessagingService.sendNotification(note, user.getTokenID());
			} catch (FirebaseMessagingException e) {
				e.printStackTrace();
			}
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/pptRequest";
	}
	
	
}
