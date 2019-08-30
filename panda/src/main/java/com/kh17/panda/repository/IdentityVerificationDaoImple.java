package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.IdentityVerificationDto;
@Repository
public class IdentityVerificationDaoImple implements IdentityVerificationDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void insert(String verification) {
		sqlSession.insert("Identity_verification.insert",verification);
	}

	@Override
	public IdentityVerificationDto get(String identity) {
		return sqlSession.selectOne("Identity_verification.get",identity);
	}

	@Override
	public void delete(String identity) {
		sqlSession.delete("Identity_verification.delete",identity);
	}
	@Override
	public void clear() {
		sqlSession.delete("Identity_verification.clear");
	}


}
