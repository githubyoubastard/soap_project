package com.soap.spring.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soap.spring.admin.dto.AdminDto;
import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.product.dto.ProductDto;
import com.soap.spring.users.usersDto.UsersDto;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UsersDto> getList() {
		return session.selectList("admin.getList");
	}

	@Override
	public void insert(UsersDto dto) {
		session.insert("admin.insert",dto);
	}

	@Override
	public List<ProductDto> getProductList() {
		return session.selectList("product.getList");
	}

}
