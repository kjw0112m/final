package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.OrderViewDto;
import com.kh17.panda.entity.OrdersDto;

@Repository
public class StaticDaoImpl implements StaticDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrdersDto> month() {
		return sqlSession.selectList("static.month");
	}
	
	@Override 
	public OrdersDto detail() {
		return sqlSession.selectOne("static.detail");
	}

	@Override
	public List<OrderViewDto> product_top() {
		return sqlSession.selectList("static.product_top");
	}

	@Override
	public List<OrderViewDto> seller_top() {
		return sqlSession.selectList("static.seller_top");
	}
	
}
