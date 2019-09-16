package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.FollowDto;

@Repository
public class FollowDaoImpl implements FollowDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void follow(FollowDto followDto) {
		sqlSession.insert("follow.insert", followDto);
	}

	@Override
	public void unFollow(FollowDto followDto) {
		sqlSession.delete("follow.delete", followDto);
	}

	@Override
	public int count(FollowDto followDto) {
		return sqlSession.selectOne("follow.count", followDto);
	}

	@Override
	public List<FollowDto> list(String member_id) {
		return sqlSession.selectList("follow.list", member_id);
	}
	
	
}
