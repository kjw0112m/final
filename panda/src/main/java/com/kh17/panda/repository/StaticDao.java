package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;

public interface StaticDao {
	List<OrdersDto> month();

	OrdersDto detail();
	
	List<OrderViewDto> product_top();
	List<OrderViewDto> seller_top();
}
