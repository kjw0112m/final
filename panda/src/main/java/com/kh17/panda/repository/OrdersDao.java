package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.vo.OrderViewListVO;
import com.kh17.panda.vo.OrderViewVO;

public interface OrdersDao {
	void initSequnce();

	List<OrderViewDto> list(OrderViewDto orderViewDto, OrderViewListVO orderViewListVO);
}
