package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.SellerDto;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<SellerDto> list() {
		return sqlSession.selectList("seller.list");
	}
	
}
