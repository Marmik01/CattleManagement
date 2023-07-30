package com.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bean.PowerPointBean;
import com.bean.PowerPointRequest;
import com.bean.ResponseBean;
import com.bean.ResponseBeanWithList;
import com.bean.UserBean;
import com.dao.PowerPointDao;
import com.dao.PowerPointRequestDao;
import com.dao.UserDao;

/*
 * select distinct pptid,filename,ppturl,pptactive,addedat from 
 * pptkeywordtable join powerpointtable using (pptid) where 
 * keyword like any(array['%work%']) and pptactive = true order by pptid
 */
@RestController
public class PowerPointController {
	
	@Autowired
	PowerPointDao powerPointDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	PowerPointRequestDao powerPointRequestDao;
	
	@GetMapping("/getAllPowerPoint")
	public ResponseBeanWithList<PowerPointBean> getAllPowerPoint(){
		ResponseBeanWithList<PowerPointBean> rb = new ResponseBeanWithList<PowerPointBean>();
		rb.setStatus(200);
		rb.setMessage("Fetch Data Successfully");
		rb.setData(powerPointDao.getAllActivePowerPoints());
		return rb;
	}
	@PostMapping("/getAllSearchedPPT")
	public ResponseBeanWithList<PowerPointBean> getAllSearchedPPT(@RequestParam("searchQuery") String search){
		ResponseBeanWithList<PowerPointBean> rb = new ResponseBeanWithList<PowerPointBean>();
		search = search.replaceAll("[^a-zA-Z0-9]", " ");
		search = search.replaceAll("\\s{2,}", " ").trim();
		String[] words = search.split(" ");
		for (int i = 0;i<words.length;i++) {
			words[i] = '%'+words[i]+'%';
		}
		rb.setStatus(200);
		rb.setMessage("Fetch Data Successfully");
		rb.setData(powerPointDao.getAllActiveSearchedPowerPoints(words));
		return rb;
	}
	
	@PostMapping("/requestPowerPoint")
	public ResponseBean<PowerPointRequest> requestPowerPoint(PowerPointRequest powerPointRequest)
	{
		UserBean userBean = userDao.getUserByEmailID(powerPointRequest.getEmailID());
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
		powerPointRequest.setRequestAt(Timestamp.valueOf(ct));
		powerPointRequest.setQueryOver(false);		
		ResponseBean<PowerPointRequest> rb = new ResponseBean<PowerPointRequest>();		
		if(userBean!= null) {			
			powerPointRequest.setUserID(userBean.getUserID());
			powerPointRequest.setFirstName(userBean.getFirstName());
			powerPointRequest.setLastName(userBean.getLastName());
			powerPointRequest.setPhoneNumber(userBean.getPhoneNumber());
			int i = powerPointRequestDao.insertRequest(powerPointRequest);
			if(i==1) {
				rb.setStatus(200);
				rb.setMessage("Valid Request");									
			}
			else {
				rb.setStatus(200);
				rb.setMessage("Some error occured");													
			}
		}
		else {
			rb.setMessage("Invalid Request");
			rb.setStatus(200);
		}
		rb.setData(powerPointRequest);		
		return rb;
	}
	@GetMapping("/powerPointRequestUserWise/{emailID}")
	public ResponseBeanWithList<PowerPointRequest> powerPointRequestUserWise(@PathVariable("emailID") String emailID)
	{
		UserBean userBean = userDao.getUserByEmailID(emailID);
		ResponseBeanWithList<PowerPointRequest> rb = new ResponseBeanWithList<PowerPointRequest>();		
		if(userBean!= null) {			
			rb.setData(powerPointRequestDao.getAllRequestUserSpecific(userBean.getUserID()));
			rb.setStatus(200);			
		}
		else {
			rb.setMessage("Invalid Request");
			rb.setStatus(200);
		}
		return rb;
	}
	
}
