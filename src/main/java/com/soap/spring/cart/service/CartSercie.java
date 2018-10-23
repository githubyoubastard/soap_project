package com.soap.spring.cart.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.cart.dto.CartDto;

public interface CartSercie {
	public void insert(CartDto dto, HttpServletRequest request);
	public void getData(CartDto dto);
	public void getList(HttpServletRequest request, ModelAndView mav);
}
