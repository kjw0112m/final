package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.PointDto;

public interface PointDao {
	
	List<PointDto> list(String member_id);
	
	int current(String member_id);
	
	void save(PointDto pointDto);

	int getPoint(String team);
	
	void typeChange(PointDto pointDto);
	
	void cancel(PointDto pointDto);

	int count(String member_id);

	List<PointDto> list(String member_id, int start, int end);
}
