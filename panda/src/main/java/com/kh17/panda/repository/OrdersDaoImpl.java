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
	public void cancel(OrdersDto ordersDto) {
		sqlSession.delete("order.cs_status", ordersDto);
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
	public void stat_change(OrdersDto ordersDto) {
		sqlSession.delete("order.status", ordersDto);
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
		return sqlSession.selectOne("order.countUser", orderViewDto);
	}

	@Override
	public String getOrderId(int id) {
		return sqlSession.selectOne("order.getOrderId", id);
	}
}
