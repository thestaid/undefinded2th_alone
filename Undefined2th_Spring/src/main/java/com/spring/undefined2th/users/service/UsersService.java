package com.spring.undefined2th.users.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.spring.undefined2th.users.dto.UsersDto;

public interface UsersService {
	public boolean insert(UsersDto dto);
	public boolean isValid(UsersDto dto);
	public ModelAndView getData(String id);
	public ModelAndView getList();
	public boolean update(UsersDto dto);
	public boolean delete(String id);
	public Map<String, Object> canUseId(String id);
}
