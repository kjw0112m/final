package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.ProductSubcategoryDto;

public interface ProductSubcategoryDao {

	List<ProductSubcategoryDto> list(String seller_id);

}
