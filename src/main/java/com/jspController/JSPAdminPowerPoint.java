package com.jspController;


import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.bean.PowerPointBean;
import com.bean.PowerPointKeyword;
import com.dao.PowerPointDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.service.GoogleDriveService;

@RequestMapping("/admin")
@Controller
public class JSPAdminPowerPoint {
	@Autowired
	GoogleDriveService googleDriveService;
	
	@Autowired
	PowerPointDao powerPointDao;
	
	@GetMapping("/seminarResources")
	public String getVideoMangement(HttpSession session,Model model){
		String  msg = null;
		try{
			msg = (String)session.getAttribute("msg");
			model.addAttribute("msg",msg);
			session.removeAttribute("msg");			
		}
		catch(Exception e) {
			
		}
		model.addAttribute("pptList",powerPointDao.getAllPowerPoints());
		return "AdminPowerPointManagement";
	}
	@GetMapping("/addPowerPointPresentation")
	public String addPowerPointPresentation() {
		return "AdminAddPowerPoint";
	}
	@PostMapping("/addPowerPointPresentation")
	public String addPowerPointPresentation(PowerPointBean powerPointBean,HttpSession session,@RequestParam("presentationFile") MultipartFile file){
		powerPointBean.setPptActive(true);
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
	   	Timestamp cTime = Timestamp.valueOf(ct);
	   	powerPointBean.setAddedAt(cTime);
	   	String id = googleDriveService.upLoadFile(file, "presentation");
	   	powerPointBean.setPptURL("https://drive.google.com/uc?export=view&id="+id);
	   	int i = powerPointDao.addPresentation(powerPointBean);
	   	if (i == 1) {
	   		session.setAttribute("msg", "Added Power Point Presentation Successfully");
	   	}
	   	else {
	   		session.setAttribute("msg", "Some Error Occured");		   		
	   	}
		return "redirect:/admin/seminarResources";
	}
	@GetMapping("activatePPT/{pptID}")
	public String activatePPT(@PathVariable("pptID") int pptID, HttpSession session) {
		if(powerPointDao.activatePPT(pptID)) {
			session.setAttribute("msg", "Activated Presentation Successfully");
		}else {
			session.setAttribute("msg", "Some Error Occured");				
		}
		return "redirect:/admin/seminarResources";
	}
	@GetMapping("deactivatePPT/{pptID}")
	public String deActivatePPT(@PathVariable("pptID") int pptID, HttpSession session) {
		if(powerPointDao.deactivatePPT(pptID)) {
			session.setAttribute("msg", "Deactivated Presentation Successfully");
		}else {
			session.setAttribute("msg", "Some Error Occured");				
		}
		return "redirect:/admin/seminarResources";
	}
	@GetMapping("editPPT/{pptID}")
	public String editPPT(@PathVariable("pptID") int pptID, HttpSession session) {
		session.setAttribute("powerPoint",powerPointDao.getPowerPointDetailsByID(pptID));
		
		return "redirect:/admin/editPPTJSP";
	}
	@GetMapping("/editPPTJSP")
	public String editPPTJSP(Model model,HttpSession session){
		try {
			PowerPointBean ppt = (PowerPointBean)session.getAttribute("powerPoint");
			if(ppt==null) {
				throw new Exception();
			}
			
			model.addAttribute("powerPoint",ppt);
			
		}catch(Exception e) {
			session.removeAttribute("powerPoint");
			return "redirect:/admin/seminarResources";
		}
		session.removeAttribute("powerPoint");
		return "AdminEditPowerPoint";
	}
	
	@PostMapping("/editPowerPointPresentation")
	public String editPowerPointPresentation(PowerPointBean powerPointBean,HttpSession session,@RequestParam("presentationFile") MultipartFile file){
		powerPointBean.setPptActive(true);
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
	   	Timestamp cTime = Timestamp.valueOf(ct);
	   	powerPointBean.setAddedAt(cTime);
	   	if(!file.isEmpty()) {
	   		String id = googleDriveService.upLoadFile(file, "presentation");
		   	powerPointBean.setPptURL("https://drive.google.com/uc?export=view&id="+id);		   		
	   	}
	   	int i = powerPointDao.updatePresentation(powerPointBean);
	   	if (i == 1) {
	   		session.setAttribute("msg", "Updated Power Point Presentation Successfully");
	   	}
	   	else {
	   		session.setAttribute("msg", "Some Error Occured");		   		
	   	}
		return "redirect:/admin/seminarResources";
	}
	
	@GetMapping("manageKeywords/{pptID}")
	public String manageKeywords(@PathVariable("pptID") int pptID, HttpSession session) throws JsonProcessingException {
		session.setAttribute("pptID", pptID);
		return "redirect:/admin/editPPTKeyword";
	}
	@GetMapping("/editPPTKeyword")
	public String editPPTKeyword(Model model,HttpSession session){
		try {
			
			int pptID = (int)session.getAttribute("pptID");
			if(pptID==0) {
				throw new Exception();
			}
			model.addAttribute("pptID",pptID);
			
		}catch(Exception e) {
			session.removeAttribute("pptID");
			return "redirect:/admin/seminarResources";
		}
		session.removeAttribute("pptID");
		return "AdminEditKeyword";
	}
	
	@PostMapping("/addKeyword")
	public @ResponseBody String addKeyword(PowerPointKeyword powerPointKeyword){
		int i = powerPointDao.addKeyword(powerPointKeyword);
		return String.valueOf(i);
	}
	@PostMapping("/removeKeyword")
	public @ResponseBody String removeKeyword(PowerPointKeyword powerPointKeyword){
		int i = powerPointDao.removeKeyword(powerPointKeyword);
		return String.valueOf(i);
	}
	
	@GetMapping("/getKeywords")
	public @ResponseBody List<String> getKeyword(@RequestParam("pptID") int pptID) throws JsonProcessingException{
		return powerPointDao.getPowerPointKeywords(pptID);
	}
}
