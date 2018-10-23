package com.soap.spring.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soap.spring.product.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{
	@Autowired
	private SqlSession session;

	@Override
	public void insert(ProductDto dto) {
		session.insert("product.insert", dto);
	}

	@Override
	public void update(ProductDto dto) {
		session.update("product.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("product.delete", num);
	}
	@Override
	public List<ProductDto> getList() {
		return session.selectList("product.getList");
	}

	@Override
	public ProductDto detail(int num) {
		return session.selectOne("product.detail", num);
	}
}
