package com.kh17.panda.repository;

import com.kh17.panda.entity.AdminDto;

public interface AdminDao {
	
	//회원가입
	boolean regist(AdminDto adminDto);
	
	//회원 로그인
	AdminDto login(AdminDto adminDto);
	
	//회원 정보
	AdminDto get(String id);
}
