package com.soap.spring.order.dao;

import java.util.List;

import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.users.usersDto.UsersDto;

public interface OrderDao {
	public List<OrderDto> getOrderList();
	public int getTotalOrderNum();
	public List<OrderDto> getOrderDetail(String order_num);
	public OrderDto getOrderInfo(String order_num);
	public OrderDto getOrder(String order_num);
	public OrderDto orderform(int num);
	public OrderDto getProductInfo(int num);
	public OrderDto getUserInfo(String id);
	public String getOrderNum();
	public void insertOrder(OrderDto dto);
	public void insertOrderDetail(OrderDto dto);
}
