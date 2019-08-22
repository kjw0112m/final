package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.SizesDto;

@Repository
public class SizesDaoImpl implements SizesDao{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void regist(SizesDto sizesDto) {
		sqlSession.insert("sizes.regist", sizesDto);
	}

	@Override
	public List<String> get(int id) {
		return sqlSession.selectList("sizes.get", id);
	}

	@Override
	public void edit(SizesDto sizesDto) {
		sqlSession.update("sizes.edit", sizesDto);
	}

}
