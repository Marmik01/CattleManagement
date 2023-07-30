package com.jspController;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.VideoBean;
import com.dao.VideoDao;

@Controller
@RequestMapping("/admin")
public class JSPAdminVideoController {
	
	@Autowired
	VideoDao videoDao;
	
	@GetMapping("/videoManagement")
	public String getVideoMangement(HttpSession session,Model model){
		String  msg = null;
		try{
			msg = (String)session.getAttribute("msg");
			model.addAttribute("msg",msg);
			session.removeAttribute("msg");			
		}
		catch(Exception e) {
			
		}
		model.addAttribute("videoList",videoDao.getAllVideo());
		return "AdminVideoManagement";
	}
	@GetMapping("/addVideo")
	public String addVideo(Model model,HttpSession session) {
		try {
			VideoBean video = (VideoBean)session.getAttribute("video");
			if(video==null) {
				model.addAttribute("video",new VideoBean());		
			}
			else {
				model.addAttribute("video", video);					
			}
			session.removeAttribute("video");
		}
		catch(Exception e){
			model.addAttribute("video",new VideoBean());				
		}
		return "AdminAddVideo";
	}
	
	@PostMapping("/addVideo")
	public String addSeminarMethod(VideoBean videoBean,HttpSession session) {
		videoBean.setVideoYoutubeLink(videoBean.getVideoYoutubeLink().replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/"));
		
		int i = videoDao.addVideo(videoBean);
		if(i == 1) {
			session.setAttribute("msg", "Added Video Successfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/videoManagement";
	}
	@GetMapping("/editVideo/{videoID}")
	public String editVideo(Model model,@PathVariable("videoID") int videoID,HttpSession session) {
		VideoBean video = videoDao.getVideoByID(videoID);
		
		if(video != null) {
			session.setAttribute("video",video);
			
		}else {
			model.addAttribute("msg","Invalid Video Accesss");
			return "redirect:/admin/videoManagement";
		}
		return "redirect:/admin/addVideo";
	}
	@GetMapping("/deactivateVideo/{videoID}")
	public String deactivateVideo(Model model,@PathVariable("videoID") int videoID,HttpSession session) {
		int i = videoDao.deactivateVideo(videoID);
		if(i == 1) {
			session.setAttribute("msg", "Deactivated Video Successfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/videoManagement";
	}
	@GetMapping("/activateVideo/{videoID}")
	public String activateVideo(Model model,@PathVariable("videoID") int videoID,HttpSession session) {
		int i = videoDao.activateVideo(videoID);
		if(i == 1) {
			session.setAttribute("msg", "Activated Video Successfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/videoManagement";
	}
	
	@PostMapping("/updateVideo")
	public String editSeminarMethod(VideoBean videoBean,HttpSession session) {
		videoBean.setVideoYoutubeLink(videoBean.getVideoYoutubeLink().replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/"));
		
		int i = videoDao.updateVideo(videoBean);
		if(i == 1) {
			session.setAttribute("msg", "Edited Video Successfully");
		}
		else {
			session.setAttribute("msg", "Some error occured");
		}
		return "redirect:/admin/videoManagement";
	}
}
