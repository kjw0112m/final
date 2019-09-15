package com.kh17.panda.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.TotalDto;

@Repository
public class TotalDaoImpl implements TotalDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TotalDto> seller(String type, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("total.seller", map);
	}
	
	
}
