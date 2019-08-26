package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.vo.OrderViewVO;

public interface OrdersDao {
	void initSequnce();

	List<OrderViewDto> list(OrderViewDto orderViewDto, List<OrderViewVO> orderViewVO, int start, int end);

	void insert(OrdersDto ordersDto);

	int seq();

	void cancel(OrdersDto ordersDto);
	
	void stat_change(OrdersDto orderDto);

	void delete();
	
	void invoice(OrdersDto ordersDto);

	int count(OrderViewDto orderViewDto, List<OrderViewVO> search);

	List<OrderViewDto> getTeam(String team);
}
