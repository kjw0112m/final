package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.SubcategoryDto;
import com.kh17.panda.entity.TransportDto;

@Repository
public class TransportDaoImpl implements TransportDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<TransportDto> list() {
		return sqlSession.selectList("transport.list");
	}

}
