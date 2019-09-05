package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.ProductSubcategoryDto;

public interface ProductSubcategoryDao {

	List<ProductSubcategoryDto> list(String seller_id, int start, int end);
	List<ProductSubcategoryDto> search(String type, String keyword, int start, int end, String seller_id);
	int count(String type, String keyword);

}
