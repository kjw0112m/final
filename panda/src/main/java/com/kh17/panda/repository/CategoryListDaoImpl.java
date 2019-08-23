package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.CategoryListDto;

@Repository
public class CategoryListDaoImpl implements CategoryListDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CategoryListDto> list(int category_id) {
		return sqlSession.selectList("categoryList.list", category_id);
	}
	
}
