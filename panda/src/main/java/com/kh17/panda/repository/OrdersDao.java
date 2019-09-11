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

	void delete();
	
	void invoice(OrdersDto ordersDto);

	int count(OrderViewDto orderViewDto, List<OrderViewVO> search, String[] csStatus, String[] tStatus);
	
	int count(OrderViewDto orderViewDto, List<OrderViewVO> search);

	List<OrderViewDto> getTeam(String team);
	
	String getOrderId(int id);

	int count(OrderViewDto orderViewDto);

	List<OrderListVO> list(OrderViewDto orderViewDto, int start, int end);

	List<OrderViewDto> list(String team);

	List<OrderListVO> list(OrderViewDto orderViewDto, List<OrderViewVO> search, int start, int end);
	
	void t_change(OrdersDto ordersDto);
	void pay_change(OrdersDto ordersDto);
	void cs_change(OrdersDto ordersDto);
	
	int deliveryCount(OrderViewDto orderViewDto);

	void detach(String order_id, String team);

	int statCount(OrderViewDto orderViewDto);

	List<OrderListVO> statList(OrderViewDto orderViewDto, int start, int end);
}
