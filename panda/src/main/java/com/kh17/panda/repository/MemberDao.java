package com.kh17.panda.repository;

import com.kh17.panda.entity.MemberDto;

public interface MemberDao {
	boolean regist(MemberDto memberDto);
	MemberDto login(MemberDto memberDto);
	MemberDto get(String id);
	void delete(String id);
}
