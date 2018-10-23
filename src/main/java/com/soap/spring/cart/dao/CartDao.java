package com.soap.spring.cart.dao;



import java.util.List;

import com.soap.spring.cart.dto.CartDto;

public interface CartDao {
	public void insert(CartDto dto);
	public CartDto getData(CartDto dto);
	public boolean checkDouble(CartDto dto);
	public List<CartDto> getList(String id);
	
}
