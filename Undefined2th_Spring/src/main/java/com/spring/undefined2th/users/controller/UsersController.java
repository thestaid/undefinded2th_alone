package com.spring.undefined2th.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.undefined2th.users.dto.UsersDto;
import com.spring.undefined2th.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	//로그인 처리
	@RequestMapping("/users/signin")
	public ModelAndView signIn(HttpSession session,@ModelAttribute UsersDto dto, @RequestParam String uri){
		boolean isValid=usersService.isValid(dto);
		ModelAndView mView=new ModelAndView();
		if(isValid){//아이디 비번이 맞으면
			//로그인 처리를 해준다.
			session.setAttribute("id", dto.getId());
			mView.addObject("alertMess", dto.getId()+"님이 로그인 되었습니다.");
			mView.addObject("redirectUri", "/home.do");
			
		}else{
			//아이디 혹은 비밀번호가 틀리다는 정보를 응답한다.
			mView.addObject("alertMess", "아이디 혹은 비밀번호가 틀려요");
			mView.addObject("redirectUri", "/home.do");
		}
		// alert창으로 보낸다.
		mView.setViewName("alert");
		return mView;
	}
}
