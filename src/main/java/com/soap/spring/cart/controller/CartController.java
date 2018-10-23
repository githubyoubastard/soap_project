package com.soap.spring.cart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soap.spring.cart.dto.CartDto;
import com.soap.spring.cart.service.CartSercie;

@Controller
public class CartController {
	
	@Autowired
	private CartSercie cService;
	
	@RequestMapping("/product/insertcart")
	public String puttoCart(@ModelAttribute CartDto dto, HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		cService.insert(dto, request);
		return "redirect:detail.do?num="+num;
	}
	

	
}
