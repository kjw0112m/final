package com.kh17.panda.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
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
				e.printStackTrace();
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
//	마지막 회원 로그인 시간
	@Override
	public void lastlogin(String id) {
		sqlSession.update("member.lastlogin", id);
		
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
	}
	//비밀번호 찾기 
	@Override
	public boolean findPassword(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member.findpw", memberDto);
		return result != null;
	}
	//비밀번호 바꾸기
	@Override
	public void changePw(MemberDto memberDto) {
		sqlSession.update("member.changePw", memberDto);
	}
	//아이디 찾기
	@Override
	public MemberDto findId(MemberDto memberDto) {
		return sqlSession.selectOne("member.findId", memberDto);
	}
	@Override
	public void lastchangepw(String id) {
		sqlSession.update("member.lastchangepw", id);
		
	}
	
	//관리자 사용
	//회원 검색
	@Override
	public List<MemberDto> search(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		return sqlSession.selectList("member.search", param);
	}

	
	
	
	}
	
	


