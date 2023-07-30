package com.jspController;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.AdminBean;
import com.bean.LoginBean;
import com.dao.AdminDao;
import com.service.EmailService;

@Controller
@RequestMapping("/admin")
public class JSPAdminLoginController {
	
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	EmailService emailService;
	
	@GetMapping("/loginForm")
	public String loginForm(Model model,HttpSession session) {
		String message = null;
		try {
			message = (String)session.getAttribute("msg");
		}catch(Exception e) {
			session.removeAttribute("msg");
		}
		session.invalidate();
		model.addAttribute("msg", message);
		return "LoginForm";
	}
	@PostMapping("/loginForm")
	public String loginForm(LoginBean loginBean,HttpSession session,Model model) {
		AdminBean admin  = adminDao.loginAdmin(loginBean);
		if(admin != null) {
			session.setMaxInactiveInterval(300);
			session.setAttribute("adminObject", admin);
			session.setAttribute("userType", "ADMIN");
			session.removeAttribute("msg");
			
			return "redirect:/admin/adminDashboard";
		}
		session.setAttribute("msg", "Invalid Credentials!!!");
		return "redirect:/admin/loginForm";
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPassword() {
		return "ForgotPassword";
	}	
	
	@PostMapping("/forgotPassword")
	public String forgotPassword(@RequestParam("emailID") String emailID,HttpSession session) {
		AdminBean admin = adminDao.getAdminByEmailID(emailID);
		if(admin!=null) {
			emailService.sendMessage(admin, "Your password is : "+admin.getPassword(), "Admin Forgot Password Request");
			session.setAttribute("msg", "Password has been sent on your registerd Email ID");
		}
		else {
			session.setAttribute("msg", "Invalid Email ID");
		}
		return "redirect:/admin/loginForm";
		
	}
	
	@GetMapping("/changePassword")
	public String changePassword() {
		return "ChangePassword"; 
	}
	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("password") String password,HttpSession session) {
		
		try{
			AdminBean admin = (AdminBean) session.getAttribute("adminObject");
			if(admin==null) {
				throw new Exception();
			}
			int i = adminDao.changePassword(password,admin.getEmailID());
			if(i==1) {
				session.setAttribute("msg", "Password Changed");
			}
			else {
				session.setAttribute("msg", "Some error occured");
			}
		}catch(Exception e) {
			session.setAttribute("msg", "Invalid Request");
		}		
		return "redirect:/admin/loginForm";
	}
	@GetMapping("logoutAdmin")
	public String logoutAdmin() {
		return "redirect:/admin/loginForm";
	}

}
