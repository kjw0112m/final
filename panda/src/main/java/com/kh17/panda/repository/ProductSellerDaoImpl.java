package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.ProductSellerDto;

@Repository
public class ProductSellerDaoImpl implements ProductSellerDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ProductSellerDto> newArrivals() {
		return sqlSession.selectList("productSeller.newArrivals");
	}

	@Override
	public List<ProductSellerDto> sellerList(String seller_id) {
		return sqlSession.selectList("productSeller.sellerList", seller_id);
	}

	@Override
	public List<ProductSellerDto> categoryList(int sub_category_id) {
		return sqlSession.selectList("productSeller.categoryList", sub_category_id);
	}

}
