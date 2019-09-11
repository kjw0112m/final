package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.ProductSellerDto;

public interface ProductSellerDao {
	List<ProductSellerDto> newArrivals(int start, int end);
	List<ProductSellerDto> sellerList(String seller_id, int start, int end);
	List<ProductSellerDto> categoryList(int sub_category_id, int start, int end);
	ProductSellerDto get(int product_id);
	List<ProductSellerDto> search(String keyword, int start, int end);
	int count();
	int count(int sub_category_id);
	int count(String seller_id);
	int countSales();
	List<ProductSellerDto> salesList(int start, int end);
	int countSearch(String keyword);
}
