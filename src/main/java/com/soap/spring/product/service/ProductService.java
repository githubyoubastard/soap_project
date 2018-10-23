package com.soap.spring.product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.product.dto.ProductDto;

public interface ProductService {
	public void insert(ProductDto dto, HttpServletRequest request);
	public void update(ProductDto dto, HttpServletRequest request);
	public void delete(int num);
	public void detail(ProductDto dto, HttpServletRequest request, ModelAndView mav);
	public void getList(ModelAndView mav);
}
