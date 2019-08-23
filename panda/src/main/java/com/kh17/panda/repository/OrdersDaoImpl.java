package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.vo.OrderViewListVO;
import com.kh17.panda.vo.OrderViewVO;

@Repository
public class OrdersDaoImpl implements OrdersDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void initSequnce() {
		sqlSession.delete("order.dropSequence");
		sqlSession.update("order.createSequence");
	}

	@Override
	public List<OrderViewDto> list(OrderViewDto orderViewDto, OrderViewListVO orderViewListVO) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", orderViewDto);
		map.put("vo", orderViewListVO.getSearch());
		return sqlSession.selectList("order.list", map);
	}
}
