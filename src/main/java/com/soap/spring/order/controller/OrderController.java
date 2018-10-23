package com.soap.spring.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.order.dto.OrderDto;
import com.soap.spring.order.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	
	@RequestMapping("/order/orderpage")
	public ModelAndView orderform(@RequestParam int num, @RequestParam int product_quantity, ModelAndView mav, HttpServletRequest request) {
		service.orderform(mav, num, product_quantity, request);
		mav.setViewName("order/orderpage");
		return mav;
	}
	@RequestMapping("/order/order")
	public String order(@ModelAttribute OrderDto dto, HttpServletRequest request) {
		service.order(dto, request);
		return "/";
	}
}
