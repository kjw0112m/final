package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDaoImpl implements OrdersDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void initSequnce() {
		sqlSession.delete("order.dropSequence");
		sqlSession.update("order.createSequence");
		
	}
	
	
}
