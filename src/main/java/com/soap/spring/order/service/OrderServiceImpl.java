package com.soap.spring.order.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.order.dao.OrderDao;
import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.product.dao.ProductDao;
import com.soap.spring.users.usersDao.UsersDao;
import com.soap.spring.users.usersDto.UsersDto;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao oDao;
	@Autowired
	private UsersDao uDao;
	@Autowired
	private ProductDao pDao;

	@Override
	public void orderform(ModelAndView mav, int num, int product_quantity, HttpServletRequest request) {
		String id=(String)request.getSession().getAttribute("id");
		// 상품번호로 상품 정보 가져오기
		OrderDto Pdto=oDao.getProductInfo(num);
		// 상품정보에 수량 넣어주기
		Pdto.setProduct_quantity(product_quantity);
		// 아이디로 유저 정보 가져오기
		OrderDto Udto=oDao.getUserInfo(id);
		
		mav.addObject("Pdto", Pdto);
		mav.addObject("Udto", Udto);
	}

	@Override
	public void order(OrderDto dto, HttpServletRequest request) {
		// 주문번호 가져오기
		String order_num=oDao.getOrderNum();
		// 주문번호 dto에 넣기
		dto.setOrder_num(order_num);
		// 가데이터 넣기!!!!!!!! -- 수정 요망 --
		dto.setOrder_totalPrice(dto.getProduct_price());
		dto.setUser_id((String) request.getSession().getAttribute("id"));
		
		// order 정보 담기
		oDao.insertOrder(dto);
		// orderdetail 정보 담기
		oDao.insertOrderDetail(dto);
	}

}
