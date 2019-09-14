package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.PointDto;

public interface PointDao {
	
	List<PointDto> list(String member_id);
	
	int current(String member_id);
	
	void save(PointDto pointDto);

	int getPoint(String team);
}
