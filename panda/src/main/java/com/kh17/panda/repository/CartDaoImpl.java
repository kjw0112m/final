package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.CartDto;
import com.kh17.panda.entity.CartViewDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(CartDto cartDto) {
		sqlSession.insert("cart.insert", cartDto);
	}

	@Override
	public void delete(int id) {
		sqlSession.delete("cart.delete",id);
		
	}

	@Override
	public List<CartViewDto> list(String member_id) {
		return sqlSession.selectList("cart.list",member_id);
	}

	@Override
	public void quantity(int id, int quantity) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("quantity", quantity);
		sqlSession.update("cart.quantity", map);
	}

	@Override
	public List<CartViewDto> list(int[] id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return sqlSession.selectList("cart.order", map);
	}
	
}
