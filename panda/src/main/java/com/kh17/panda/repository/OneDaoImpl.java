package com.kh17.panda.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.OneDto;
@Repository
public class OneDaoImpl implements OneDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("one.count", param);
	}

	@Override
	public List<OneDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
		//검색일 때 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		//검색이든 목록이든 페이징 구간을 전달
		param.put("start", start);
		param.put("end", end);
				
		return sqlSession.selectList("one.list", param);
	}

	@Override
	public void insertOne(OneDto oneDto) {
		sqlSession.insert("one.insertOne",oneDto);
	}

	@Override
	public void updateOne(OneDto oneDto) {
		sqlSession.update("one.updateOne", oneDto);
	}

	@Override
	public void delOne(OneDto oneDto) {
		sqlSession.delete("one.delOne",oneDto);
	}

	@Override
	public OneDto selectOne(String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return sqlSession.selectOne("one.selectOne", map);
	}

	@Override
	public void updateComment(OneDto oneDto) {
		oneDto.setState("Y");
		sqlSession.update("one.updateComment", oneDto);
	}

	

}
