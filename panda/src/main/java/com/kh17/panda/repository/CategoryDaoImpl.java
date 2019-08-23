package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public CategoryDto get(int category_id) {
		return sqlSession.selectOne("category.get", category_id);
	}
	
}
