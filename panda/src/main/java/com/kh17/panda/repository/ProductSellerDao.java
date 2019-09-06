package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.ProductSellerDto;

public interface ProductSellerDao {
	List<ProductSellerDto> newArrivals(int start, int end);
	List<ProductSellerDto> sellerList(String seller_id);
	List<ProductSellerDto> categoryList(int sub_category_id);
	ProductSellerDto get(int product_id);
	List<ProductSellerDto> search(String keyword);
	int count();
}
