package com.soap.spring.users.usersDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soap.spring.users.usersDto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	@Autowired
	private SqlSession session;

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto=session.selectOne("users.getData", id);
		return dto;
	}

	@Override
	public boolean canUseId(String id) {
		String result=session.selectOne("users.isExist", id);
		if(result==null) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void resetPwd(UsersDto dto) {
		session.update("users.resetPwd", dto);
	}

	@Override
	public void updateProFile(UsersDto dto) {
		session.update("users.updateProFile", dto);
	}
}
