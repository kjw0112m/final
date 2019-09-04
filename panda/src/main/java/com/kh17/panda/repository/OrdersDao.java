package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.vo.OrderListVO;
import com.kh17.panda.vo.OrderViewVO;

public interface OrdersDao {
	void initSequnce();

	List<OrderViewDto> list(OrderViewDto orderViewDto, List<OrderViewVO> orderViewVO, int start, int end, String[] csStatus, String[] tStatus);

	void insert(OrdersDto ordersDto);

	int seq();

	void cancel(OrdersDto ordersDto);
	
	void stat_change(OrdersDto orderDto);

	void delete();
	
	void invoice(OrdersDto ordersDto);

	int count(OrderViewDto orderViewDto, List<OrderViewVO> search, String[] csStatus, String[] tStatus);

	List<OrderViewDto> getTeam(String team);
	
	String getOrderId(int id);

	int count(OrderViewDto orderViewDto);

	List<OrderListVO> list(OrderViewDto orderViewDto, int start, int end);
}
