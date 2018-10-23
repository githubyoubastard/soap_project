package com.soap.spring.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.cart.service.CartSercie;
import com.soap.spring.product.dto.ProductDto;
import com.soap.spring.product.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private CartSercie Cservice;

	//카트에 담은 리스트 보여주기
	 @RequestMapping("/product/cart")
	 public ModelAndView showCart(ModelAndView mav, HttpServletRequest request) {
	  Cservice.getList(request, mav);
	  mav.setViewName("product/cart");
	  return mav;
	 }
	
	/*상품 추가폼*/
	@RequestMapping("/product/insertform")
	public ModelAndView inserform() {
		return new ModelAndView("product/insertform_admin");
	}
	/*상품 추가하기*/
	@RequestMapping("/product/insert")
	public ModelAndView insert(@ModelAttribute ProductDto dto, HttpServletRequest request) {
		service.insert(dto, request);
		return new ModelAndView("product/insert_admin");
	}
	
	/*상품 리스트 목록*/
	@RequestMapping("/product/list")
	public ModelAndView showList(ModelAndView mav) {
		service.getList(mav);
		mav.setViewName("product/list");
		return mav;
	}
	@RequestMapping("/product/detail")
	public ModelAndView detail(@RequestParam int num, ProductDto dto, HttpServletRequest request,  ModelAndView mav) {
		service.detail(dto, request, mav);
		mav.setViewName("product/detail");
		return mav;
	}
	@RequestMapping("/product/detail_admin")
	public ModelAndView detail_admin(@RequestParam int num, ProductDto dto, HttpServletRequest request,  ModelAndView mav) {
		service.detail(dto, request, mav);
		mav.setViewName("product/detail_admin");
		return mav;
	}
	@RequestMapping("/product/updateform")
	public ModelAndView updateform(@RequestParam int num, ProductDto dto, HttpServletRequest request, ModelAndView mav) {
		service.detail(dto, request, mav);
		mav.setViewName("product/updateform_admin");
		return mav;
	}
	@RequestMapping("/product/update")
	public ModelAndView update(@ModelAttribute ProductDto dto, HttpServletRequest request) {
		System.out.println("update controller ");
		ModelAndView mav=new ModelAndView();
		service.update(dto, request);
		mav.setViewName("redirect:/product/detail.do?num="+dto.getNum());
		return mav;
	}
	@RequestMapping("/product/delete")
	public ModelAndView delete(@RequestParam int num, ModelAndView mav) {
		service.delete(num);
		mav.setViewName("redirect:/product/list.do");
		return mav;
	}
}
