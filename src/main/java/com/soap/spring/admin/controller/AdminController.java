package com.soap.spring.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.admin.service.AdminService;
import com.soap.spring.product.dto.ProductDto;
import com.soap.spring.users.usersDto.UsersDto;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/index.do")
	public String AdminIndex() {
		return "admin/index";
	}
	
	// 관리자 목록보기 요청
	@RequestMapping("/admin/admin/adminList.do")
	public ModelAndView AdminList(ModelAndView mView) {
		service.getList(mView);
		mView.setViewName("admin/admin/adminList");
		return mView;
	}
	
	// 관리자 추가 가입 요청
	@RequestMapping("/admin/admin/A_insertForm.do")
	public String AInsertForm() {;
		return "admin/admin/A_insertForm";
	}
	
	// 관리자 가입 요청
	@RequestMapping("/admin/admin/insert.do")
	public String insert(UsersDto dto) {
		service.insert(dto);
		return "redirect:adminList.do";
	}
	
	// 상품 관리 페이지 요청
	@RequestMapping("/admin/order/orderIndex.do")
	public ModelAndView OrderIndex(ModelAndView mView) {
		service.getOrderList(mView);
		mView.setViewName("admin/order/orderIndex");
		return mView;	
	}

	// 새주문 목록 페이지 요청
	@RequestMapping("admin/order/newOrderList.do")
	public ModelAndView newOrderList(ModelAndView mView) {
		service.newOrderList(mView);
		mView.setViewName("admin/order/newOrderList");
		return mView;
	}
	
	// 주문 상세페이지 요청
	@RequestMapping("/admin/order/orderDeatil.do")
	public ModelAndView OrderDetail(HttpServletRequest request, ModelAndView mView) {
		service.getOrderDetail(request, mView);
		mView.setViewName("admin/order/orderDetail");
		return mView;
	}
	
	// 상품 목록 페이지 요청
	@RequestMapping("/admin/product/productList.do")
	public ModelAndView ProductList(ModelAndView mView) {
		System.out.println("상품 리스트 컨트롤러입니다.");
		service.getProductList(mView);
		mView.setViewName("admin/product/productList");
		return mView;
	}
	
	// 상품 추가 폼 요청
	@RequestMapping("/admin/product/insertform.do")
	public String inserform() {
		return "admin/product/insertform";
	}
	
	// 상품 추가 요청
	@RequestMapping("/admin/product/insert.do")
	public ModelAndView insert(@ModelAttribute ProductDto dto, HttpServletRequest request) {
		service.ProductInsert(dto, request);
		return new ModelAndView("redirect:productList.do");
	}
	
	// 상품 수정 폼 요청
	@RequestMapping("/admin/product/updateform.do")
	public ModelAndView updateform(@RequestParam int num, ProductDto dto, HttpServletRequest request, ModelAndView mav) {
		service.getProductInfo(dto, request, mav);
		mav.setViewName("admin/product/updateform");
		return mav;
	}
	
	// 상품 수정 요청
	@RequestMapping("/admin/product/update.do")
	public ModelAndView update(@ModelAttribute ProductDto dto, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		service.ProductUpdate(dto, request);
		mav.setViewName("redirect:productList.do");
		return mav;
	}
}
