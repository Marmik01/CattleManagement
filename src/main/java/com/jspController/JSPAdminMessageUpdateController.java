package com.jspController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.CounsellingCancellationMessageBean;
import com.bean.CounsellingRegistrationBean;
import com.bean.SeminarRegistrationMailBean;
import com.dao.CounsellingCancellationMailDao;
import com.dao.CounsellingRegistrationMailDao;
import com.dao.SeminarRegistrationMailDao;

@Controller
@RequestMapping("/admin")
public class JSPAdminMessageUpdateController {
	
	@Autowired
	SeminarRegistrationMailDao seminarRegistrationMailDao;
	
	@Autowired
	CounsellingRegistrationMailDao counsellingRegistrationMailDao;
	
	@Autowired
	CounsellingCancellationMailDao counsellingCancellationMailDao;
	
	@GetMapping("/messageTemplates")
	public String getMessagesTemplates(Model model,HttpSession session) {
		String  msg = null;
		try{
			msg = (String)session.getAttribute("msg");
		}
		catch(Exception e) {
			
		}
		model.addAttribute("semianrRegistration",seminarRegistrationMailDao.getMessage());
		model.addAttribute("counsellingRegistration",counsellingRegistrationMailDao.getMessage());
		model.addAttribute("counsellingCancellation",counsellingCancellationMailDao.getMessage());
		session.removeAttribute("msg");
		model.addAttribute("msg",msg);
		return "AdminMessageTemplate";
	}
	
	@PostMapping("/updateSeminarRegistrationMessage")
	public String updateSeminarRegistrationMessage(SeminarRegistrationMailBean seminarRegistrationMailBean,HttpSession session) {
		int i = seminarRegistrationMailDao.updateMessage(seminarRegistrationMailBean);
		if(i==1) {
			session.setAttribute("msg", "Updated Seminar Registration Message Succesfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/messageTemplates";
	}
	
	@PostMapping("/updateCounsellingRegistrationMessage")
	public String updateCounsellingRegistrationMessage(CounsellingRegistrationBean counsellingRegistrationBean,HttpSession session) {
		int i = counsellingRegistrationMailDao.updateMessage(counsellingRegistrationBean);
		if(i==1) {
			session.setAttribute("msg", "Updated Counselling Registration Message Succesfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/messageTemplates";
	}
	@PostMapping("/updateCounsellingCancellationMessage")
	public String updateCounsellingCancellationMessage(CounsellingCancellationMessageBean counsellingRegistrationMailBean,HttpSession session) {
		int i = counsellingCancellationMailDao.updateMessage(counsellingRegistrationMailBean);
		if(i==1) {
			session.setAttribute("msg", "Updated Counselling Cancelling Message Succesfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/messageTemplates";
	}
}
