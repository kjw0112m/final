package com.kh17.panda.repository;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.MemberDto;
@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession sqlSession;

	//회원 가입
	@Override
	public boolean regist(MemberDto memberDto) {
					try {
				sqlSession.insert("member.regist", memberDto);
				return true;
			}
			catch(Exception e) {
				return false;
			}
}
// 아이디 중복검사
	@Override
	public MemberDto idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}
	
//	로그인
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.login", memberDto);
		return result;
	}

	
//	회원정보
	@Override
	public MemberDto get(String id) {

		return sqlSession.selectOne("member.get", id);
	}

// 회원 탈퇴
	@Override
	public void delete(String id) {
		sqlSession.delete("member.delete", id);
	}
	
	// 회원 정보 수정
	@Override
	public void change(MemberDto memberDto) {
		sqlSession.update("member.change", memberDto);
		System.out.println(memberDto);
	}


	
	


}
