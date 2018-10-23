package com.soap.spring.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.product.dto.ProductDto;
import com.soap.spring.users.usersDto.UsersDto;

public interface AdminService {
	public void getList(ModelAndView mView);
	public void insert(UsersDto dto);
	public void getOrderList(ModelAndView mView);
	public void getOrderDetail(HttpServletRequest request, ModelAndView mView);
	public void getProductList(ModelAndView mView);
	public void newOrderList(ModelAndView mView);
	public void ProductInsert(ProductDto dto, HttpServletRequest request);
	public void getProductInfo(ProductDto dto, HttpServletRequest request, ModelAndView mav);
	public void ProductUpdate(ProductDto dto, HttpServletRequest request);
}
