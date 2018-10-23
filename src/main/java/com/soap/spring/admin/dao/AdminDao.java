package com.soap.spring.admin.dao;

import java.util.List;

import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.product.dto.ProductDto;
import com.soap.spring.users.usersDto.UsersDto;

public interface AdminDao {
	public List<UsersDto> getList();
	public void insert(UsersDto dto);
	public List<ProductDto> getProductList();
	
}
