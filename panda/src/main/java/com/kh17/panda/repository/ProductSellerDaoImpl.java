package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.ProductSellerDto;

@Repository
public class ProductSellerDaoImpl implements ProductSellerDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ProductSellerDto> newArrivals(int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("productSeller.newArrivals", map);
	}

	@Override
	public List<ProductSellerDto> sellerList(String seller_id) {
		return sqlSession.selectList("productSeller.sellerList", seller_id);
	}

	@Override
	public List<ProductSellerDto> categoryList(int sub_category_id) {
		return sqlSession.selectList("productSeller.categoryList", sub_category_id);
	}

	@Override
	public ProductSellerDto get(int product_id) {
		return sqlSession.selectOne("productSeller.get", product_id);
	}

	@Override
	public List<ProductSellerDto> search(String keyword) {
		return sqlSession.selectList("productSeller.search", keyword);
	}

	@Override
	public int count() {
		return sqlSession.selectOne("productSeller.count");
	}

}
