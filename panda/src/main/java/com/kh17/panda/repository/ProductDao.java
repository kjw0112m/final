package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.ProductDto;

public interface ProductDao {

	int getSequenceNumber();
	void insert(ProductDto productDto);
	ProductDto get(int id);
	void edit(ProductDto productDto);
	void delete(int id);
	List<ProductDto> list(String seller_id);

}
