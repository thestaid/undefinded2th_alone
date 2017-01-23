package com.spring.undefined2th.users.dao;

import java.util.List;

import com.spring.undefined2th.users.dto.UsersDto;


public interface UsersDao {
	public boolean insert(UsersDto dto);
	public boolean isValid(UsersDto dto);
	public UsersDto getData(String id);
	public List<UsersDto> getList();
	public boolean update(UsersDto dto);
	public boolean delete(String id);	
	public boolean canUseId(String id); 
}
