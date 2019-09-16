package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.FollowDto;

public interface FollowDao {
	void follow(FollowDto followDto);
	void unFollow(FollowDto followDto);
	int count(FollowDto followDto);
	List<FollowDto> list(String member_id);
}
