package com.soap.spring.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soap.spring.cart.dto.CartDto;

@Repository
public class CartDaoImpi implements CartDao {
	
	@Autowired
	private SqlSession session;
	
	//상품 카트에 추가하기
	@Override
	public void insert(CartDto dto) {
		session.insert("cart.insert",dto);
	
	}
	
	//상품 정보 하나 가져오기
	@Override
	public CartDto getData(CartDto dto) {
		return session.selectOne("cart.getData", dto);
	}
	
	//같은 상품이 카트에 들어갔는지 체크하기
	@Override
	public boolean checkDouble(CartDto dto) {
		CartDto resultDto=session.selectOne("cart.checkDouble", dto);
		if(resultDto==null) {
			System.out.println("true!!");
			return true;
		}else {
			System.out.println("false");
			return false;
		}
	}
	@Override
	public List<CartDto> getList(String id) {
		return session.selectList("cart.getList", id);
	}




}
