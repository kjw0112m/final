package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.ProductSubcategoryDto;

@Repository
public class ProductSubcategoryDaoImpl implements ProductSubcategoryDao{

	@Autowired
	SqlSession sqlSession;
	
//	@Override
//	public List<ProductSubcategoryDto> list(String seller_id) {
//		return sqlSession.selectList("productSubcategory.list", seller_id);
//	}

	@Override
	public List<ProductSubcategoryDto> list(String seller_id, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		param.put("seller_id", seller_id);
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("productSubcategory.list", param);
	}
	
	@Override
	public int count(String seller_id, String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		param.put("seller_id", seller_id);
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("productSubcategory.count", param);
		}
	
	@Override
	public List<ProductSubcategoryDto> search(String type, String keyword, int start, int end, String seller_id) {
		Map<String, Object> param = new HashMap<>();
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
			param.put("seller_id", seller_id);
		}
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("productSubcategory.search", param);
	}



}
