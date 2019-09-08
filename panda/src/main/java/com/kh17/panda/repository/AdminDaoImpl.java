package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession sqlSession;

	// 회원 가입
	@Override
	public boolean regist(AdminDto adminDto) {

		try {
			sqlSession.insert("admin.regist", adminDto);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

//	로그인
	@Override
	public AdminDto login(AdminDto adminDto) {
		AdminDto result = sqlSession.selectOne("admin.login", adminDto);
		return result;
	}

//	회원정보
	@Override
	public AdminDto get(String id) {

		return sqlSession.selectOne("admin.get", id);
	}

}
