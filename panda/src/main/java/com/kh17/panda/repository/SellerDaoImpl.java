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

	@Override
	public void regist(SellerDto sellerDto) {
		sqlSession.insert("seller.regist", sellerDto);
	}

	@Override
	public void edit(SellerDto sellerDto) {
		sqlSession.update("seller.edit", sellerDto);
	}

	@Override
	public List<SellerDto> get(String id) {
		return sqlSession.selectOne(id);
	}
	
}
