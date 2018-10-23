package com.soap.spring.order.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.order.dto.OrderDto;

public interface OrderService {
	public void orderform(ModelAndView mav, int num, int product_quantity, HttpServletRequest request);
	public void order(OrderDto dto, HttpServletRequest request);
}
