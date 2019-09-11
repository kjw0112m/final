package com.kh17.panda.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.SellerDto;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean regist(SellerDto sellerDto) {
		try {
			sqlSession.insert("seller.regist", sellerDto);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	// 아이디 중복검사
		@Override
		public SellerDto idCheck(String id) {
			return sqlSession.selectOne("seller.idCheck", id);
		}
	//판매자 정보	
	@Override
	public SellerDto get(String id) {
		return sqlSession.selectOne("seller.get", id);
	}
//	마지막 판매자 로그인 시간
	@Override
	public void lastlogin(String id) {
		sqlSession.update("seller.lastlogin", id);
		
	}
//	로그인
	@Override
	public SellerDto login(SellerDto sellerDto) {
		SellerDto result = sqlSession.selectOne("seller.login", sellerDto);
		return result;
	}
	// 회원 탈퇴
		@Override
		public void delete(String id) {
			sqlSession.delete("seller.delete", id);
		}
		// 회원 정보 수정
		@Override
		public void change(SellerDto sellerDto) {
			sqlSession.update("seller.change", sellerDto);
		}
		//비밀번호 찾기 
		@Override
		public boolean findPassword(SellerDto sellerDto) {
			SellerDto result = sqlSession.selectOne("seller.findpw", sellerDto);
			return result != null;
		}
		//비밀번호 바꾸기
		@Override
		public void changePw(SellerDto sellerDto) {
			sqlSession.update("seller.changePw", sellerDto);
		}
		//아이디 찾기
		@Override
		public SellerDto findId(SellerDto sellerDto) {
			return sqlSession.selectOne("seller.findId", sellerDto);
		}
		
	
}
