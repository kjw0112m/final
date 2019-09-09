package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;
import com.kh17.panda.vo.OrderListVO;
import com.kh17.panda.vo.OrderViewVO;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void initSequnce() {
		sqlSession.delete("order.dropSequence");
		sqlSession.update("order.createSequence");
	}

	@Override
	public List<OrderViewDto> list(OrderViewDto orderViewDto, List<OrderViewVO> orderViewVO, int start, int end,
			String[] csStatus, String[] tStatus) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("vo", orderViewVO);
		map.put("start", start);
		map.put("end", end);
		map.put("csStatus", csStatus);
		map.put("tStatus", tStatus);

		return sqlSession.selectList("order.list", map);
	}
	
	@Override
	public List<OrderListVO> list(OrderViewDto orderViewDto, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("order.myOrder", map);
	}

	@Override
	public void insert(OrdersDto ordersDto) {
		System.out.println(ordersDto);
		sqlSession.insert("order.insert", ordersDto);
	}

	@Override
	public int seq() {
		return sqlSession.selectOne("order.seq");
	}

	@Override
	public void delete() {
		sqlSession.delete("order.delete");
	}

	@Override
	public void invoice(OrdersDto ordersDto) {
		sqlSession.update("order.invoice", ordersDto);
	}


	@Override
	public List<OrderViewDto> getTeam(String team) {
		return sqlSession.selectList("order.getTeam", team);
	}

	@Override
	public int count(OrderViewDto orderViewDto, List<OrderViewVO> search, String[] csStatus, String[] tStatus) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("vo", search);
		map.put("csStatus", csStatus);
		map.put("tStatus", tStatus);
		return sqlSession.selectOne("order.count", map);
	}
	
	@Override
	public int count(OrderViewDto orderViewDto) {
		return sqlSession.selectOne("order.myOrderCount", orderViewDto);
	}

	@Override
	public String getOrderId(int id) {
		return sqlSession.selectOne("order.getOrderId", id);
	}

	@Override
	public List<OrderViewDto> list(String team) {
		return sqlSession.selectList("order.getDetail", team);
	}

	@Override
	public List<OrderListVO> list(OrderViewDto orderViewDto, List<OrderViewVO> orderViewVO, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("vo", orderViewVO);
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList("order.deliveryView", map);
	}

	@Override
	public int count(OrderViewDto orderViewDto, List<OrderViewVO> search) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("vo", search);
		
		try {
			return sqlSession.selectOne("order.deliveryCount", map);
		} catch(NullPointerException e) {
			return 0;
		}
	}

	@Override
	public void t_change(OrdersDto ordersDto) {
		sqlSession.update("order.t_status", ordersDto);
	}

	@Override
	public void pay_change(OrdersDto ordersDto) {
		sqlSession.update("order.pay_status", ordersDto);
	}

	@Override
	public void cs_change(OrdersDto ordersDto) {
		sqlSession.update("order.cs_status", ordersDto);
	}

	@Override 
	public int deliveryCount(OrderViewDto orderViewDto) {
		return sqlSession.selectOne("order.status_count", orderViewDto);
	}

	@Override
	public void detach(String order_id) {
		sqlSession.update("order.detach", order_id);
	}

	@Override
	public int statCount(OrderViewDto orderViewDto) {
		return sqlSession.selectOne("order.myStatCount", orderViewDto);
	}

	@Override
	public List<OrderListVO> statList(OrderViewDto orderViewDto, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("order.myStat", map);
	}

}
