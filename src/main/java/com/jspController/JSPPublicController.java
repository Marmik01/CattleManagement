package com.jspController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JSPPublicController {
	@GetMapping("/")
	public String defaultString() {
		return "redirect:/admin/loginForm";
	}
	@GetMapping("/admin")
	public String defaultAdminString() {
		return "redirect:/admin/loginForm";
	}


}
