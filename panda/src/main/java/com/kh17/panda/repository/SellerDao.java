package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.SellerDto;

public interface SellerDao {
	List<SellerDto> list();

	void regist(SellerDto sellerDto);

	void edit(SellerDto sellerDto);

	List<SellerDto> get(String id);
}
