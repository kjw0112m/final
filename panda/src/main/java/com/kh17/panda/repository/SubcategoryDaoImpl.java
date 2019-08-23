package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.SubcategoryDto;

@Repository
public class SubcategoryDaoImpl implements SubcategoryDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<SubcategoryDto> list() {
		return sqlSession.selectList("subcategory.list");
	}

	@Override
	public String get(int sub_category_id) {
		return sqlSession.selectOne("subcategory.get", sub_category_id);
	}

	@Override
	public SubcategoryDto getDto(int sub_category_id) {
		return sqlSession.selectOne("subcategory.getDto", sub_category_id);
	}


}
