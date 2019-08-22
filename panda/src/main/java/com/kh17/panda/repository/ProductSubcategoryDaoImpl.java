package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.ProductSubcategoryDto;

@Repository
public class ProductSubcategoryDaoImpl implements ProductSubcategoryDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ProductSubcategoryDto> list(String seller_id) {
		return sqlSession.selectList("productSubcategory.list", seller_id);
	}

}
