package com.spring.undefined2th;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping("home.do")
	public String home() {
		return "home";
	}
	
}
