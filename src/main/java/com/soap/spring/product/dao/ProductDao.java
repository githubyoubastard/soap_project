package com.soap.spring.product.dao;

import java.util.List;

import com.soap.spring.product.dto.ProductDto;

public interface ProductDao {
	public void insert(ProductDto dto);
	public void update(ProductDto dto);
	public void delete(int num);
	public ProductDto detail(int num);
	public List<ProductDto> getList();
}
