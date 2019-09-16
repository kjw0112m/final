package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.OneDto;

public interface OneDao {
	int count(String type, String keyword);
	List<OneDto> list(String type, String keyword, int start, int end);
	void insertOne(OneDto oneDto);
	void updateOne(OneDto oneDto);
	void delOne(OneDto oneDto);
	void updateComment(OneDto oneDto);
	OneDto selectOne(String id);
}
