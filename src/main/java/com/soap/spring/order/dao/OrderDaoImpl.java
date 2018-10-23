package com.soap.spring.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.users.usersDto.UsersDto;

@Repository
public class OrderDaoImpl implements OrderDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<OrderDto> getOrderList() {
		List<OrderDto> orderList=session.selectList("admin.getOrderList");
		return orderList;
	}

	@Override
	public int getTotalOrderNum() {
		return session.selectOne("admin.getTotalOrderNum");
	}	

	@Override
	public List<OrderDto> getOrderDetail(String order_num) {
		List<OrderDto> orderList=session.selectList("admin.getData",order_num);
		OrderDto dto=orderList.get(0);
		System.out.println("상품번호 : "+dto.getProduct_num());
		System.out.println("상품가격 : "+dto.getProduct_price());
		return orderList;
	}
	
	@Override
	public OrderDto getOrderInfo(String order_num) {
		return session.selectOne("admin.getOrderInfo", order_num);
	}

	@Override
	public OrderDto getOrder(String order_num) {
		return null;
	}

	@Override
	public OrderDto orderform(int num) {
		return session.selectOne("order.orderform", num);
	}

	@Override
	public OrderDto getProductInfo(int num) {
		return session.selectOne("order.getProductInfo",num);
	}

	@Override
	public OrderDto getUserInfo(String id) {
		OrderDto dto = session.selectOne("order.getUserInfo",id);
		return dto;
	}

	@Override
	public String getOrderNum() {
		return session.selectOne("order.getOrderNum");
	}

	@Override
	public void insertOrder(OrderDto dto) {
		session.insert("order.orderInsert",dto);
	}

	@Override
	public void insertOrderDetail(OrderDto dto) {
		System.out.println("지금 넣은 상품의 상품 번호는 : "+dto.getProduct_num());
		session.insert("order.orderDetailInsert",dto);
	}
}
