package com.jspController;

import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.text.StrSubstitutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.BookedTimeSlotBean;
import com.bean.BookingTimeSlotBean;
import com.bean.CounsellingCancellationMessageBean;
import com.bean.CounsellingRegistrationBean;
import com.bean.NoteBean;
import com.bean.TimeSlotBean;
import com.bean.UserBean;
import com.dao.CounsellingCancellationMailDao;
import com.dao.CounsellingRegistrationMailDao;
import com.dao.LinkDao;
import com.dao.TimeSlotDao;
import com.dao.UserDao;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.service.EmailService;
import com.service.FirebaseMessagingService;
import com.service.WhatsappService;

@Controller
@RequestMapping("/admin")
public class JSPAdminPersonalCounsellingController {
	
	@Autowired
	LinkDao linkDao;
	
	@Autowired
	TimeSlotDao timeSlotDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	CounsellingRegistrationMailDao counsellingRegistrationMailDao;
	
	@Autowired
	CounsellingCancellationMailDao counsellingCancellationMessageDao;
	
	@Autowired
	WhatsappService whatsappService;
	
	@Autowired
	EmailService emailService;
	
	/*
	 * @Autowired MessageService messageService;
	 */
	
	@Autowired
	FirebaseMessagingService firebaseMessagingService;
	
	@GetMapping("/personalCounselling")
	public String getPersonalCounselling(HttpSession session,Model model) {
		String  msg = null;
		try{
			msg = (String)session.getAttribute("msg");
		}
		catch(Exception e) {			
		}
		session.removeAttribute("msg");
		model.addAttribute("msg",msg);
		return "AdminPersonalCounselling";
	}
	
	@PostMapping("/addTimeSlot")
	public String addTimeSlot(TimeSlotBean timeSlotBean,HttpSession session) {
		timeSlotBean.setLink(linkDao.getAllLinks().get(0).getCounsellingLink());
		int i = timeSlotDao.inserTimeSlot(timeSlotBean);
		if(i==1) {
			session.setAttribute("msg", "Added Time Slot Successfully");
		}
		else {
			session.setAttribute("msg", "Error Occured");
		}
		return "redirect:/admin/personalCounselling";
	}
	@GetMapping("/getAllCounsellingSlots")
	public @ResponseBody List<BookedTimeSlotBean> getAllCounsellingSlots() {
		List<BookedTimeSlotBean> data = timeSlotDao.getAllCounsellingSlotsOfThisMonth();
		return data;
	}
	@GetMapping("/bookedSlots")
	public String bookedSlots(Model model) {
		model.addAttribute("bookedList", timeSlotDao.getAllBookedCounsellingSlots());
		return "AdminPersonalCounsellingBookedSlot";
	}
	@GetMapping("/viewBookingSlotRequest")
	public String viewBookingSlotRequest(Model model,HttpSession session) {
		String msg = null;
		try {
			msg = (String)session.getAttribute("msg");
			model.addAttribute("msg",msg);
		}catch(Exception e) {
			
		}
		session.removeAttribute("msg");
		model.addAttribute("bookingList", timeSlotDao.getAllPersonalCounsellingRequestList());
		return "AdminPersonalCounsellingBookingSlot";
	}
	
