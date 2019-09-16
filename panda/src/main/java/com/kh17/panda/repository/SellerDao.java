package com.kh17.panda.repository;

import com.kh17.panda.entity.SellerDto;

public interface SellerDao {

	boolean regist(SellerDto sellerDto);

	SellerDto idCheck(String id);

	SellerDto get(String id);

	void lastlogin(String id);

	void delete(String id);

	void change(SellerDto sellerDto);

	boolean findPassword(SellerDto sellerDto);

	void changePw(SellerDto sellerDto);

	SellerDto findId(SellerDto sellerDto);

	SellerDto login(SellerDto sellerDto);

}
