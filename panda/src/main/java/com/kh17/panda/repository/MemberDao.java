package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.MemberDto;
import com.kh17.panda.entity.MyInfoDto;

public interface MemberDao {
	
	//회원가입
	boolean regist(MemberDto memberDto);
	
	//아이디 중복확인
	MemberDto idCheck(String id);
	
	//회원 로그인
	MemberDto login(MemberDto memberDto);
	
	//회원 정보
	MemberDto get(String id);
	
	//마지막 로그인 시간
	void lastlogin(String id);
	
	//회원 탈퇴
	void delete(String id);
	
	//회원 정보 변견
	void change(MemberDto memberDto);
	
	//비밀 번호 찾기
	boolean findPassword(MemberDto memberDto);
	
	//비밀 번호 변경
	void changePw(MemberDto memberDto);
	
	//아이디 찾기
	MemberDto findId(MemberDto memberDto);
	
	//마지막 비밀번호 변경 날자
	void lastchangepw(String id);
	
	//관리자 회원 검색
	List<MemberDto> search(String type, String keyword, int start, int end);
	MemberDto emailCheck(String email);

	int count(String type, String keyword);

	void gradeChange(MemberDto memberDto);

	MyInfoDto myInfo(String member_id);
	
}
