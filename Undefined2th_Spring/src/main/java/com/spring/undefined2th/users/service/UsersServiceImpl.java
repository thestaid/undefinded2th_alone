package com.spring.undefined2th.users.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.undefined2th.users.dao.UsersDao;
import com.spring.undefined2th.users.dto.UsersDto;

@Component
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public boolean insert(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isValid(UsersDto dto) {
		return usersDao.isValid(dto);
	}

	@Override
	public ModelAndView getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> canUseId(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
