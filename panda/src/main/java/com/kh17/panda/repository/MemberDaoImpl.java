package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean regist(MemberDto memberDto) {
		try {
			sqlSession.insert("member.regist", memberDto);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
