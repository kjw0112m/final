package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.CartDto;
import com.kh17.panda.entity.CartViewDto;

public interface CartDao {
	void insert(CartDto cartDto);

	void delete(int id);

	List<CartViewDto> list(String member_id);

}
