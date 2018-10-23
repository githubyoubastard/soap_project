package com.soap.spring.users.usersDao;

import com.soap.spring.users.usersDto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public void update(UsersDto dto);
	public void delete(String id);
	public UsersDto getData(String id);
	public boolean canUseId(String id);
	public void resetPwd(UsersDto dto);
	public void updateProFile(UsersDto dto);
}
