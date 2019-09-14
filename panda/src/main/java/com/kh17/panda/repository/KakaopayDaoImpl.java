package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.KakaoPayDto;

@Repository
public class KakaopayDaoImpl implements KakaopayDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public KakaoPayDto get(String team) {
		return sqlSession.selectOne("kakao.get", team);
	}

	@Override
	public void pay(KakaoPayDto kakaoPayDto) {
		sqlSession.insert("kakao.pay", kakaoPayDto);
	}

	@Override
	public void team(KakaoPayDto kakaoPayDto) {
		sqlSession.update("kakao.team", kakaoPayDto);
	}
	
}