	@GetMapping("/approveAppointment/{userID}/{personalCID}/{timeSlotID}")
	public String approveAppointment(HttpSession session,@PathVariable("userID") int userID,@PathVariable("personalCID") int personalCID,
			@PathVariable("timeSlotID") int timeSlotID) {
		TimeSlotBean timeSlotBean = timeSlotDao.getTimeSlotByID(timeSlotID);
		UserBean user = userDao.getUserByID(userID);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm a");			
		try {
			int updateBookingRequestUser =  timeSlotDao.updateBookingRequestUser(personalCID,userID,timeSlotID);
			int updateBookingRequest = timeSlotDao.updateBookingRequest(userID,timeSlotID);
			if(updateBookingRequestUser  == 1 && updateBookingRequest==1) {
				CounsellingRegistrationBean message = counsellingRegistrationMailDao.getMessage();
				Map<String, String> values = new HashMap<String, String>();
				values.put("user name", user.getFirstName() + " " + user.getLastName());
				values.put("time slot id", String.valueOf(timeSlotBean.getTimeSlotID()));
				values.put("counselling date",timeSlotBean.getStartTime().format(formatter));
				values.put("type", timeSlotBean.getCounsellingType());
				
				if(timeSlotBean.getCounsellingType().equals("Offline")) {
					values.put("link","Not Applicable");
				}
				else {
					values.put("link",timeSlotBean.getLink());
				}
				StrSubstitutor sub = new StrSubstitutor(values, "%(", ")");
				message.setBody(sub.replace(message.getBody()));
				message.setSubject(sub.replace(message.getSubject()));
				whatsappService.sendMessage(user, message.getBody());
			//	messageService.sendSms(user, message.getBody());
				emailService.sendMessage(user,message.getBody(),message.getSubject());
				NoteBean note = new NoteBean();
				Map<String,String> map = new HashMap<String,String>();
				map.put("title", "Royal Counselling App");
				map.put("message", "Your counselling request for "+timeSlotBean.getStartTime().format(formatter)+" is confirmed. Mode of counselling "+timeSlotBean.getCounsellingType());
				map.put("click_action", "counsellingRequest");
				note.setContent("Your counselling request for "+timeSlotBean.getStartTime().format(formatter)+" is confirmed. Mode of counselling "+timeSlotBean.getCounsellingType());
				note.setData(map);
				note.setSubject("Royal Counselling App");
				try {
					firebaseMessagingService.sendNotification(note, user.getTokenID());
				} catch (FirebaseMessagingException e) {
					e.printStackTrace();
				}

				session.setAttribute("msg", "Successfully Approved Appointment");					
			}else {
				session.setAttribute("msg", "Some error Occured");				
			}
			
		}catch(Exception e) {
			
		}
		return "redirect:/admin/viewBookingSlotRequest";
	}
	
	@GetMapping("/cancelAppointment/{timeSlotID}")
	public String cancelAppointment(@PathVariable("timeSlotID") int timeSlotID,HttpSession session) {
		int i = 0;
		TimeSlotBean timeSlotBean = timeSlotDao.getTimeSlotByID(timeSlotID);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm a");
		if(timeSlotBean.isBooked()) {
			BookingTimeSlotBean bookingTimeSlotBean = timeSlotDao.getPersonalCounsellingBooked(timeSlotID);
			UserBean user = userDao.getUserByID(bookingTimeSlotBean.getUserID());
			CounsellingCancellationMessageBean message = counsellingCancellationMessageDao.getMessage();
			Map<String, String> values = new HashMap<String, String>();
			values.put("user name", bookingTimeSlotBean.getFirstName() + " " + bookingTimeSlotBean.getLastName());
			values.put("time slot id", String.valueOf(timeSlotBean.getTimeSlotID()));
			values.put("counselling date",timeSlotBean.getStartTime().format(formatter));
			values.put("type", bookingTimeSlotBean.getCounsellingType());
			
			StrSubstitutor sub = new StrSubstitutor(values, "%(", ")");
			message.setBody(sub.replace(message.getBody()));
			message.setSubject(sub.replace(message.getSubject()));
			whatsappService.sendMessage(user, message.getBody());
		//	messageService.sendSms(user, message.getBody());
			emailService.sendMessage(user,message.getBody(),message.getSubject());
			NoteBean note = new NoteBean();
			Map<String,String> map = new HashMap<String,String>();
			map.put("title", "Royal Counselling App");
			map.put("message", "Your counselling request for "+timeSlotBean.getStartTime().format(formatter)+" is cancelled due to some unavoidable circumstances. Please reschedule using the application as per your convenience and available time slot. Sorry for inconvience.");
			map.put("click_action", "counsellingRequest");
			note.setContent("Your counselling request for "+timeSlotBean.getStartTime().format(formatter)+" is cancelled due to some unavoidable circumstances. Please reschedule using the application as per your convenience and available time slot. Sorry for inconvience.");
			note.setData(map);
			note.setSubject("Royal Counselling App");
			try {
				firebaseMessagingService.sendNotification(note, user.getTokenID());
			} catch (FirebaseMessagingException e) {
				e.printStackTrace();
			}
			i = timeSlotDao.cancelBookedAppointment(timeSlotID);			
		}else {			
			i = timeSlotDao.cancelNonBookedAppointment(timeSlotID);			
		}
		if(i == 1) {
			session.setAttribute("msg", "Deleted Appointment Successfully");
		}else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/personalCounselling";
	}
	
}

