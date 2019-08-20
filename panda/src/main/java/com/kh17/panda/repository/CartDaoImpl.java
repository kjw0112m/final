package com.kh17.panda.repository;

import java.util.List;

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
	public List<CartViewDto> list() {
		return sqlSession.selectList("cart.list");
	}
	
}
