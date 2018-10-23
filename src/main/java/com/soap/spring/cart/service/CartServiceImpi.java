package com.soap.spring.cart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.soap.spring.cart.dao.CartDao;
import com.soap.spring.cart.dto.CartDto;

@Service
public class CartServiceImpi implements CartSercie {

	@Autowired
	private CartDao dao;
	
	//상품 카트에 추가하기
	@Override
	public void insert(CartDto dto, HttpServletRequest request) {
		
		String id=(String)request.getSession().getAttribute("id");
		dto.setId(id);
		
		boolean success=dao.checkDouble(dto);
		if(success) {
			dao.insert(dto);
		}else {
			System.out.println("에러!");
		}
	
		

		
	}

	@Override
	public void getData(CartDto dto) {
		
		
	}

	//카트 상품 리스트 가져오기
	@Override
	public void getList(HttpServletRequest request, ModelAndView mav) {
		String id=(String)request.getSession().getAttribute("id");
		List<CartDto> list=dao.getList(id);
		
		mav.addObject("list",list);
		
		
	}





}
