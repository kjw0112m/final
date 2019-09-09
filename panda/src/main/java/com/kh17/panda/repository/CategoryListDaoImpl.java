package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.CategoryListDto;

@Repository
public class CategoryListDaoImpl implements CategoryListDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CategoryListDto> list(int category_id, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("category_id", category_id);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("categoryList.list", map);
	}

	@Override
	public int count(int category_id) {
		return sqlSession.selectOne("categoryList.count", category_id);
	}
	
}
