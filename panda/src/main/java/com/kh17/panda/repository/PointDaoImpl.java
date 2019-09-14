package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.PointDto;

@Repository
public class PointDaoImpl implements PointDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PointDto> list(String member_id) {
		return sqlSession.selectList("point.list", member_id);
	}

	@Override
	public int current(String member_id) {
		return sqlSession.selectOne("point.current", member_id);
	}

	@Override
	public void save(PointDto pointDto) {
		sqlSession.insert("point.save", pointDto);
	}

	@Override
	public int getPoint(String team) {
		return sqlSession.selectOne("point.getPoint", team);
	}
	
	
	
}
