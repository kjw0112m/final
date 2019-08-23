package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.ProductSellerDto;

public interface ProductSellerDao {
	List<ProductSellerDto> newArrivals();
	List<ProductSellerDto> sellerList(String seller_id);
	List<ProductSellerDto> categoryList(int sub_category_id);
}
