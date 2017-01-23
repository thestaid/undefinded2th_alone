package com.spring.undefined2th.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.undefined2th.users.dto.UsersDto;
import com.spring.undefined2th.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/users/signin")
	public ModelAndView signIn(@ModelAttribute UsersDto dto){
		
		return null;
	}
}
